// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set_question_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSetQuestionResult {
  String get setId;
  int get questionId;
  String get topicName;
  ExamType get exam;
  String get correctLetter;
  bool get isCorrect;
  String? get chosenLetter;
  DateTime? get answeredAt;
  int? get timeMs;
  String? get chosenAnswer;
  String? get correctAnswer;
  String? get questionText;

  /// Create a copy of QuizSetQuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSetQuestionResultCopyWith<QuizSetQuestionResult> get copyWith =>
      _$QuizSetQuestionResultCopyWithImpl<QuizSetQuestionResult>(
          this as QuizSetQuestionResult, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSetQuestionResult &&
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
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs) &&
            (identical(other.chosenAnswer, chosenAnswer) ||
                other.chosenAnswer == chosenAnswer) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      setId,
      questionId,
      topicName,
      exam,
      correctLetter,
      isCorrect,
      chosenLetter,
      answeredAt,
      timeMs,
      chosenAnswer,
      correctAnswer,
      questionText);

  @override
  String toString() {
    return 'QuizSetQuestionResult(setId: $setId, questionId: $questionId, topicName: $topicName, exam: $exam, correctLetter: $correctLetter, isCorrect: $isCorrect, chosenLetter: $chosenLetter, answeredAt: $answeredAt, timeMs: $timeMs, chosenAnswer: $chosenAnswer, correctAnswer: $correctAnswer, questionText: $questionText)';
  }
}

/// @nodoc
abstract mixin class $QuizSetQuestionResultCopyWith<$Res> {
  factory $QuizSetQuestionResultCopyWith(QuizSetQuestionResult value,
          $Res Function(QuizSetQuestionResult) _then) =
      _$QuizSetQuestionResultCopyWithImpl;
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
      int? timeMs,
      String? chosenAnswer,
      String? correctAnswer,
      String? questionText});
}

/// @nodoc
class _$QuizSetQuestionResultCopyWithImpl<$Res>
    implements $QuizSetQuestionResultCopyWith<$Res> {
  _$QuizSetQuestionResultCopyWithImpl(this._self, this._then);

  final QuizSetQuestionResult _self;
  final $Res Function(QuizSetQuestionResult) _then;

  /// Create a copy of QuizSetQuestionResult
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
    Object? chosenAnswer = freezed,
    Object? correctAnswer = freezed,
    Object? questionText = freezed,
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
      chosenAnswer: freezed == chosenAnswer
          ? _self.chosenAnswer
          : chosenAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: freezed == correctAnswer
          ? _self.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      questionText: freezed == questionText
          ? _self.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuizSetQuestionResult].
extension QuizSetQuestionResultPatterns on QuizSetQuestionResult {
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
    TResult Function(_QuizSetQuestionResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResult() when $default != null:
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
    TResult Function(_QuizSetQuestionResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResult():
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
    TResult? Function(_QuizSetQuestionResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResult() when $default != null:
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
            int? timeMs,
            String? chosenAnswer,
            String? correctAnswer,
            String? questionText)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResult() when $default != null:
        return $default(
            _that.setId,
            _that.questionId,
            _that.topicName,
            _that.exam,
            _that.correctLetter,
            _that.isCorrect,
            _that.chosenLetter,
            _that.answeredAt,
            _that.timeMs,
            _that.chosenAnswer,
            _that.correctAnswer,
            _that.questionText);
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
            int? timeMs,
            String? chosenAnswer,
            String? correctAnswer,
            String? questionText)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResult():
        return $default(
            _that.setId,
            _that.questionId,
            _that.topicName,
            _that.exam,
            _that.correctLetter,
            _that.isCorrect,
            _that.chosenLetter,
            _that.answeredAt,
            _that.timeMs,
            _that.chosenAnswer,
            _that.correctAnswer,
            _that.questionText);
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
            int? timeMs,
            String? chosenAnswer,
            String? correctAnswer,
            String? questionText)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResult() when $default != null:
        return $default(
            _that.setId,
            _that.questionId,
            _that.topicName,
            _that.exam,
            _that.correctLetter,
            _that.isCorrect,
            _that.chosenLetter,
            _that.answeredAt,
            _that.timeMs,
            _that.chosenAnswer,
            _that.correctAnswer,
            _that.questionText);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuizSetQuestionResult implements QuizSetQuestionResult {
  const _QuizSetQuestionResult(
      {required this.setId,
      required this.questionId,
      required this.topicName,
      required this.exam,
      required this.correctLetter,
      required this.isCorrect,
      this.chosenLetter,
      this.answeredAt,
      this.timeMs,
      this.chosenAnswer,
      this.correctAnswer,
      this.questionText});

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
  @override
  final String? chosenAnswer;
  @override
  final String? correctAnswer;
  @override
  final String? questionText;

  /// Create a copy of QuizSetQuestionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSetQuestionResultCopyWith<_QuizSetQuestionResult> get copyWith =>
      __$QuizSetQuestionResultCopyWithImpl<_QuizSetQuestionResult>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSetQuestionResult &&
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
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs) &&
            (identical(other.chosenAnswer, chosenAnswer) ||
                other.chosenAnswer == chosenAnswer) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      setId,
      questionId,
      topicName,
      exam,
      correctLetter,
      isCorrect,
      chosenLetter,
      answeredAt,
      timeMs,
      chosenAnswer,
      correctAnswer,
      questionText);

  @override
  String toString() {
    return 'QuizSetQuestionResult(setId: $setId, questionId: $questionId, topicName: $topicName, exam: $exam, correctLetter: $correctLetter, isCorrect: $isCorrect, chosenLetter: $chosenLetter, answeredAt: $answeredAt, timeMs: $timeMs, chosenAnswer: $chosenAnswer, correctAnswer: $correctAnswer, questionText: $questionText)';
  }
}

/// @nodoc
abstract mixin class _$QuizSetQuestionResultCopyWith<$Res>
    implements $QuizSetQuestionResultCopyWith<$Res> {
  factory _$QuizSetQuestionResultCopyWith(_QuizSetQuestionResult value,
          $Res Function(_QuizSetQuestionResult) _then) =
      __$QuizSetQuestionResultCopyWithImpl;
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
      int? timeMs,
      String? chosenAnswer,
      String? correctAnswer,
      String? questionText});
}

/// @nodoc
class __$QuizSetQuestionResultCopyWithImpl<$Res>
    implements _$QuizSetQuestionResultCopyWith<$Res> {
  __$QuizSetQuestionResultCopyWithImpl(this._self, this._then);

  final _QuizSetQuestionResult _self;
  final $Res Function(_QuizSetQuestionResult) _then;

  /// Create a copy of QuizSetQuestionResult
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
    Object? chosenAnswer = freezed,
    Object? correctAnswer = freezed,
    Object? questionText = freezed,
  }) {
    return _then(_QuizSetQuestionResult(
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
      chosenAnswer: freezed == chosenAnswer
          ? _self.chosenAnswer
          : chosenAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: freezed == correctAnswer
          ? _self.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      questionText: freezed == questionText
          ? _self.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
