import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:whatcard/common/index.dart';
import 'package:whatcard/models/user.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/services/game.dart';
import 'package:whatcard/theme.dart';

class JoinGamePage extends HookConsumerWidget {
  const JoinGamePage({Key? key}) : super(key: key);

  bool isJoinCodeValid(String name) => name.isNotEmpty && name.length == 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final gameService = ref.watch(gameServiceProvider);
    final analService = ref.watch(analyticsServiceProvider);
    final defaultDisplayName =
        ref.watch(sharedPreferencesServiceProvider).getDefaultDisplayName();

    final joinCodeController = useTextEditingController(text: '');
    final update = useValueListenable(joinCodeController);
    final isValid =
        useMemoized(() => isJoinCodeValid(joinCodeController.text), [update]);

    return Scaffold(
      backgroundColor: WhatCardTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: WhatCardTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_rounded,
            color: WhatCardTheme.of(context).primaryText,
            size: 30,
          ),
          color: WhatCardTheme.of(context).primaryText,
          onPressed: () => Navigator.of(context).pop(),
          // size: 30,
        ),
        title: Text(
          'Join Game',
          style: WhatCardTheme.of(context).title2.override(
                fontFamily: WhatCardTheme.of(context).title2Family,
                color: Colors.black,
                fontSize: 22,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                  WhatCardTheme.of(context).title2Family,
                ),
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: TopSheetLayout(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Join Code',
                  style: WhatCardTheme.of(context).dataText1,
                ),
              ),
              Flexible(
                flex: 7,
                child: TextFormField(
                  controller: joinCodeController,
                  obscureText: false,
                  decoration: getTextInputDecoration(
                    context,
                    labelText: "Join Code",
                    variant: InputDecorationType.small,
                  ),
                  style: WhatCardTheme.of(context).bodyText1,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          currentUser.when(
            data: (WhatCardUser? user) {
              return isValid
                  ? Button(
                      type: ButtonType.primary,
                      title: "Join",
                      onPressed: () async {
                        final router = GoRouter.of(context);
                        final messenger = ScaffoldMessenger.of(context);

                        final userDisplayName = defaultDisplayName ?? 'user';
                        final uid = user!.uid;
                        final joinCode = joinCodeController.text;

                        try {
                          await gameService.joinGame(
                            userDisplayName,
                            uid,
                            joinCode,
                          );

                          await analService.logJoinGame(joinCode: joinCode);

                          router.pop();

                          // Catch game service errors here and display accurate message
                        } on GameServiceException catch (e) {
                          messenger.showSnackBar(
                            SnackBar(
                              content: Text(e.message),
                            ),
                          );

                          // Any other errors general message
                        } catch (e) {
                          messenger.showSnackBar(
                            const SnackBar(
                              content: Text("Error joining game"),
                            ),
                          );
                        }
                      },
                    )
                  : const Button(
                      type: ButtonType.primary,
                      title: "Join",
                    );
            },
            error: (_, __) => const Text('Error'),
            loading: () => const CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
