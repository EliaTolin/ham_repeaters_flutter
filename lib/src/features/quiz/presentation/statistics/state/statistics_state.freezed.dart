// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatisticsState {
  List<TopicAccuracy> get topicAccuracies;
  List<QuizSetScore> get recentScores;
  TotalAccuracy? get totalAccuracy;
  bool get isLoading;
  String? get errorMessage;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatisticsStateCopyWith<StatisticsState> get copyWith =>
      _$StatisticsStateCopyWithImpl<StatisticsState>(
          this as StatisticsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatisticsState &&
            const DeepCollectionEquality()
                .equals(other.topicAccuracies, topicAccuracies) &&
            const DeepCollectionEquality()
                .equals(other.recentScores, recentScores) &&
            (identical(other.totalAccuracy, totalAccuracy) ||
                other.totalAccuracy == totalAccuracy) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(topicAccuracies),
      const DeepCollectionEquality().hash(recentScores),
      totalAccuracy,
      isLoading,
      errorMessage);

  @override
  String toString() {
    return 'StatisticsState(topicAccuracies: $topicAccuracies, recentScores: $recentScores, totalAccuracy: $totalAccuracy, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $StatisticsStateCopyWith<$Res> {
  factory $StatisticsStateCopyWith(
          StatisticsState value, $Res Function(StatisticsState) _then) =
      _$StatisticsStateCopyWithImpl;
  @useResult
  $Res call(
      {List<TopicAccuracy> topicAccuracies,
      List<QuizSetScore> recentScores,
      TotalAccuracy? totalAccuracy,
      bool isLoading,
      String? errorMessage});

  $TotalAccuracyCopyWith<$Res>? get totalAccuracy;
}

/// @nodoc
class _$StatisticsStateCopyWithImpl<$Res>
    implements $StatisticsStateCopyWith<$Res> {
  _$StatisticsStateCopyWithImpl(this._self, this._then);

  final StatisticsState _self;
  final $Res Function(StatisticsState) _then;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topicAccuracies = null,
    Object? recentScores = null,
    Object? totalAccuracy = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      topicAccuracies: null == topicAccuracies
          ? _self.topicAccuracies
          : topicAccuracies // ignore: cast_nullable_to_non_nullable
              as List<TopicAccuracy>,
      recentScores: null == recentScores
          ? _self.recentScores
          : recentScores // ignore: cast_nullable_to_non_nullable
              as List<QuizSetScore>,
      totalAccuracy: freezed == totalAccuracy
          ? _self.totalAccuracy
          : totalAccuracy // ignore: cast_nullable_to_non_nullable
              as TotalAccuracy?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TotalAccuracyCopyWith<$Res>? get totalAccuracy {
    if (_self.totalAccuracy == null) {
      return null;
    }

    return $TotalAccuracyCopyWith<$Res>(_self.totalAccuracy!, (value) {
      return _then(_self.copyWith(totalAccuracy: value));
    });
  }
}

/// Adds pattern-matching-related methods to [StatisticsState].
extension StatisticsStatePatterns on StatisticsState {
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
    TResult Function(_StatisticsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StatisticsState() when $default != null:
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
    TResult Function(_StatisticsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatisticsState():
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
    TResult? Function(_StatisticsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatisticsState() when $default != null:
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
            List<TopicAccuracy> topicAccuracies,
            List<QuizSetScore> recentScores,
            TotalAccuracy? totalAccuracy,
            bool isLoading,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StatisticsState() when $default != null:
        return $default(_that.topicAccuracies, _that.recentScores,
            _that.totalAccuracy, _that.isLoading, _that.errorMessage);
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
            List<TopicAccuracy> topicAccuracies,
            List<QuizSetScore> recentScores,
            TotalAccuracy? totalAccuracy,
            bool isLoading,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatisticsState():
        return $default(_that.topicAccuracies, _that.recentScores,
            _that.totalAccuracy, _that.isLoading, _that.errorMessage);
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
            List<TopicAccuracy> topicAccuracies,
            List<QuizSetScore> recentScores,
            TotalAccuracy? totalAccuracy,
            bool isLoading,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StatisticsState() when $default != null:
        return $default(_that.topicAccuracies, _that.recentScores,
            _that.totalAccuracy, _that.isLoading, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StatisticsState extends StatisticsState {
  const _StatisticsState(
      {required final List<TopicAccuracy> topicAccuracies,
      required final List<QuizSetScore> recentScores,
      this.totalAccuracy,
      this.isLoading = false,
      this.errorMessage})
      : _topicAccuracies = topicAccuracies,
        _recentScores = recentScores,
        super._();

  final List<TopicAccuracy> _topicAccuracies;
  @override
  List<TopicAccuracy> get topicAccuracies {
    if (_topicAccuracies is EqualUnmodifiableListView) return _topicAccuracies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topicAccuracies);
  }

  final List<QuizSetScore> _recentScores;
  @override
  List<QuizSetScore> get recentScores {
    if (_recentScores is EqualUnmodifiableListView) return _recentScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentScores);
  }

  @override
  final TotalAccuracy? totalAccuracy;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatisticsStateCopyWith<_StatisticsState> get copyWith =>
      __$StatisticsStateCopyWithImpl<_StatisticsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatisticsState &&
            const DeepCollectionEquality()
                .equals(other._topicAccuracies, _topicAccuracies) &&
            const DeepCollectionEquality()
                .equals(other._recentScores, _recentScores) &&
            (identical(other.totalAccuracy, totalAccuracy) ||
                other.totalAccuracy == totalAccuracy) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topicAccuracies),
      const DeepCollectionEquality().hash(_recentScores),
      totalAccuracy,
      isLoading,
      errorMessage);

  @override
  String toString() {
    return 'StatisticsState(topicAccuracies: $topicAccuracies, recentScores: $recentScores, totalAccuracy: $totalAccuracy, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$StatisticsStateCopyWith<$Res>
    implements $StatisticsStateCopyWith<$Res> {
  factory _$StatisticsStateCopyWith(
          _StatisticsState value, $Res Function(_StatisticsState) _then) =
      __$StatisticsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<TopicAccuracy> topicAccuracies,
      List<QuizSetScore> recentScores,
      TotalAccuracy? totalAccuracy,
      bool isLoading,
      String? errorMessage});

  @override
  $TotalAccuracyCopyWith<$Res>? get totalAccuracy;
}

/// @nodoc
class __$StatisticsStateCopyWithImpl<$Res>
    implements _$StatisticsStateCopyWith<$Res> {
  __$StatisticsStateCopyWithImpl(this._self, this._then);

  final _StatisticsState _self;
  final $Res Function(_StatisticsState) _then;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topicAccuracies = null,
    Object? recentScores = null,
    Object? totalAccuracy = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_StatisticsState(
      topicAccuracies: null == topicAccuracies
          ? _self._topicAccuracies
          : topicAccuracies // ignore: cast_nullable_to_non_nullable
              as List<TopicAccuracy>,
      recentScores: null == recentScores
          ? _self._recentScores
          : recentScores // ignore: cast_nullable_to_non_nullable
              as List<QuizSetScore>,
      totalAccuracy: freezed == totalAccuracy
          ? _self.totalAccuracy
          : totalAccuracy // ignore: cast_nullable_to_non_nullable
              as TotalAccuracy?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TotalAccuracyCopyWith<$Res>? get totalAccuracy {
    if (_self.totalAccuracy == null) {
      return null;
    }

    return $TotalAccuracyCopyWith<$Res>(_self.totalAccuracy!, (value) {
      return _then(_self.copyWith(totalAccuracy: value));
    });
  }
}

// dart format on
