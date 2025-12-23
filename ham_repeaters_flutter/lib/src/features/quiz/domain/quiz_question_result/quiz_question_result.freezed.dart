// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_question_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizQuestionResult {
  String get setId;
  int get questionId;
  String get topicName;
  ExamType get exam;
  String get correctLetter;
  bool get isCorrect;
  String? get chosenLetter;
  DateTime? get answeredAt;
  int? get timeMs;

  /// Create a copy of QuizQuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizQuestionResultCopyWith<QuizQuestionResult> get copyWith =>
      _$QuizQuestionResultCopyWithImpl<QuizQuestionResult>(
          this as QuizQuestionResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizQuestionResult &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.correctLetter, correctLetter) ||
                other.correctLetter == correctLetter) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.chosenLetter, chosenLetter) ||
                other.chosenLetter == chosenLetter) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, setId, questionId, topicName,
      exam, correctLetter, isCorrect, chosenLetter, answeredAt, timeMs);

  @override
  String toString() {
    return 'QuizQuestionResult(setId: $setId, questionId: $questionId, topicName: $topicName, exam: $exam, correctLetter: $correctLetter, isCorrect: $isCorrect, chosenLetter: $chosenLetter, answeredAt: $answeredAt, timeMs: $timeMs)';
  }
}

/// @nodoc
abstract mixin class $QuizQuestionResultCopyWith<$Res> {
  factory $QuizQuestionResultCopyWith(
          QuizQuestionResult value, $Res Function(QuizQuestionResult) _then) =
      _$QuizQuestionResultCopyWithImpl;
  @useResult
  $Res call(
      {String setId,
      int questionId,
      String topicName,
      ExamType exam,
      String correctLetter,
      bool isCorrect,
      String? chosenLetter,
      DateTime? answeredAt,
      int? timeMs});
}

