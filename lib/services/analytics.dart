import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsServiceException implements Exception {
  final String message;

  AnalyticsServiceException(this.message);
}

class AnalyticsService {
  AnalyticsService();

  final FirebaseAnalytics instance = FirebaseAnalytics.instance;

  ///
  /// Log a custom event
  ///
  Future logCustomEvent(String eventName, Map<String, Object?>? params) async =>
      await instance.logEvent(
        name: eventName,
        parameters: params,
      );

  ///
  /// Event when a new game is created
  ///
  Future logCreateGame({
    required String gameId,
  }) async =>
      await instance.logEvent(
        name: "game_create_game",
        parameters: {
          "gameId": gameId,
        },
      );

  ///
  /// Event when a game is started
  ///
  Future logStartGame({
    required String gameId,
  }) async =>
      await instance.logEvent(
        name: "game_start_game",
        parameters: {
          "gameId": gameId,
        },
      );

  ///
  /// Event when a game ends
  ///
  Future logEndGame({
    required String gameId,
  }) async =>
      await instance.logEvent(
        name: "game_end_game",
        parameters: {
          "gameId": gameId,
        },
      );

  ///
  /// Event when a game is shared
  ///
  Future logShareGame({
    required String gameId,
  }) async =>
      await instance.logShare(
        contentType: "game",
        itemId: gameId,
        method: "game_screen_share",
      );

  ///
  /// Event when a user joins a game
  ///
  Future logJoinGame({
    required String joinCode,
  }) async =>
      await instance.logEvent(
        name: "game_join_game",
        parameters: {
          "joinCode": joinCode,
        },
      );

  ///
  /// Event when a player plays a card
  ///
  Future logPlayCard({
    required String gameId,
    required String cardPack,
    required String cardId,
    required String targetUserId,
  }) async =>
      await instance.logEvent(
        name: "game_play_card",
        parameters: {
          "gameId": gameId,
          "cardPack": cardPack,
          "cardId": cardId,
          "targetUserId": targetUserId,
        },
      );
}
