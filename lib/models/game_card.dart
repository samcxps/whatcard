// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'game_card.freezed.dart';
part 'game_card.g.dart';

@freezed
class GameCard with _$GameCard {
  @firestoreSerializable
  const factory GameCard({
    required int id,
    required String title,
    required String description,
  }) = _GameCard;

  factory GameCard.fromJson(Map<String, Object?> json) =>
      _$GameCardFromJson(json);
}
