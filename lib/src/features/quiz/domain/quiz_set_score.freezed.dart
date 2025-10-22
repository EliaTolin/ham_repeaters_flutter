// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSetScore {
  String get setId;
  String get userId;
  QuizMode get mode;
  int get answered;
  int get correct;
  int get wrong;
  int get total;
  double get accuracyPct;
  ExamType? get exam;
  List<String>? get customTopics;

  /// Create a copy of QuizSetScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSetScoreCopyWith<QuizSetScore> get copyWith =>
      _$QuizSetScoreCopyWithImpl<QuizSetScore>(
          this as QuizSetScore, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSetScore &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.wrong, wrong) || other.wrong == wrong) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.accuracyPct, accuracyPct) ||
                other.accuracyPct == accuracyPct) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            const DeepCollectionEquality()
                .equals(other.customTopics, customTopics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      setId,
      userId,
      mode,
      answered,
      correct,
      wrong,
      total,
      accuracyPct,
      exam,
      const DeepCollectionEquality().hash(customTopics));

  @override
  String toString() {
    return 'QuizSetScore(setId: $setId, userId: $userId, mode: $mode, answered: $answered, correct: $correct, wrong: $wrong, total: $total, accuracyPct: $accuracyPct, exam: $exam, customTopics: $customTopics)';
  }
}

/// @nodoc
abstract mixin class $QuizSetScoreCopyWith<$Res> {
  factory $QuizSetScoreCopyWith(
          QuizSetScore value, $Res Function(QuizSetScore) _then) =
      _$QuizSetScoreCopyWithImpl;
  @useResult
  $Res call(
      {String setId,
      String userId,
      QuizMode mode,
      int answered,
      int correct,
      int wrong,
      int total,
      double accuracyPct,
      ExamType? exam,
      List<String>? customTopics});
}

/// @nodoc
class _$QuizSetScoreCopyWithImpl<$Res> implements $QuizSetScoreCopyWith<$Res> {
  _$QuizSetScoreCopyWithImpl(this._self, this._then);

  final QuizSetScore _self;
  final $Res Function(QuizSetScore) _then;

