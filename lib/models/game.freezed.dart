// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
mixin _$Game {
  String get gameId => throw _privateConstructorUsedError;
  DateTime get createdTime => throw _privateConstructorUsedError;
  GameStatus get gameStatus => throw _privateConstructorUsedError;
  String get joinCode => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get cardPack => throw _privateConstructorUsedError;
  int get cardAmount => throw _privateConstructorUsedError;
  Map<String, String> get host => throw _privateConstructorUsedError;
  Map<String, String> get currentTurn =>
      throw _privateConstructorUsedError; // Need both list of players and list of playerIds because
//  we cannot query a list of objects in firestore
  List<Player> get players => throw _privateConstructorUsedError;
  List<String> get playerIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {String gameId,
      DateTime createdTime,
      GameStatus gameStatus,
      String joinCode,
      String displayName,
      String cardPack,
      int cardAmount,
      Map<String, String> host,
      Map<String, String> currentTurn,
      List<Player> players,
      List<String> playerIds});
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? createdTime = null,
    Object? gameStatus = null,
    Object? joinCode = null,
    Object? displayName = null,
    Object? cardPack = null,
    Object? cardAmount = null,
    Object? host = null,
    Object? currentTurn = null,
    Object? players = null,
    Object? playerIds = null,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gameStatus: null == gameStatus
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      joinCode: null == joinCode
          ? _value.joinCode
          : joinCode // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      cardPack: null == cardPack
          ? _value.cardPack
          : cardPack // ignore: cast_nullable_to_non_nullable
              as String,
      cardAmount: null == cardAmount
          ? _value.cardAmount
          : cardAmount // ignore: cast_nullable_to_non_nullable
              as int,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      currentTurn: null == currentTurn
          ? _value.currentTurn
          : currentTurn // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      playerIds: null == playerIds
          ? _value.playerIds
          : playerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$_GameCopyWith(_$_Game value, $Res Function(_$_Game) then) =
      __$$_GameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gameId,
      DateTime createdTime,
      GameStatus gameStatus,
      String joinCode,
      String displayName,
      String cardPack,
      int cardAmount,
      Map<String, String> host,
      Map<String, String> currentTurn,
      List<Player> players,
      List<String> playerIds});
}

/// @nodoc
class __$$_GameCopyWithImpl<$Res> extends _$GameCopyWithImpl<$Res, _$_Game>
    implements _$$_GameCopyWith<$Res> {
  __$$_GameCopyWithImpl(_$_Game _value, $Res Function(_$_Game) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? createdTime = null,
    Object? gameStatus = null,
    Object? joinCode = null,
    Object? displayName = null,
    Object? cardPack = null,
    Object? cardAmount = null,
    Object? host = null,
    Object? currentTurn = null,
    Object? players = null,
    Object? playerIds = null,
  }) {
    return _then(_$_Game(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gameStatus: null == gameStatus
          ? _value.gameStatus
          : gameStatus // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      joinCode: null == joinCode
          ? _value.joinCode
          : joinCode // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      cardPack: null == cardPack
          ? _value.cardPack
          : cardPack // ignore: cast_nullable_to_non_nullable
              as String,
      cardAmount: null == cardAmount
          ? _value.cardAmount
          : cardAmount // ignore: cast_nullable_to_non_nullable
              as int,
      host: null == host
          ? _value._host
          : host // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      currentTurn: null == currentTurn
          ? _value._currentTurn
          : currentTurn // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      playerIds: null == playerIds
          ? _value._playerIds
          : playerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@firestoreSerializable
class _$_Game implements _Game {
  const _$_Game(
      {required this.gameId,
      required this.createdTime,
      required this.gameStatus,
      required this.joinCode,
      required this.displayName,
      required this.cardPack,
      required this.cardAmount,
      required final Map<String, String> host,
      required final Map<String, String> currentTurn,
      required final List<Player> players,
      required final List<String> playerIds})
      : _host = host,
        _currentTurn = currentTurn,
        _players = players,
        _playerIds = playerIds;

  factory _$_Game.fromJson(Map<String, dynamic> json) => _$$_GameFromJson(json);

  @override
  final String gameId;
  @override
  final DateTime createdTime;
  @override
  final GameStatus gameStatus;
  @override
  final String joinCode;
  @override
  final String displayName;
  @override
  final String cardPack;
  @override
  final int cardAmount;
  final Map<String, String> _host;
  @override
  Map<String, String> get host {
    if (_host is EqualUnmodifiableMapView) return _host;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_host);
  }

  final Map<String, String> _currentTurn;
  @override
  Map<String, String> get currentTurn {
    if (_currentTurn is EqualUnmodifiableMapView) return _currentTurn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_currentTurn);
  }

// Need both list of players and list of playerIds because
//  we cannot query a list of objects in firestore
  final List<Player> _players;
// Need both list of players and list of playerIds because
//  we cannot query a list of objects in firestore
  @override
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  final List<String> _playerIds;
  @override
  List<String> get playerIds {
    if (_playerIds is EqualUnmodifiableListView) return _playerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerIds);
  }

  @override
  String toString() {
    return 'Game._(gameId: $gameId, createdTime: $createdTime, gameStatus: $gameStatus, joinCode: $joinCode, displayName: $displayName, cardPack: $cardPack, cardAmount: $cardAmount, host: $host, currentTurn: $currentTurn, players: $players, playerIds: $playerIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Game &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.gameStatus, gameStatus) ||
                other.gameStatus == gameStatus) &&
            (identical(other.joinCode, joinCode) ||
                other.joinCode == joinCode) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.cardPack, cardPack) ||
                other.cardPack == cardPack) &&
            (identical(other.cardAmount, cardAmount) ||
                other.cardAmount == cardAmount) &&
            const DeepCollectionEquality().equals(other._host, _host) &&
            const DeepCollectionEquality()
                .equals(other._currentTurn, _currentTurn) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality()
                .equals(other._playerIds, _playerIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameId,
      createdTime,
      gameStatus,
      joinCode,
      displayName,
      cardPack,
      cardAmount,
      const DeepCollectionEquality().hash(_host),
      const DeepCollectionEquality().hash(_currentTurn),
      const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(_playerIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameCopyWith<_$_Game> get copyWith =>
      __$$_GameCopyWithImpl<_$_Game>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameToJson(
      this,
    );
  }
}

abstract class _Game implements Game {
  const factory _Game(
      {required final String gameId,
      required final DateTime createdTime,
      required final GameStatus gameStatus,
      required final String joinCode,
      required final String displayName,
      required final String cardPack,
      required final int cardAmount,
      required final Map<String, String> host,
      required final Map<String, String> currentTurn,
      required final List<Player> players,
      required final List<String> playerIds}) = _$_Game;

  factory _Game.fromJson(Map<String, dynamic> json) = _$_Game.fromJson;

  @override
  String get gameId;
  @override
  DateTime get createdTime;
  @override
  GameStatus get gameStatus;
  @override
  String get joinCode;
  @override
  String get displayName;
  @override
  String get cardPack;
  @override
  int get cardAmount;
  @override
  Map<String, String> get host;
  @override
  Map<String, String> get currentTurn;
  @override // Need both list of players and list of playerIds because
//  we cannot query a list of objects in firestore
  List<Player> get players;
  @override
  List<String> get playerIds;
  @override
  @JsonKey(ignore: true)
  _$$_GameCopyWith<_$_Game> get copyWith => throw _privateConstructorUsedError;
}
