// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';
import 'game_card.dart';

part 'card_pack.freezed.dart';
part 'card_pack.g.dart';

@Collection<CardPack>('card_packs')
final cardPackRef = CardPackCollectionReference();

@freezed
class CardPack with _$CardPack {
  @firestoreSerializable
  const factory CardPack({
    @Id() required String id,
    required String displayName,
    required String description,
    required List<GameCard> cards,
  }) = _CardPack;

  factory CardPack.fromJson(Map<String, Object?> json) =>
      _$CardPackFromJson(json);
}
