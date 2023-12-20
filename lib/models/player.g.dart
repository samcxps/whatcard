// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Player _$$_PlayerFromJson(Map<String, dynamic> json) => _$_Player(
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
      cards: (json['cards'] as List<dynamic>)
          .map((e) => GameCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$$_PlayerFieldMap = <String, String>{
  'uid': 'uid',
  'displayName': 'displayName',
  'cards': 'cards',
};

Map<String, dynamic> _$$_PlayerToJson(_$_Player instance) => <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'cards': instance.cards.map((e) => e.toJson()).toList(),
    };
