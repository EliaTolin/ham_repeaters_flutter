// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizDashboardState {
  List<QuizSetScore>? get recentScores;
  List<CuratedSetPreview>? get curatedSetsPreviews;
  int get totalQuizzes;
  double get averageAccuracy;
  Profile? get profile;
  LeaderboardEntry? get userPosition;
  String? get errorMessage;

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizDashboardStateCopyWith<QuizDashboardState> get copyWith =>
      _$QuizDashboardStateCopyWithImpl<QuizDashboardState>(
          this as QuizDashboardState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizDashboardState &&
            const DeepCollectionEquality()
                .equals(other.recentScores, recentScores) &&
            const DeepCollectionEquality()
                .equals(other.curatedSetsPreviews, curatedSetsPreviews) &&
            (identical(other.totalQuizzes, totalQuizzes) ||
                other.totalQuizzes == totalQuizzes) &&
            (identical(other.averageAccuracy, averageAccuracy) ||
                other.averageAccuracy == averageAccuracy) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.userPosition, userPosition) ||
                other.userPosition == userPosition) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recentScores),
      const DeepCollectionEquality().hash(curatedSetsPreviews),
      totalQuizzes,
      averageAccuracy,
      profile,
      userPosition,
      errorMessage);

  @override
  String toString() {
    return 'QuizDashboardState(recentScores: $recentScores, curatedSetsPreviews: $curatedSetsPreviews, totalQuizzes: $totalQuizzes, averageAccuracy: $averageAccuracy, profile: $profile, userPosition: $userPosition, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $QuizDashboardStateCopyWith<$Res> {
  factory $QuizDashboardStateCopyWith(
          QuizDashboardState value, $Res Function(QuizDashboardState) _then) =
      _$QuizDashboardStateCopyWithImpl;
  @useResult
  $Res call(
      {List<QuizSetScore>? recentScores,
      List<CuratedSetPreview>? curatedSetsPreviews,
      int totalQuizzes,
      double averageAccuracy,
      Profile? profile,
      LeaderboardEntry? userPosition,
      String? errorMessage});

  $ProfileCopyWith<$Res>? get profile;
  $LeaderboardEntryCopyWith<$Res>? get userPosition;
}

/// @nodoc
class _$QuizDashboardStateCopyWithImpl<$Res>
    implements $QuizDashboardStateCopyWith<$Res> {
  _$QuizDashboardStateCopyWithImpl(this._self, this._then);

  final QuizDashboardState _self;
  final $Res Function(QuizDashboardState) _then;

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentScores = freezed,
    Object? curatedSetsPreviews = freezed,
    Object? totalQuizzes = null,
    Object? averageAccuracy = null,
    Object? profile = freezed,
    Object? userPosition = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      recentScores: freezed == recentScores
          ? _self.recentScores
          : recentScores // ignore: cast_nullable_to_non_nullable
              as List<QuizSetScore>?,
      curatedSetsPreviews: freezed == curatedSetsPreviews
          ? _self.curatedSetsPreviews
          : curatedSetsPreviews // ignore: cast_nullable_to_non_nullable
              as List<CuratedSetPreview>?,
      totalQuizzes: null == totalQuizzes
          ? _self.totalQuizzes
          : totalQuizzes // ignore: cast_nullable_to_non_nullable
              as int,
      averageAccuracy: null == averageAccuracy
          ? _self.averageAccuracy
          : averageAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      userPosition: freezed == userPosition
          ? _self.userPosition
          : userPosition // ignore: cast_nullable_to_non_nullable
              as LeaderboardEntry?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeaderboardEntryCopyWith<$Res>? get userPosition {
    if (_self.userPosition == null) {
      return null;
    }

    return $LeaderboardEntryCopyWith<$Res>(_self.userPosition!, (value) {
      return _then(_self.copyWith(userPosition: value));
    });
  }
}

