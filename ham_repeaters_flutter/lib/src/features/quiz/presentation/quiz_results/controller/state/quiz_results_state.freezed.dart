// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_results_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizResultsState {
  QuizSetScore get score;
  Map<ExamType, double> get examTypeAccuracy;

  /// Create a copy of QuizResultsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizResultsStateCopyWith<QuizResultsState> get copyWith =>
      _$QuizResultsStateCopyWithImpl<QuizResultsState>(
          this as QuizResultsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizResultsState &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality()
                .equals(other.examTypeAccuracy, examTypeAccuracy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, score,
      const DeepCollectionEquality().hash(examTypeAccuracy));

  @override
  String toString() {
    return 'QuizResultsState(score: $score, examTypeAccuracy: $examTypeAccuracy)';
  }
}

/// @nodoc
abstract mixin class $QuizResultsStateCopyWith<$Res> {
  factory $QuizResultsStateCopyWith(
          QuizResultsState value, $Res Function(QuizResultsState) _then) =
      _$QuizResultsStateCopyWithImpl;
  @useResult
  $Res call({QuizSetScore score, Map<ExamType, double> examTypeAccuracy});

  $QuizSetScoreCopyWith<$Res> get score;
}

/// @nodoc
class _$QuizResultsStateCopyWithImpl<$Res>
    implements $QuizResultsStateCopyWith<$Res> {
  _$QuizResultsStateCopyWithImpl(this._self, this._then);

  final QuizResultsState _self;
  final $Res Function(QuizResultsState) _then;

  /// Create a copy of QuizResultsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? examTypeAccuracy = null,
  }) {
    return _then(_self.copyWith(
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as QuizSetScore,
      examTypeAccuracy: null == examTypeAccuracy
          ? _self.examTypeAccuracy
          : examTypeAccuracy // ignore: cast_nullable_to_non_nullable
              as Map<ExamType, double>,
    ));
  }

  /// Create a copy of QuizResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizSetScoreCopyWith<$Res> get score {
    return $QuizSetScoreCopyWith<$Res>(_self.score, (value) {
      return _then(_self.copyWith(score: value));
    });
  }
}

/// Adds pattern-matching-related methods to [QuizResultsState].
extension QuizResultsStatePatterns on QuizResultsState {
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
    TResult Function(_QuizResultsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizResultsState() when $default != null:
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
    TResult Function(_QuizResultsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizResultsState():
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
    TResult? Function(_QuizResultsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizResultsState() when $default != null:
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
            QuizSetScore score, Map<ExamType, double> examTypeAccuracy)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizResultsState() when $default != null:
        return $default(_that.score, _that.examTypeAccuracy);
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
    TResult Function(QuizSetScore score, Map<ExamType, double> examTypeAccuracy)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizResultsState():
        return $default(_that.score, _that.examTypeAccuracy);
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
            QuizSetScore score, Map<ExamType, double> examTypeAccuracy)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizResultsState() when $default != null:
        return $default(_that.score, _that.examTypeAccuracy);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuizResultsState implements QuizResultsState {
  const _QuizResultsState(
      {required this.score,
      required final Map<ExamType, double> examTypeAccuracy})
      : _examTypeAccuracy = examTypeAccuracy;

  @override
  final QuizSetScore score;
  final Map<ExamType, double> _examTypeAccuracy;
  @override
  Map<ExamType, double> get examTypeAccuracy {
    if (_examTypeAccuracy is EqualUnmodifiableMapView) return _examTypeAccuracy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_examTypeAccuracy);
  }

  /// Create a copy of QuizResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizResultsStateCopyWith<_QuizResultsState> get copyWith =>
      __$QuizResultsStateCopyWithImpl<_QuizResultsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizResultsState &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality()
                .equals(other._examTypeAccuracy, _examTypeAccuracy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, score,
      const DeepCollectionEquality().hash(_examTypeAccuracy));

  @override
  String toString() {
    return 'QuizResultsState(score: $score, examTypeAccuracy: $examTypeAccuracy)';
  }
}

/// @nodoc
abstract mixin class _$QuizResultsStateCopyWith<$Res>
    implements $QuizResultsStateCopyWith<$Res> {
  factory _$QuizResultsStateCopyWith(
          _QuizResultsState value, $Res Function(_QuizResultsState) _then) =
      __$QuizResultsStateCopyWithImpl;
  @override
  @useResult
  $Res call({QuizSetScore score, Map<ExamType, double> examTypeAccuracy});

  @override
  $QuizSetScoreCopyWith<$Res> get score;
}

/// @nodoc
class __$QuizResultsStateCopyWithImpl<$Res>
    implements _$QuizResultsStateCopyWith<$Res> {
  __$QuizResultsStateCopyWithImpl(this._self, this._then);

  final _QuizResultsState _self;
  final $Res Function(_QuizResultsState) _then;

  /// Create a copy of QuizResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? score = null,
    Object? examTypeAccuracy = null,
  }) {
    return _then(_QuizResultsState(
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as QuizSetScore,
      examTypeAccuracy: null == examTypeAccuracy
          ? _self._examTypeAccuracy
          : examTypeAccuracy // ignore: cast_nullable_to_non_nullable
              as Map<ExamType, double>,
    ));
  }

  /// Create a copy of QuizResultsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizSetScoreCopyWith<$Res> get score {
    return $QuizSetScoreCopyWith<$Res>(_self.score, (value) {
      return _then(_self.copyWith(score: value));
    });
  }
}

// dart format on
