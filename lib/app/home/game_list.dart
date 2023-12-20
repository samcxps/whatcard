import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whatcard/app/home/game_card.dart';
import 'package:whatcard/common/async_value_widget.dart';
import 'package:whatcard/models/game.dart';
import 'package:whatcard/models/user.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/theme.dart';

class GameList extends ConsumerWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    return AsyncValueWidget(
      value: currentUser,
      data: (WhatCardUser? user) {
        return FirestoreBuilder(
          ref: gamesRef.wherePlayerIds(
            arrayContains: user!.uid,
          ),
          builder: (
            context,
            AsyncSnapshot<GameQuerySnapshot> snapshot,
            Widget? child,
          ) {
            if (snapshot.hasError) {
              return const Text('Something went wrong!');
            }

            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            // Access the QuerySnapshot
            GameQuerySnapshot querySnapshot = snapshot.requireData;

            final gameCount = querySnapshot.docs.length;

            if (gameCount == 0) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "You have no active games.",
                      style: WhatCardTheme.of(context).subtitle1,
                    ),
                    Text(
                      "Create or join one to get started!",
                      style: WhatCardTheme.of(context).subtitle1,
                    )
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: gameCount,
              itemBuilder: (context, index) {
                final game = querySnapshot.docs[index].data;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: GameCardWidget(game: game),
                );
              },
            );
          },
        );
      },
    );
  }
}