  /// Create a copy of QuizSetScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setId = null,
    Object? userId = null,
    Object? mode = null,
    Object? answered = null,
    Object? correct = null,
    Object? wrong = null,
    Object? total = null,
    Object? accuracyPct = null,
    Object? exam = freezed,
    Object? customTopics = freezed,
  }) {
    return _then(_self.copyWith(
      setId: null == setId
          ? _self.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as QuizMode,
      answered: null == answered
          ? _self.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as int,
      correct: null == correct
          ? _self.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as int,
      wrong: null == wrong
          ? _self.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      accuracyPct: null == accuracyPct
          ? _self.accuracyPct
          : accuracyPct // ignore: cast_nullable_to_non_nullable
              as double,
      exam: freezed == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamType?,
      customTopics: freezed == customTopics
          ? _self.customTopics
          : customTopics // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuizSetScore].
extension QuizSetScorePatterns on QuizSetScore {
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
    TResult Function(_QuizSetScore value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetScore() when $default != null:
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
    TResult Function(_QuizSetScore value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetScore():
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
    TResult? Function(_QuizSetScore value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetScore() when $default != null:
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
            String setId,
            String userId,
            QuizMode mode,
            int answered,
            int correct,
            int wrong,
            int total,
            double accuracyPct,
            ExamType? exam,
            List<String>? customTopics)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetScore() when $default != null:
        return $default(
            _that.setId,
            _that.userId,
            _that.mode,
            _that.answered,
            _that.correct,
            _that.wrong,
            _that.total,
            _that.accuracyPct,
            _that.exam,
            _that.customTopics);
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
            String setId,
            String userId,
            QuizMode mode,
            int answered,
            int correct,
            int wrong,
            int total,
            double accuracyPct,
            ExamType? exam,
            List<String>? customTopics)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetScore():
        return $default(
            _that.setId,
            _that.userId,
            _that.mode,
            _that.answered,
            _that.correct,
            _that.wrong,
            _that.total,
            _that.accuracyPct,
            _that.exam,
            _that.customTopics);
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
            String setId,
            String userId,
            QuizMode mode,
            int answered,
            int correct,
            int wrong,
            int total,
            double accuracyPct,
            ExamType? exam,
            List<String>? customTopics)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetScore() when $default != null:
        return $default(
            _that.setId,
            _that.userId,
            _that.mode,
            _that.answered,
            _that.correct,
            _that.wrong,
            _that.total,
            _that.accuracyPct,
            _that.exam,
            _that.customTopics);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuizSetScore implements QuizSetScore {
  const _QuizSetScore(
      {required this.setId,
      required this.userId,
      required this.mode,
      required this.answered,
      required this.correct,
      required this.wrong,
      required this.total,
      required this.accuracyPct,
      this.exam,
      final List<String>? customTopics})
      : _customTopics = customTopics;

  @override
  final String setId;
  @override
  final String userId;
  @override
  final QuizMode mode;
  @override
  final int answered;
  @override
  final int correct;
  @override
  final int wrong;
  @override
  final int total;
  @override
  final double accuracyPct;
  @override
  final ExamType? exam;
  final List<String>? _customTopics;
  @override
  List<String>? get customTopics {
    final value = _customTopics;
    if (value == null) return null;
    if (_customTopics is EqualUnmodifiableListView) return _customTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of QuizSetScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSetScoreCopyWith<_QuizSetScore> get copyWith =>
      __$QuizSetScoreCopyWithImpl<_QuizSetScore>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSetScore &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.wrong, wrong) || other.wrong == wrong) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.accuracyPct, accuracyPct) ||
                other.accuracyPct == accuracyPct) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            const DeepCollectionEquality()
                .equals(other._customTopics, _customTopics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      setId,
      userId,
      mode,
      answered,
      correct,
      wrong,
      total,
      accuracyPct,
      exam,
      const DeepCollectionEquality().hash(_customTopics));

  @override
  String toString() {
    return 'QuizSetScore(setId: $setId, userId: $userId, mode: $mode, answered: $answered, correct: $correct, wrong: $wrong, total: $total, accuracyPct: $accuracyPct, exam: $exam, customTopics: $customTopics)';
  }
}

/// @nodoc
abstract mixin class _$QuizSetScoreCopyWith<$Res>
    implements $QuizSetScoreCopyWith<$Res> {
  factory _$QuizSetScoreCopyWith(
          _QuizSetScore value, $Res Function(_QuizSetScore) _then) =
      __$QuizSetScoreCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String setId,
      String userId,
      QuizMode mode,
      int answered,
      int correct,
      int wrong,
      int total,
      double accuracyPct,
      ExamType? exam,
      List<String>? customTopics});
}

/// @nodoc
class __$QuizSetScoreCopyWithImpl<$Res>
    implements _$QuizSetScoreCopyWith<$Res> {
  __$QuizSetScoreCopyWithImpl(this._self, this._then);

  final _QuizSetScore _self;
  final $Res Function(_QuizSetScore) _then;

  /// Create a copy of QuizSetScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? setId = null,
    Object? userId = null,
    Object? mode = null,
    Object? answered = null,
    Object? correct = null,
    Object? wrong = null,
    Object? total = null,
    Object? accuracyPct = null,
    Object? exam = freezed,
    Object? customTopics = freezed,
  }) {
    return _then(_QuizSetScore(
      setId: null == setId
          ? _self.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _self.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as QuizMode,
      answered: null == answered
          ? _self.answered
          : answered // ignore: cast_nullable_to_non_nullable
              as int,
      correct: null == correct
          ? _self.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as int,
      wrong: null == wrong
          ? _self.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      accuracyPct: null == accuracyPct
          ? _self.accuracyPct
          : accuracyPct // ignore: cast_nullable_to_non_nullable
              as double,
      exam: freezed == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamType?,
      customTopics: freezed == customTopics
          ? _self._customTopics
          : customTopics // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