/// Adds pattern-matching-related methods to [QuizDashboardState].
extension QuizDashboardStatePatterns on QuizDashboardState {
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
    TResult Function(_QuizDashboardState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState() when $default != null:
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
    TResult Function(_QuizDashboardState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState():
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
    TResult? Function(_QuizDashboardState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState() when $default != null:
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
            List<QuizSetScore>? recentScores,
            List<CuratedSetPreview>? curatedSetsPreviews,
            int totalQuizzes,
            double averageAccuracy,
            Profile? profile,
            LeaderboardEntry? userPosition,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState() when $default != null:
        return $default(
            _that.recentScores,
            _that.curatedSetsPreviews,
            _that.totalQuizzes,
            _that.averageAccuracy,
            _that.profile,
            _that.userPosition,
            _that.errorMessage);
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
            List<QuizSetScore>? recentScores,
            List<CuratedSetPreview>? curatedSetsPreviews,
            int totalQuizzes,
            double averageAccuracy,
            Profile? profile,
            LeaderboardEntry? userPosition,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState():
        return $default(
            _that.recentScores,
            _that.curatedSetsPreviews,
            _that.totalQuizzes,
            _that.averageAccuracy,
            _that.profile,
            _that.userPosition,
            _that.errorMessage);
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
            List<QuizSetScore>? recentScores,
            List<CuratedSetPreview>? curatedSetsPreviews,
            int totalQuizzes,
            double averageAccuracy,
            Profile? profile,
            LeaderboardEntry? userPosition,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState() when $default != null:
        return $default(
            _that.recentScores,
            _that.curatedSetsPreviews,
            _that.totalQuizzes,
            _that.averageAccuracy,
            _that.profile,
            _that.userPosition,
            _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuizDashboardState implements QuizDashboardState {
  const _QuizDashboardState(
      {final List<QuizSetScore>? recentScores,
      final List<CuratedSetPreview>? curatedSetsPreviews,
      this.totalQuizzes = 0,
      this.averageAccuracy = 0.0,
      this.profile,
      this.userPosition,
      this.errorMessage})
      : _recentScores = recentScores,
        _curatedSetsPreviews = curatedSetsPreviews;

  final List<QuizSetScore>? _recentScores;
  @override
  List<QuizSetScore>? get recentScores {
    final value = _recentScores;
    if (value == null) return null;
    if (_recentScores is EqualUnmodifiableListView) return _recentScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CuratedSetPreview>? _curatedSetsPreviews;
  @override
  List<CuratedSetPreview>? get curatedSetsPreviews {
    final value = _curatedSetsPreviews;
    if (value == null) return null;
    if (_curatedSetsPreviews is EqualUnmodifiableListView)
      return _curatedSetsPreviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int totalQuizzes;
  @override
  @JsonKey()
  final double averageAccuracy;
  @override
  final Profile? profile;
  @override
  final LeaderboardEntry? userPosition;
  @override
  final String? errorMessage;

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizDashboardStateCopyWith<_QuizDashboardState> get copyWith =>
      __$QuizDashboardStateCopyWithImpl<_QuizDashboardState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizDashboardState &&
            const DeepCollectionEquality()
                .equals(other._recentScores, _recentScores) &&
            const DeepCollectionEquality()
                .equals(other._curatedSetsPreviews, _curatedSetsPreviews) &&
            (identical(other.totalQuizzes, totalQuizzes) ||
                other.totalQuizzes == totalQuizzes) &&
            (identical(other.averageAccuracy, averageAccuracy) ||
                other.averageAccuracy == averageAccuracy) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.userPosition, userPosition) ||
                other.userPosition == userPosition) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recentScores),
      const DeepCollectionEquality().hash(_curatedSetsPreviews),
      totalQuizzes,
      averageAccuracy,
      profile,
      userPosition,
      errorMessage);

  @override
  String toString() {
    return 'QuizDashboardState(recentScores: $recentScores, curatedSetsPreviews: $curatedSetsPreviews, totalQuizzes: $totalQuizzes, averageAccuracy: $averageAccuracy, profile: $profile, userPosition: $userPosition, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$QuizDashboardStateCopyWith<$Res>
    implements $QuizDashboardStateCopyWith<$Res> {
  factory _$QuizDashboardStateCopyWith(
          _QuizDashboardState value, $Res Function(_QuizDashboardState) _then) =
      __$QuizDashboardStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<QuizSetScore>? recentScores,
      List<CuratedSetPreview>? curatedSetsPreviews,
      int totalQuizzes,
      double averageAccuracy,
      Profile? profile,
      LeaderboardEntry? userPosition,
      String? errorMessage});

  @override
  $ProfileCopyWith<$Res>? get profile;
  @override
  $LeaderboardEntryCopyWith<$Res>? get userPosition;
}

/// @nodoc
class __$QuizDashboardStateCopyWithImpl<$Res>
    implements _$QuizDashboardStateCopyWith<$Res> {
  __$QuizDashboardStateCopyWithImpl(this._self, this._then);

  final _QuizDashboardState _self;
  final $Res Function(_QuizDashboardState) _then;

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recentScores = freezed,
    Object? curatedSetsPreviews = freezed,
    Object? totalQuizzes = null,
    Object? averageAccuracy = null,
    Object? profile = freezed,
    Object? userPosition = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_QuizDashboardState(
      recentScores: freezed == recentScores
          ? _self._recentScores
          : recentScores // ignore: cast_nullable_to_non_nullable
              as List<QuizSetScore>?,
      curatedSetsPreviews: freezed == curatedSetsPreviews
          ? _self._curatedSetsPreviews
          : curatedSetsPreviews // ignore: cast_nullable_to_non_nullable
              as List<CuratedSetPreview>?,
      totalQuizzes: null == totalQuizzes
          ? _self.totalQuizzes
          : totalQuizzes // ignore: cast_nullable_to_non_nullable
              as int,
      averageAccuracy: null == averageAccuracy
          ? _self.averageAccuracy
          : averageAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      userPosition: freezed == userPosition
          ? _self.userPosition
          : userPosition // ignore: cast_nullable_to_non_nullable
              as LeaderboardEntry?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeaderboardEntryCopyWith<$Res>? get userPosition {
    if (_self.userPosition == null) {
      return null;
    }

    return $LeaderboardEntryCopyWith<$Res>(_self.userPosition!, (value) {
      return _then(_self.copyWith(userPosition: value));
    });
  }
}

// dart format on
