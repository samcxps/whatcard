import 'package:cloud_functions/cloud_functions.dart';

import 'package:whatcard/models/game.dart';
import 'package:whatcard/models/game_card.dart';

class GameServiceException implements Exception {
  final String message;

  GameServiceException(this.message);
}

class GameService {
  GameService();

  final FirebaseFunctions functions = FirebaseFunctions.instance;

  ///
  /// Creates a new game in firestore
  ///
  /// Done entirely on client side
  ///
  Future createGame(Game newGame, GameDocumentReference newGameRef) async =>
      await newGameRef.set(newGame);

  ///
  /// First, checks that a game exists with the specified join code on the client side
  ///   and that the user is not already in the game
  ///
  /// Then call google cloud function to join the game
  ///
  Future joinGame(
    String userDisplayName,
    String uid,
    String joinCode,
  ) async {
    // Query game by join code
    final gameQuery = gamesRef.whereJoinCode(isEqualTo: joinCode).limit(1);

    // Try to get games ref
    final gameRef = await gameQuery.get().then((snapshot) {
      // Get games from query snapshot
      final games = snapshot.docs;

      if (games.isEmpty) {
        throw GameServiceException("No game exists for that code.");
      }

      // Return first doc ref in snapshot because we limit query to 1 result
      return games.first.reference;
    });

    // Try to get the specific game from firestore
    final game = await gameRef.get().then((game) => game.data);

    // Null check game
    if (game == null) {
      throw GameServiceException("Problem fetching game with that code.");
    }

    // Make sure user is not already in game
    // If user is in game, throw GameServiceException
    if (_isUserInGame(game, uid)) {
      throw GameServiceException("You are already a player in this game.");
    }

    // If we pass checks above, make call to joinGame function
    HttpsCallable callable = functions.httpsCallable('joinGame');

    try {
      await callable.call(<String, dynamic>{
        'joiningPlayerUid': uid,
        'displayName': userDisplayName,
        'gameId': game.gameId
      });
    } catch (e) {
      throw GameServiceException("Error joining game.");
    }
  }

  ///
  /// Call google cloud function to start the game
  ///
  Future startGame(Game game) async {
    HttpsCallable callable = functions.httpsCallable('startGame');

    try {
      await callable.call(<String, dynamic>{
        'gameId': game.gameId,
      });
    } catch (e) {
      throw GameServiceException("Error starting game.");
    }
  }

  ///
  /// Call google cloud function to play a card
  ///
  Future playCard(Game game, GameCard card, String target) async {
    HttpsCallable callable = functions.httpsCallable('playCard');

    try {
      await callable.call(<String, dynamic>{
        'gameId': game.gameId,
        'cardId': card.id,
        'targetUid': target
      });
    } catch (e) {
      throw GameServiceException("Error playing card.");
    }
  }

  ///
  /// Private method checks if user is in a given game
  ///
  bool _isUserInGame(Game game, String uid) {
    return game.players.any((player) => player.uid == uid);
  }
}
