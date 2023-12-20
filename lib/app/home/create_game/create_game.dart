import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nanoid/async.dart';

import 'package:whatcard/common/index.dart';
import 'package:whatcard/models/game.dart';
import 'package:whatcard/models/player.dart';
import 'package:whatcard/providers.dart';
import 'package:whatcard/theme.dart';

class CreateGamePage extends HookConsumerWidget {
  const CreateGamePage({Key? key}) : super(key: key);

  bool isHostUsernameValid(String name) => name.isNotEmpty;
  bool isGameNameValid(String name) => name.isNotEmpty && name.length < 36;
  bool isCardAmountValid(String amount) {
    int? intAmount = int.tryParse(amount);

    if (intAmount == null) return false;

    return intAmount > 0 && intAmount < 10;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final whatCardUser = ref.watch(currentUserProvider);
    final gameService = ref.watch(gameServiceProvider);
    final analService = ref.watch(analyticsServiceProvider);
    final defaultDisplayName =
        ref.watch(sharedPreferencesServiceProvider).getDefaultDisplayName();

    // Text controllers
    final hostNameController =
        useTextEditingController(text: defaultDisplayName);
    final gameNameController = useTextEditingController(text: null);
    final cardAmountController = useTextEditingController(text: null);

    // Listenables for text controllers
    final hostNameUpdate = useValueListenable(hostNameController);
    final gameNameUpdate = useValueListenable(gameNameController);
    final cardAmountUpdate = useValueListenable(cardAmountController);

    // Is Valid fn makes sure text fields are valid
    final isValid = useMemoized(() {
      final gameNameValid = isGameNameValid(gameNameController.text);
      final hostUsernameValid = isHostUsernameValid(hostNameController.text);
      final cardAmountValid = isCardAmountValid(cardAmountController.text);

      return gameNameValid && hostUsernameValid && cardAmountValid;
    }, [hostNameUpdate, gameNameUpdate, cardAmountUpdate]);

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
          'Create Game',
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
      body: TopSheetLayout(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Username',
                  style: WhatCardTheme.of(context).dataText1,
                ),
              ),
              Flexible(
                flex: 7,
                child: TextFormField(
                  controller: hostNameController,
                  obscureText: false,
                  decoration: getTextInputDecoration(
                    context,
                    variant: InputDecorationType.small,
                  ),
                  style: WhatCardTheme.of(context).bodyText1,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Game Name',
                  style: WhatCardTheme.of(context).dataText1,
                ),
              ),
              Flexible(
                flex: 7,
                child: TextFormField(
                  controller: gameNameController,
                  obscureText: false,
                  decoration: getTextInputDecoration(
                    context,
                    variant: InputDecorationType.small,
                  ),
                  maxLength: 36,
                  style: WhatCardTheme.of(context).bodyText1,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(children: [
            Expanded(
              flex: 3,
              child: Text(
                'Card Amount',
                style: WhatCardTheme.of(context).dataText1,
              ),
            ),
            Flexible(
              flex: 7,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: cardAmountController,
                obscureText: false,
                decoration: getTextInputDecoration(
                  context,
                  variant: InputDecorationType.small,
                ),
                style: WhatCardTheme.of(context).bodyText1,
              ),
            ),
          ]),
          const SizedBox(
            height: 16,
          ),
          Row(children: [
            Expanded(
              flex: 3,
              child: Text(
                'Card Pack',
                style: WhatCardTheme.of(context).dataText1,
              ),
            ),
            Flexible(
              flex: 7,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  dropdownColor: WhatCardTheme.of(context).primaryBackground,
                  hint: Text(
                    "Choose card pack",
                    style: WhatCardTheme.of(context).dataText1,
                  ),
                  value: "6yF343PL7FgGRoSmzIOL",
                  items: [
                    DropdownMenuItem<String>(
                      value: "6yF343PL7FgGRoSmzIOL",
                      child: Text(
                        "The Original Pack",
                        style: WhatCardTheme.of(context).dataText1,
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
            )
          ]),
          const SizedBox(
            height: 16,
          ),
          isValid
              ? Button(
                  type: ButtonType.primary,
                  title: "Create",
                  onPressed: () async {
                    final router = GoRouter.of(context);

                    final uid = whatCardUser.value!.uid;

                    // Map of UID -> displayName for host/current turn
                    final hostAndCurrentTurnMap = {
                      uid: hostNameController.text
                    };

                    // Create ref for new game
                    // Need to create first so we can access doc ref id
                    final newGameRef = gamesRef.doc();

                    // New Game object
                    final newGameRecord = Game(
                      gameId: newGameRef.id,
                      displayName: gameNameController.text,
                      joinCode: await nanoid(10),
                      host: hostAndCurrentTurnMap,
                      players: [
                        Player(
                          uid: uid,
                          displayName: hostNameController.text,
                          cards: [],
                        )
                      ],
                      cardPack: "6yF343PL7FgGRoSmzIOL",
                      cardAmount: int.parse(cardAmountController.text),
                      currentTurn: hostAndCurrentTurnMap,
                      gameStatus: GameStatus.isInPreLobby,
                      createdTime: DateTime.now(),
                    );

                    await gameService.createGame(newGameRecord, newGameRef);
                    await analService.logCreateGame(gameId: newGameRef.id);

                    router.pop();
                    // router.goNamed('HomePage');
                  },
                )
              : const Button(
                  type: ButtonType.primary,
                  title: "Create",
                  onPressed: null,
                )
        ],
      ),
    );
  }
}
