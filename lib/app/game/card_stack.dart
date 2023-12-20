import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:whatcard/models/game_card.dart';
import 'package:whatcard/theme.dart';

class GameCardStack extends HookWidget {
  const GameCardStack({super.key, required this.cards, required this.selected});

  final List<GameCard> cards;
  final ValueNotifier<int> selected;

  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            "You're all out of cards :(",
            style: WhatCardTheme.of(context).subtitle1,
          ),
        ),
      );
    }

    return CarouselSlider(
      options: CarouselOptions(
          height: 250.0,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          onPageChanged: (index, reason) {
            selected.value = index;
          }),
      items: cards.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: cards[selected.value].id == i.id
                    ? WhatCardTheme.of(context).primaryColor.withOpacity(0.5)
                    : WhatCardTheme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: InkWell(
                onTap: () => print("clicked card"),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        i.title,
                        style: WhatCardTheme.of(context).title1,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        i.description,
                        style: WhatCardTheme.of(context).bodyText1,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
