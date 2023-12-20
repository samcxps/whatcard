import 'package:flutter/material.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import 'package:whatcard/common/index.dart';

import 'package:whatcard/models/game.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/theme.dart';

import 'card_stack.dart';

class GamePage extends HookWidget {
  const GamePage({super.key, required this.gameId});

  final String gameId;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    final selectedCard = useState(0);
    final selectedTarget = useState<String?>(null);

    return FirestoreBuilder<GameDocumentSnapshot>(
      ref: gamesRef.doc(gameId),
      builder: (
        context,
        AsyncSnapshot<GameDocumentSnapshot> snapshot,
        Widget? child,
      ) {
        if (snapshot.hasError) {
          return const Text('Something went wrong!');
        }

        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        // Access the UserDocumentSnapshot
        GameDocumentSnapshot gameSnapshot = snapshot.requireData;

        if (!gameSnapshot.exists) {
          return const GameDoesNotExistView();
        }

        final game = gameSnapshot.data!;

        return GameView(
          game: game,
          selectedCard: selectedCard,
          isLoading: isLoading,
          selectedTarget: selectedTarget,
        );
      },
    );
  }
}

class GameView extends HookConsumerWidget {
  const GameView({
    super.key,
    required this.game,
    required this.selectedCard,
    required this.isLoading,
    required this.selectedTarget,
  });

  final Game game;
  final ValueNotifier<int> selectedCard;
  final ValueNotifier<bool> isLoading;
  final ValueNotifier<String?> selectedTarget;

