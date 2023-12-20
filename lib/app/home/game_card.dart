import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:whatcard/models/game.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/theme.dart';

class GameCardWidget extends ConsumerWidget {
  const GameCardWidget({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    String playerAmount = game.players.toList().length.toString();
    bool thisPlayersTurn =
        game.currentTurn.keys.first == currentUser.value!.uid;

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      color: Colors.blue.withAlpha(20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () async {
          GoRouter.of(context).goNamed('GamePage', extra: game.gameId);
        },
        onLongPress: () => print('OnLongPress'),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.displayName,
                      style: WhatCardTheme.of(context).subtitle1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _getGameStatusText(thisPlayersTurn),
                      style: WhatCardTheme.of(context).bodyText1,
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Players',
                      style: WhatCardTheme.of(context).bodyText1,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0,
                            0,
                            4,
                            0,
                          ),
                          child: Text(
                            playerAmount,
                            style: WhatCardTheme.of(context).title1,
                          ),
                        ),
                        Icon(
                          Icons.person,
                          color: WhatCardTheme.of(context).primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
            // child: Column(
            //   mainAxisSize: MainAxisSize.max,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsetsDirectional.fromSTEB(12, 6, 12, 6),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            // Text(
            //   game.displayName,
            //   style: WhatCardTheme.of(context).subtitle1,
            // ),
            //           Column(
            //             mainAxisSize: MainAxisSize.max,
            //             crossAxisAlignment: CrossAxisAlignment.end,
            //             children: [
            // Text(
            //   'Players',
            //   style: WhatCardTheme.of(context).bodyText1,
            // ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsetsDirectional.fromSTEB(
            //         0,
            //         0,
            //         4,
            //         0,
            //       ),
            //       child: Text(
            //         playerAmount,
            //         style: WhatCardTheme.of(context).title1,
            //       ),
            //     ),
            //     const Icon(
            //       Icons.person,
            //       color: Color(0xFF4B39EF),
            //       size: 20,
            //     ),
            //                 ],
            //               )
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 8),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            // Text(
            //   _getGameStatusText(thisPlayersTurn),
            //   style: WhatCardTheme.of(context).bodyText1,
            // )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            ),
      ),
    );
  }

  String _getGameStatusText(bool thisPlayersTurn) {
    if (game.gameStatus == GameStatus.isInPreLobby) {
      return 'Waiting to start';
    } else if (game.gameStatus == GameStatus.isInProgress) {
      return '${thisPlayersTurn ? "Your" : game.currentTurn.values.first} turn';
    } else {
      return 'Game Ended';
    }
  }
}
