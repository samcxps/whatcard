// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';
import 'player.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@Collection<Game>('games')
final gamesRef = GameCollectionReference();
final customGamesRef = FirebaseFirestore.instance.collection('games');

enum GameStatus {
  @JsonValue("isInPreLobby")
  isInPreLobby,

  @JsonValue("isInProgress")
  isInProgress,

  @JsonValue("isOver")
  isOver;
}

@freezed
class Game with _$Game {
  // This factory creates playerIds[] automatically
  @firestoreSerializable
  factory Game({
    required String gameId,
    required GameStatus gameStatus,
    required String joinCode,
    required String displayName,
    required String cardPack,
    required int cardAmount,
    required DateTime createdTime,
    required Map<String, String> host,
    required Map<String, String> currentTurn,
    required List<Player> players,
  }) {
    final playerIds = players.map((player) => player.uid).toList();

    return Game._(
      gameId: gameId,
      gameStatus: gameStatus,
      joinCode: joinCode,
      displayName: displayName,
      cardPack: cardPack,
      cardAmount: cardAmount,
      createdTime: createdTime,
      currentTurn: currentTurn,
      host: host,
      players: players,
      playerIds: playerIds,
    );
  }

  @firestoreSerializable
  const factory Game._({
    required String gameId,
    required DateTime createdTime,
    required GameStatus gameStatus,
    required String joinCode,
    required String displayName,
    required String cardPack,
    required int cardAmount,
    required Map<String, String> host,
    required Map<String, String> currentTurn,

    // Need both list of players and list of playerIds because
    //  we cannot query a list of objects in firestore
    required List<Player> players,
    required List<String> playerIds,
  }) = _Game;

  factory Game.fromJson(Map<String, Object?> json) => _$GameFromJson(json);
}