/// @nodoc
class _$QuizQuestionResultCopyWithImpl<$Res>
    implements $QuizQuestionResultCopyWith<$Res> {
  _$QuizQuestionResultCopyWithImpl(this._self, this._then);

  final QuizQuestionResult _self;
  final $Res Function(QuizQuestionResult) _then;

  /// Create a copy of QuizQuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setId = null,
    Object? questionId = null,
    Object? topicName = null,
    Object? exam = null,
    Object? correctLetter = null,
    Object? isCorrect = null,
    Object? chosenLetter = freezed,
    Object? answeredAt = freezed,
    Object? timeMs = freezed,
  }) {
    return _then(_self.copyWith(
      setId: null == setId
          ? _self.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      topicName: null == topicName
          ? _self.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      exam: null == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamType,
      correctLetter: null == correctLetter
          ? _self.correctLetter
          : correctLetter // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      chosenLetter: freezed == chosenLetter
          ? _self.chosenLetter
          : chosenLetter // ignore: cast_nullable_to_non_nullable
              as String?,
      answeredAt: freezed == answeredAt
          ? _self.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeMs: freezed == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuizQuestionResult].
extension QuizQuestionResultPatterns on QuizQuestionResult {
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
    TResult Function(_QuizQuestionResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResult() when $default != null:
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
    TResult Function(_QuizQuestionResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResult():
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
    TResult? Function(_QuizQuestionResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResult() when $default != null:
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
            int questionId,
            String topicName,
            ExamType exam,
            String correctLetter,
            bool isCorrect,
            String? chosenLetter,
            DateTime? answeredAt,
            int? timeMs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResult() when $default != null:
        return $default(
            _that.setId,
            _that.questionId,
            _that.topicName,
            _that.exam,
            _that.correctLetter,
            _that.isCorrect,
            _that.chosenLetter,
            _that.answeredAt,
            _that.timeMs);
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
            int questionId,
            String topicName,
            ExamType exam,
            String correctLetter,
            bool isCorrect,
            String? chosenLetter,
            DateTime? answeredAt,
            int? timeMs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResult():
        return $default(
            _that.setId,
            _that.questionId,
            _that.topicName,
            _that.exam,
            _that.correctLetter,
            _that.isCorrect,
            _that.chosenLetter,
            _that.answeredAt,
            _that.timeMs);
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
            int questionId,
            String topicName,
            ExamType exam,
            String correctLetter,
            bool isCorrect,
            String? chosenLetter,
            DateTime? answeredAt,
            int? timeMs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResult() when $default != null:
        return $default(
            _that.setId,
            _that.questionId,
            _that.topicName,
            _that.exam,
            _that.correctLetter,
            _that.isCorrect,
            _that.chosenLetter,
            _that.answeredAt,
            _that.timeMs);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuizQuestionResult implements QuizQuestionResult {
  const _QuizQuestionResult(
      {required this.setId,
      required this.questionId,
      required this.topicName,
      required this.exam,
      required this.correctLetter,
      required this.isCorrect,
      this.chosenLetter,
      this.answeredAt,
      this.timeMs});

  @override
  final String setId;
  @override
  final int questionId;
  @override
  final String topicName;
  @override
  final ExamType exam;
  @override
  final String correctLetter;
  @override
  final bool isCorrect;
  @override
  final String? chosenLetter;
  @override
  final DateTime? answeredAt;
  @override
  final int? timeMs;

  /// Create a copy of QuizQuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizQuestionResultCopyWith<_QuizQuestionResult> get copyWith =>
      __$QuizQuestionResultCopyWithImpl<_QuizQuestionResult>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizQuestionResult &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.correctLetter, correctLetter) ||
                other.correctLetter == correctLetter) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.chosenLetter, chosenLetter) ||
                other.chosenLetter == chosenLetter) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, setId, questionId, topicName,
      exam, correctLetter, isCorrect, chosenLetter, answeredAt, timeMs);

  @override
  String toString() {
    return 'QuizQuestionResult(setId: $setId, questionId: $questionId, topicName: $topicName, exam: $exam, correctLetter: $correctLetter, isCorrect: $isCorrect, chosenLetter: $chosenLetter, answeredAt: $answeredAt, timeMs: $timeMs)';
  }
}

/// @nodoc
abstract mixin class _$QuizQuestionResultCopyWith<$Res>
    implements $QuizQuestionResultCopyWith<$Res> {
  factory _$QuizQuestionResultCopyWith(
          _QuizQuestionResult value, $Res Function(_QuizQuestionResult) _then) =
      __$QuizQuestionResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String setId,
      int questionId,
      String topicName,
      ExamType exam,
      String correctLetter,
      bool isCorrect,
      String? chosenLetter,
      DateTime? answeredAt,
      int? timeMs});
}

/// @nodoc
class __$QuizQuestionResultCopyWithImpl<$Res>
    implements _$QuizQuestionResultCopyWith<$Res> {
  __$QuizQuestionResultCopyWithImpl(this._self, this._then);

  final _QuizQuestionResult _self;
  final $Res Function(_QuizQuestionResult) _then;

  /// Create a copy of QuizQuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? setId = null,
    Object? questionId = null,
    Object? topicName = null,
    Object? exam = null,
    Object? correctLetter = null,
    Object? isCorrect = null,
    Object? chosenLetter = freezed,
    Object? answeredAt = freezed,
    Object? timeMs = freezed,
  }) {
    return _then(_QuizQuestionResult(
      setId: null == setId
          ? _self.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      topicName: null == topicName
          ? _self.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      exam: null == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamType,
      correctLetter: null == correctLetter
          ? _self.correctLetter
          : correctLetter // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      chosenLetter: freezed == chosenLetter
          ? _self.chosenLetter
          : chosenLetter // ignore: cast_nullable_to_non_nullable
              as String?,
      answeredAt: freezed == answeredAt
          ? _self.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeMs: freezed == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
