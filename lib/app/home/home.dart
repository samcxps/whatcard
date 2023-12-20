import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:whatcard/app/home/game_list.dart';
import 'package:whatcard/common/index.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/theme.dart';

import './new_game_sheet_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userService = ref.watch(userServiceProvider);
    final currUser = ref.watch(currentUserProvider);
    final defaultDisplayName =
        ref.watch(sharedPreferencesServiceProvider).getDefaultDisplayName();

    userService.updateUserFCMToken(currUser.valueOrNull);

    return Scaffold(
      backgroundColor: WhatCardTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: WhatCardTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(
              Icons.emoji_events_outlined,
              color: WhatCardTheme.of(context).primaryText,
              size: 25,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              'WhatCard',
              style: WhatCardTheme.of(context).title2.override(
                    fontFamily: WhatCardTheme.of(context).title2Family,
                    color: Colors.black,
                    fontSize: 22,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(WhatCardTheme.of(context).title2Family),
                  ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                print('Buy credits');
              },
              child: Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: WhatCardTheme.of(context).primaryText,
                    size: 25,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "123",
                    style: WhatCardTheme.of(context).dataText1,
                  )
                ],
              ),
            ),
          )
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: MainLayout(
        children: [
          Text(
            'Hey, $defaultDisplayName',
            style: WhatCardTheme.of(context).title1,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: NewGameCard(
                    text: "Create a Game",
                    icon: Icons.queue,
                    onPress: () =>
                        GoRouter.of(context).goNamed('CreateGamePage'),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: NewGameCard(
                    text: "Join a Game",
                    icon: Icons.person_add,
                    onPress: () => GoRouter.of(context).goNamed('JoinGamePage'),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Flexible(child: GameList()),
        ],
      ),
    );
  }
}

class NewGameCard extends StatelessWidget {
  const NewGameCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onPress,
  });

  final String text;
  final IconData icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: WhatCardTheme.of(context).primaryColor,
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
          child: Column(
            children: [
              Icon(
                icon,
                color: WhatCardTheme.of(context).secondaryText,
                size: 30,
              ),
              const SizedBox(height: 16),
              Text(
                text,
                style: WhatCardTheme.of(context).subtitle2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
