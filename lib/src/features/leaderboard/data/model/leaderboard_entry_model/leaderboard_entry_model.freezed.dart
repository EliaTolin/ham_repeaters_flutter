// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderboardEntryModel {
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'display_name')
  String get displayName;
  String? get propic;
  int get points;
  @JsonKey(name: 'correct_answers')
  int get correctAnswers;
  @JsonKey(name: 'total_answers')
  int get totalAnswers;
  @JsonKey(name: 'accuracy_percent')
  double get accuracyPercent;
  @JsonKey(name: 'last_answered_at')
  String? get lastAnsweredAt;
  int get rank;

  /// Create a copy of LeaderboardEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LeaderboardEntryModelCopyWith<LeaderboardEntryModel> get copyWith =>
      _$LeaderboardEntryModelCopyWithImpl<LeaderboardEntryModel>(
          this as LeaderboardEntryModel, _$identity);

  /// Serializes this LeaderboardEntryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LeaderboardEntryModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'LeaderboardEntryModel(userId: $userId, displayName: $displayName, propic: $propic, points: $points, correctAnswers: $correctAnswers, totalAnswers: $totalAnswers, accuracyPercent: $accuracyPercent, lastAnsweredAt: $lastAnsweredAt, rank: $rank)';
  }
}

/// @nodoc
abstract mixin class $LeaderboardEntryModelCopyWith<$Res> {
  factory $LeaderboardEntryModelCopyWith(LeaderboardEntryModel value,
          $Res Function(LeaderboardEntryModel) _then) =
      _$LeaderboardEntryModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'display_name') String displayName,
      String? propic,
      int points,
      @JsonKey(name: 'correct_answers') int correctAnswers,
      @JsonKey(name: 'total_answers') int totalAnswers,
      @JsonKey(name: 'accuracy_percent') double accuracyPercent,
      @JsonKey(name: 'last_answered_at') String? lastAnsweredAt,
      int rank});
}

/// @nodoc
class _$LeaderboardEntryModelCopyWithImpl<$Res>
    implements $LeaderboardEntryModelCopyWith<$Res> {
  _$LeaderboardEntryModelCopyWithImpl(this._self, this._then);

  final LeaderboardEntryModel _self;
  final $Res Function(LeaderboardEntryModel) _then;

  /// Create a copy of LeaderboardEntryModel
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
              as String?,
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [LeaderboardEntryModel].
extension LeaderboardEntryModelPatterns on LeaderboardEntryModel {
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
    TResult Function(_LeaderboardEntryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntryModel() when $default != null:
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
    TResult Function(_LeaderboardEntryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntryModel():
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
    TResult? Function(_LeaderboardEntryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntryModel() when $default != null:
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
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'display_name') String displayName,
            String? propic,
            int points,
            @JsonKey(name: 'correct_answers') int correctAnswers,
            @JsonKey(name: 'total_answers') int totalAnswers,
            @JsonKey(name: 'accuracy_percent') double accuracyPercent,
            @JsonKey(name: 'last_answered_at') String? lastAnsweredAt,
            int rank)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntryModel() when $default != null:
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
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'display_name') String displayName,
            String? propic,
            int points,
            @JsonKey(name: 'correct_answers') int correctAnswers,
            @JsonKey(name: 'total_answers') int totalAnswers,
            @JsonKey(name: 'accuracy_percent') double accuracyPercent,
            @JsonKey(name: 'last_answered_at') String? lastAnsweredAt,
            int rank)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntryModel():
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
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'display_name') String displayName,
            String? propic,
            int points,
            @JsonKey(name: 'correct_answers') int correctAnswers,
            @JsonKey(name: 'total_answers') int totalAnswers,
            @JsonKey(name: 'accuracy_percent') double accuracyPercent,
            @JsonKey(name: 'last_answered_at') String? lastAnsweredAt,
            int rank)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LeaderboardEntryModel() when $default != null:
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
@JsonSerializable()
class _LeaderboardEntryModel implements LeaderboardEntryModel {
  const _LeaderboardEntryModel(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'display_name') required this.displayName,
      required this.propic,
      required this.points,
      @JsonKey(name: 'correct_answers') required this.correctAnswers,
      @JsonKey(name: 'total_answers') required this.totalAnswers,
      @JsonKey(name: 'accuracy_percent') required this.accuracyPercent,
      @JsonKey(name: 'last_answered_at') required this.lastAnsweredAt,
      required this.rank});
  factory _LeaderboardEntryModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardEntryModelFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  final String? propic;
  @override
  final int points;
  @override
  @JsonKey(name: 'correct_answers')
  final int correctAnswers;
  @override
  @JsonKey(name: 'total_answers')
  final int totalAnswers;
  @override
  @JsonKey(name: 'accuracy_percent')
  final double accuracyPercent;
  @override
  @JsonKey(name: 'last_answered_at')
  final String? lastAnsweredAt;
  @override
  final int rank;

  /// Create a copy of LeaderboardEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LeaderboardEntryModelCopyWith<_LeaderboardEntryModel> get copyWith =>
      __$LeaderboardEntryModelCopyWithImpl<_LeaderboardEntryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LeaderboardEntryModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LeaderboardEntryModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'LeaderboardEntryModel(userId: $userId, displayName: $displayName, propic: $propic, points: $points, correctAnswers: $correctAnswers, totalAnswers: $totalAnswers, accuracyPercent: $accuracyPercent, lastAnsweredAt: $lastAnsweredAt, rank: $rank)';
  }
}

/// @nodoc
abstract mixin class _$LeaderboardEntryModelCopyWith<$Res>
    implements $LeaderboardEntryModelCopyWith<$Res> {
  factory _$LeaderboardEntryModelCopyWith(_LeaderboardEntryModel value,
          $Res Function(_LeaderboardEntryModel) _then) =
      __$LeaderboardEntryModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'display_name') String displayName,
      String? propic,
      int points,
      @JsonKey(name: 'correct_answers') int correctAnswers,
      @JsonKey(name: 'total_answers') int totalAnswers,
      @JsonKey(name: 'accuracy_percent') double accuracyPercent,
      @JsonKey(name: 'last_answered_at') String? lastAnsweredAt,
      int rank});
}

/// @nodoc
class __$LeaderboardEntryModelCopyWithImpl<$Res>
    implements _$LeaderboardEntryModelCopyWith<$Res> {
  __$LeaderboardEntryModelCopyWithImpl(this._self, this._then);

  final _LeaderboardEntryModel _self;
  final $Res Function(_LeaderboardEntryModel) _then;

  /// Create a copy of LeaderboardEntryModel
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
    return _then(_LeaderboardEntryModel(
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
              as String?,
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
