import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:whatcard/common/index.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/theme.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  bool isUsernameValid(String code) => code.length < 36;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setDefaultDisplayName =
        ref.watch(sharedPreferencesServiceProvider).setDefaultDisplayName;

    final usernameController = useTextEditingController(text: '');
    final update = useValueListenable(usernameController);
    final isValid =
        useMemoized(() => isUsernameValid(usernameController.text), [update]);

    return Scaffold(
      backgroundColor: WhatCardTheme.of(context).primaryBackground,
      appBar: getLoginAppBar(context),
      body: TopSheetLayout(
        children: [
          Text(
            'Let\'s pick a username',
            style: WhatCardTheme.of(context).title3,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '(you can change this later)',
            style: WhatCardTheme.of(context).subtitle1,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: usernameController,
            decoration: getTextInputDecoration(
              context,
              labelText: 'Username',
              variant: InputDecorationType.large,
            ),
            maxLength: 36,
            style: WhatCardTheme.of(context).bodyText1,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 16,
          ),
          isValid
              ? Button(
                  type: ButtonType.primary,
                  onPressed: () async {
                    final router = GoRouter.of(context);
                    await setDefaultDisplayName(usernameController.text);
                    router.goNamed('HomePage');
                  },
                  title: 'Continue',
                )
              : const Button(
                  type: ButtonType.primary,
                  onPressed: null,
                  title: 'Continue',
                ),
        ],
      ),
    );
  }
}
