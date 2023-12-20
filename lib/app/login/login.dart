import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:phone_number/phone_number.dart';

import 'package:whatcard/theme.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/common/index.dart';

class LoginPage extends HookConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  // Mask for text field
  final phoneNumberMask = MaskTextInputFormatter(mask: '### ###-####');

  // Validate users number
  Future<bool> isPhoneNumberValid(String text) async {
    return await PhoneNumberUtil().validate(text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

    final phoneNumberController = useTextEditingController(text: '');
    final update = useValueListenable(phoneNumberController);
    final isValidSnapshot = useFuture<bool>(
        useMemoized(() => isPhoneNumberValid(update.text), [update]));

    return Scaffold(
      backgroundColor: WhatCardTheme.of(context).primaryBackground,
      appBar: getLoginAppBar(context),
      body: TopSheetLayout(
        children: [
          Text(
            'Welcome!',
            style: WhatCardTheme.of(context).title3,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Let\'s start by signing in',
            style: WhatCardTheme.of(context).subtitle1,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: phoneNumberController,
            decoration: getTextInputDecoration(
              context,
              labelText: 'Phone Number',
              variant: InputDecorationType.large,
              prefixText: "+1   ",
            ),
            style: WhatCardTheme.of(context).bodyText1,
            keyboardType: TextInputType.phone,
            inputFormatters: [phoneNumberMask],
          ),
          const SizedBox(
            height: 16,
          ),
          isValidSnapshot.hasData == false || isValidSnapshot.data == false
              ? const Button(
                  type: ButtonType.primary,
                  onPressed: null,
                  title: 'Continue',
                )
              : Button(
                  type: ButtonType.primary,
                  onPressed: () async {
                    final router = GoRouter.of(context);

                    // Parsing
                    PhoneNumber phoneNumber = await PhoneNumberUtil().parse(
                      phoneNumberController.text,
                    );

                    await authService.verifyPhone(phoneNumber.e164);

                    router.pushNamed('VerifyPhonePage');
                  },
                  title: 'Continue',
                ),
        ],
      ),
    );
  }
}
