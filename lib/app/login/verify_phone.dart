import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:whatcard/common/index.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/theme.dart';

class VerifyPhonePage extends HookConsumerWidget {
  VerifyPhonePage({Key? key}) : super(key: key);

  // Mask for text field
  final verificationCodeMask = MaskTextInputFormatter(mask: '######');

  // Validate verification code
  bool isVerificationCodeValid(String code) => code.length == 6;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);
    final userService = ref.watch(userServiceProvider);
    final analService = ref.watch(analyticsServiceProvider);

    final verificationCodeController = useTextEditingController(text: '');
    final update = useValueListenable(verificationCodeController);
    final isValid = useMemoized(
        () => isVerificationCodeValid(verificationCodeController.text),
        [update]);

    return Scaffold(
      backgroundColor: WhatCardTheme.of(context).primaryBackground,
      appBar: getLoginAppBar(context, allowBack: true),
      body: TopSheetLayout(
        children: [
          Text(
            'We sent you a text 👀',
            style: WhatCardTheme.of(context).title3,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Verify your number',
            style: WhatCardTheme.of(context).subtitle1,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: verificationCodeController,
            decoration: getTextInputDecoration(
              context,
              labelText: 'Code',
              variant: InputDecorationType.large,
            ),
            style: WhatCardTheme.of(context).bodyText1,
            keyboardType: TextInputType.number,
            inputFormatters: [verificationCodeMask],
          ),
          const SizedBox(
            height: 16,
          ),
          isValid == false
              ? const Button(
                  type: ButtonType.primary,
                  onPressed: null,
                  title: 'Continue',
                )
              : Button(
                  type: ButtonType.primary,
                  onPressed: () async {
                    final router = GoRouter.of(context);

                    final user = await authService.verifyCode(
                      verificationCodeController.text,
                    );

                    if (user == null) return;

                    final didCreateUser =
                        await userService.maybeCreateUser(user);

                    if (didCreateUser) {
                      await analService.instance.logSignUp(
                        signUpMethod: "PhoneAuth",
                      );
                    } else {
                      await analService.instance.logLogin(
                        loginMethod: "PhoneAuth",
                      );
                    }

                    return didCreateUser
                        ? router.goNamed('OnboardingPage')
                        : router.goNamed('HomePage');
                  },
                  title: 'Continue',
                ),
        ],
      ),
    );
  }
}
