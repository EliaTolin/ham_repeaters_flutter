// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderboardEntry {
  String get userId;
  String get displayName;
  String? get propic;
  int get points;
  int get correctAnswers;
  int get totalAnswers;
  double get accuracyPercent;
  DateTime? get lastAnsweredAt;
  int get rank;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith =>
      _$LeaderboardEntryCopyWithImpl<LeaderboardEntry>(
          this as LeaderboardEntry, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LeaderboardEntry &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.propic, propic) || other.propic == propic) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.totalAnswers, totalAnswers) ||
                other.totalAnswers == totalAnswers) &&
            (identical(other.accuracyPercent, accuracyPercent) ||
                other.accuracyPercent == accuracyPercent) &&
            (identical(other.lastAnsweredAt, lastAnsweredAt) ||
                other.lastAnsweredAt == lastAnsweredAt) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      displayName,
      propic,
      points,
      correctAnswers,
      totalAnswers,
      accuracyPercent,
      lastAnsweredAt,
      rank);

  @override
  String toString() {
    return 'LeaderboardEntry(userId: $userId, displayName: $displayName, propic: $propic, points: $points, correctAnswers: $correctAnswers, totalAnswers: $totalAnswers, accuracyPercent: $accuracyPercent, lastAnsweredAt: $lastAnsweredAt, rank: $rank)';
  }
}

/// @nodoc
abstract mixin class $LeaderboardEntryCopyWith<$Res> {
  factory $LeaderboardEntryCopyWith(
          LeaderboardEntry value, $Res Function(LeaderboardEntry) _then) =
      _$LeaderboardEntryCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String displayName,
      String? propic,
      int points,
      int correctAnswers,
      int totalAnswers,
      double accuracyPercent,
      DateTime? lastAnsweredAt,
      int rank});
}

/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final LeaderboardEntry _self;
  final $Res Function(LeaderboardEntry) _then;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = null,
    Object? propic = freezed,
    Object? points = null,
    Object? correctAnswers = null,
    Object? totalAnswers = null,
    Object? accuracyPercent = null,
    Object? lastAnsweredAt = freezed,
    Object? rank = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      propic: freezed == propic
          ? _self.propic
          : propic // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _self.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      totalAnswers: null == totalAnswers
          ? _self.totalAnswers
          : totalAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      accuracyPercent: null == accuracyPercent
          ? _self.accuracyPercent
          : accuracyPercent // ignore: cast_nullable_to_non_nullable
              as double,
      lastAnsweredAt: freezed == lastAnsweredAt
          ? _self.lastAnsweredAt
          : lastAnsweredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [LeaderboardEntry].
extension LeaderboardEntryPatterns on LeaderboardEntry {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LeaderboardEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LeaderboardEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LeaderboardEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String userId,
            String displayName,
            String? propic,
            int points,
            int correctAnswers,
            int totalAnswers,
            double accuracyPercent,
            DateTime? lastAnsweredAt,
            int rank)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry() when $default != null:
        return $default(
            _that.userId,
            _that.displayName,
            _that.propic,
            _that.points,
            _that.correctAnswers,
            _that.totalAnswers,
            _that.accuracyPercent,
            _that.lastAnsweredAt,
            _that.rank);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String userId,
            String displayName,
            String? propic,
            int points,
            int correctAnswers,
            int totalAnswers,
            double accuracyPercent,
            DateTime? lastAnsweredAt,
            int rank)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry():
        return $default(
            _that.userId,
            _that.displayName,
            _that.propic,
            _that.points,
            _that.correctAnswers,
            _that.totalAnswers,
            _that.accuracyPercent,
            _that.lastAnsweredAt,
            _that.rank);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String userId,
            String displayName,
            String? propic,
            int points,
            int correctAnswers,
            int totalAnswers,
            double accuracyPercent,
            DateTime? lastAnsweredAt,
            int rank)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntry() when $default != null:
        return $default(
            _that.userId,
            _that.displayName,
            _that.propic,
            _that.points,
            _that.correctAnswers,
            _that.totalAnswers,
            _that.accuracyPercent,
            _that.lastAnsweredAt,
            _that.rank);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LeaderboardEntry implements LeaderboardEntry {
  const _LeaderboardEntry(
      {required this.userId,
      required this.displayName,
      required this.propic,
      required this.points,
      required this.correctAnswers,
      required this.totalAnswers,
      required this.accuracyPercent,
      required this.lastAnsweredAt,
      required this.rank});

  @override
  final String userId;
  @override
  final String displayName;
  @override
  final String? propic;
  @override
  final int points;
  @override
  final int correctAnswers;
  @override
  final int totalAnswers;
  @override
  final double accuracyPercent;
  @override
  final DateTime? lastAnsweredAt;
  @override
  final int rank;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LeaderboardEntryCopyWith<_LeaderboardEntry> get copyWith =>
      __$LeaderboardEntryCopyWithImpl<_LeaderboardEntry>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LeaderboardEntry &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.propic, propic) || other.propic == propic) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.totalAnswers, totalAnswers) ||
                other.totalAnswers == totalAnswers) &&
            (identical(other.accuracyPercent, accuracyPercent) ||
                other.accuracyPercent == accuracyPercent) &&
            (identical(other.lastAnsweredAt, lastAnsweredAt) ||
                other.lastAnsweredAt == lastAnsweredAt) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      displayName,
      propic,
      points,
      correctAnswers,
      totalAnswers,
      accuracyPercent,
      lastAnsweredAt,
      rank);

  @override
  String toString() {
    return 'LeaderboardEntry(userId: $userId, displayName: $displayName, propic: $propic, points: $points, correctAnswers: $correctAnswers, totalAnswers: $totalAnswers, accuracyPercent: $accuracyPercent, lastAnsweredAt: $lastAnsweredAt, rank: $rank)';
  }
}

/// @nodoc
abstract mixin class _$LeaderboardEntryCopyWith<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  factory _$LeaderboardEntryCopyWith(
          _LeaderboardEntry value, $Res Function(_LeaderboardEntry) _then) =
      __$LeaderboardEntryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String displayName,
      String? propic,
      int points,
      int correctAnswers,
      int totalAnswers,
      double accuracyPercent,
      DateTime? lastAnsweredAt,
      int rank});
}

/// @nodoc
class __$LeaderboardEntryCopyWithImpl<$Res>
    implements _$LeaderboardEntryCopyWith<$Res> {
  __$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final _LeaderboardEntry _self;
  final $Res Function(_LeaderboardEntry) _then;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? displayName = null,
    Object? propic = freezed,
    Object? points = null,
    Object? correctAnswers = null,
    Object? totalAnswers = null,
    Object? accuracyPercent = null,
    Object? lastAnsweredAt = freezed,
    Object? rank = null,
  }) {
    return _then(_LeaderboardEntry(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      propic: freezed == propic
          ? _self.propic
          : propic // ignore: cast_nullable_to_non_nullable
              as String?,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _self.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      totalAnswers: null == totalAnswers
          ? _self.totalAnswers
          : totalAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      accuracyPercent: null == accuracyPercent
          ? _self.accuracyPercent
          : accuracyPercent // ignore: cast_nullable_to_non_nullable
              as double,
      lastAnsweredAt: freezed == lastAnsweredAt
          ? _self.lastAnsweredAt
          : lastAnsweredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