  ///
  /// Fn called when share button is clicked
  ///
  Future<ShareResult> _onShare(BuildContext context, Game game) async {
    final box = context.findRenderObject() as RenderBox?;

    return await Share.shareWithResult(
      "Join my WhatCard game!\n${game.joinCode}",
      subject: "Share ${game.displayName}",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCardId = useState(0);

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
          onPressed: () => GoRouter.of(context).pop(),
          // size: 30,
        ),
        title: Text(
          game.displayName,
          style: WhatCardTheme.of(context).title2.override(
                fontFamily: WhatCardTheme.of(context).title2Family,
                color: Colors.black,
                fontSize: 22,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                  WhatCardTheme.of(context).title2Family,
                ),
              ),
        ),
        actions: _getAppBarActions(context, ref),
        centerTitle: false,
        elevation: 0,
      ),
      body: MainLayout(
        children: _getMainLayoutChildren(context, ref, selectedCardId),
      ),
    );
  }

  ///
  /// Function to return actions for AppBar
  ///
  /// If in pre lobby, we show the share button so players can join.
  /// Else, we show nothing.
  ///
  /// Don't want players sharing/joining game after starting.
  ///
  List<Widget> _getAppBarActions(BuildContext context, WidgetRef ref) {
    final analService = ref.watch(analyticsServiceProvider);

    // If game is in pre lobby we want to show the share button
    if (game.gameStatus == GameStatus.isInPreLobby) {
      return [
        IconButton(
          icon: Icon(
            Icons.ios_share,
            color: WhatCardTheme.of(context).primaryText,
            size: 25,
          ),
          color: WhatCardTheme.of(context).primaryText,
          onPressed: () async {
            final result = await _onShare(context, game);

            if (result.status == ShareResultStatus.success) {
              await analService.logShareGame(gameId: game.gameId);
            }
          },
          // size: 30,
        )
      ];
    }

    // Otherwise, no actions
    return [];
  }

  List<Widget> _getMainLayoutChildren(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<int> selectedCardId,
  ) {
    switch (game.gameStatus) {
      case GameStatus.isInPreLobby:
        return _getGameIsInPreLobbyScreen(
          context,
          ref,
        );

      case GameStatus.isInProgress:
        return _getGameIsInProgressScreen(context, ref, selectedCardId);

      case GameStatus.isOver:
        return _getGameIsOverScreen(context);
    }
  }

  ///
  /// Function to return Widget for pre lobby game screen
  /// Keeps the main build() function clean
  ///
  List<Widget> _getGameIsInPreLobbyScreen(BuildContext context, WidgetRef ref) {
    final gameService = ref.watch(gameServiceProvider);
    final currentUser = ref.watch(currentUserProvider);
    final analService = ref.watch(analyticsServiceProvider);

    final currUserUid = currentUser.value!.uid;
    final thisPlayerIsHost = game.host.keys.first == currUserUid;

    Widget getStartButton() {
      if (thisPlayerIsHost) {
        return game.players.length > 1
            ? Button(
                title: "Start Game",
                type: ButtonType.primary,
                onPressed: () async {
                  final messenger = ScaffoldMessenger.of(context);

                  try {
                    await gameService.startGame(game);
                    await analService.logStartGame(gameId: game.gameId);
                  } catch (e) {
                    messenger.showSnackBar(
                      const SnackBar(
                        content: Text("Error starting game"),
                      ),
                    );
                  }
                },
              )
            : const Button(
                title: "Start Game",
                type: ButtonType.primary,
              );
      }

      return const SizedBox.shrink();
    }

    return [
      Text(
        game.players.length > 1
            ? thisPlayerIsHost
                ? "Waiting for you to start game"
                : "Waiting for game to start"
            : "Need at least two players to start",
        style: WhatCardTheme.of(context).subtitle1,
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        "Current Players",
        style: WhatCardTheme.of(context).subtitle1,
      ),
      const SizedBox(
        height: 4,
      ),
      Flexible(
        child: ListView.builder(
          itemCount: game.players.length,
          itemBuilder: (context, index) {
            final player = game.players[index];
            return Text(
              player.displayName,
              style: WhatCardTheme.of(context).bodyText1,
            );
          },
        ),
      ),
      getStartButton()
    ];
  }

  ///
  /// Function to return Widget for pre lobby game screen
  /// Keeps the main build() function clean
  ///
  List<Widget> _getGameIsInProgressScreen(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<int> selectedCardId,
  ) {
    final currentUser = ref.watch(currentUserProvider);
    final gameService = ref.watch(gameServiceProvider);
    final analService = ref.watch(analyticsServiceProvider);

    final currUserUid = currentUser.value!.uid;
    final thisPlayersTurn = game.currentTurn.keys.first == currUserUid;
    final cards =
        game.players.firstWhere((player) => player.uid == currUserUid).cards;

    final targetablePlayers =
        game.players.where((player) => player.uid != currUserUid);

    return [
      Text(
        thisPlayersTurn ? "Your turn!" : "Waiting for another player to go.",
        style: WhatCardTheme.of(context).subtitle1,
      ),
      const SizedBox(
        height: 20,
      ),
      GameCardStack(cards: cards, selected: selectedCardId),
      const SizedBox(
        height: 20,
      ),
      Row(children: [
        Expanded(
          flex: 3,
          child: Text(
            'Target',
            style: WhatCardTheme.of(context).subtitle1,
          ),
        ),
        Flexible(
          flex: 7,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              dropdownColor: WhatCardTheme.of(context).primaryBackground,
              hint: Text(
                "Choose player to target",
                style: WhatCardTheme.of(context).dataText1,
              ),
              value: selectedTarget.value,
              items: targetablePlayers.map((player) {
                return DropdownMenuItem<String>(
                  value: player.uid,
                  child: Text(
                    player.displayName,
                    style: WhatCardTheme.of(context).dataText1,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                selectedTarget.value = value;
              },
            ),
          ),
        )
      ]),
      const Spacer(),
      thisPlayersTurn && selectedTarget.value != null
          ? Button(
              title: "Play Card",
              type: ButtonType.primary,
              isLoading: isLoading.value,
              onPressed: isLoading.value
                  ? null
                  : () async {
                      final messenger = ScaffoldMessenger.of(context);
                      final playedCardIndex = selectedCardId.value;

                      // If we play last card, set selected card to 1-playedcard
                      if (playedCardIndex == cards.length - 1) {
                        selectedCardId.value = playedCardIndex - 1;
                      } else {
                        // Else whatever the played card index was, is fine
                        selectedCardId.value = playedCardIndex;
                      }

                      isLoading.value = true;

                      try {
                        await gameService.playCard(
                          game,
                          cards[playedCardIndex],
                          selectedTarget.value!,
                        );

                        await analService.logPlayCard(
                          gameId: game.gameId,
                          cardPack: game.cardPack,
                          cardId: cards[playedCardIndex].id.toRadixString(10),
                          targetUserId: selectedTarget.value!,
                        );

                        isLoading.value = false;
                      } catch (e) {
                        isLoading.value = false;

                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text("Error playing card"),
                          ),
                        );
                      }
                    },
            )
          : const Button(
              title: "Play Card",
              type: ButtonType.primary,
            )
    ];
  }

  List<Widget> _getGameIsOverScreen(BuildContext context) {
    return [
      Text(
        "Game Over",
        style: WhatCardTheme.of(context).subtitle1,
      )
    ];
  }
}

class GameDoesNotExistView extends StatelessWidget {
  const GameDoesNotExistView({super.key});

  @override
  Widget build(BuildContext context) {
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
          onPressed: () => GoRouter.of(context).pop(),
          // size: 30,
        ),
        title: Text(
          "Game does not exist",
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
      body: MainLayout(
        children: [
          Center(
            child: Text("Game does not exist",
                style: WhatCardTheme.of(context).title1),
          )
        ],
      ),
    );
  }
}
