import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:whatcard/common/index.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/theme.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPrefsProvider = ref.watch(sharedPreferencesServiceProvider);
    final authService = ref.watch(authServiceProvider);

    // Text controllers
    final displayNameController = useTextEditingController(
        text: sharedPrefsProvider.getDefaultDisplayName());

    // Listenables for text controllers
    final displayNameUpdate = useValueListenable(displayNameController);

    // Is Valid fn makes sure text fields are valid
    // final isValid = useMemoized(() {
    //   final gameNameValid = isGameNameValid(gameNameController.text);

    //   return gameNameValid ;
    // }, [displayNameUpdate]);

    return Scaffold(
      backgroundColor: WhatCardTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: WhatCardTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Settings',
          style: WhatCardTheme.of(context).title2.override(
                fontFamily: WhatCardTheme.of(context).title2Family,
                color: Colors.black,
                fontSize: 22,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(WhatCardTheme.of(context).title2Family),
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: MainLayout(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User',
                style: WhatCardTheme.of(context).title3,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Username',
                    style: WhatCardTheme.of(context).bodyText1,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: displayNameController,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Display Name'),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Profile Picture',
                    style: WhatCardTheme.of(context).bodyText1,
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
          const SizedBox(height: 36),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General',
                style: WhatCardTheme.of(context).title3,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Marketing Emails',
                    style: WhatCardTheme.of(context).bodyText1,
                  ),
                  const Spacer(),
                  Switch(
                    onChanged: (bool value) {
                      print("changed");
                    },
                    value: true,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Sound Effects',
                    style: WhatCardTheme.of(context).bodyText1,
                  ),
                  const Spacer(),
                  Switch(
                    onChanged: (bool value) {
                      print("changed");
                    },
                    value: true,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Music',
                    style: WhatCardTheme.of(context).bodyText1,
                  ),
                  const Spacer(),
                  Switch(
                    onChanged: (bool value) {
                      print("changed");
                    },
                    value: true,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 36),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notifications',
                style: WhatCardTheme.of(context).title3,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Invitations',
                    style: WhatCardTheme.of(context).bodyText1,
                  ),
                  const Spacer(),
                  Switch(
                    onChanged: (bool value) {
                      print("changed");
                    },
                    value: true,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Game Activity',
                    style: WhatCardTheme.of(context).bodyText1,
                  ),
                  const Spacer(),
                  Switch(
                    onChanged: (bool value) {
                      print("changed");
                    },
                    value: true,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Turn Reminders',
                    style: WhatCardTheme.of(context).bodyText1,
                  ),
                  const Spacer(),
                  Switch(
                    onChanged: (bool value) {
                      print("changed");
                    },
                    value: true,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Button(
            title: 'Sign Out',
            type: ButtonType.primary,
            onPressed: () => authService.signOut(),
          ),
        ],
      ),
    );
  }
}
