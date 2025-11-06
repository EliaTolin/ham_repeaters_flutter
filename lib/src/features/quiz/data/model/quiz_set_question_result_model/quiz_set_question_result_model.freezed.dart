// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set_question_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSetQuestionResultModel {
  @JsonKey(name: 'set_id')
  String get setId;
  @JsonKey(name: 'question_id')
  int get questionId;
  String get exam;
  @JsonKey(name: 'topic_name')
  String get topicName;
  @JsonKey(name: 'correct_letter')
  String get correctLetter;
  @JsonKey(name: 'question_text')
  String get questionText;
  @JsonKey(name: 'is_correct')
  bool get isCorrect;
  @JsonKey(name: 'correct_answer')
  String get correctAnswer;
  @JsonKey(name: 'answered_at')
  DateTime? get answeredAt;
  @JsonKey(name: 'time_ms')
  int? get timeMs;
  @JsonKey(name: 'chosen_letter')
  String? get chosenLetter;
  @JsonKey(name: 'chosen_answer')
  String? get chosenAnswer;

  /// Create a copy of QuizSetQuestionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSetQuestionResultModelCopyWith<QuizSetQuestionResultModel>
      get copyWith =>
          _$QuizSetQuestionResultModelCopyWithImpl<QuizSetQuestionResultModel>(
              this as QuizSetQuestionResultModel, _$identity);

  /// Serializes this QuizSetQuestionResultModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSetQuestionResultModel &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.correctLetter, correctLetter) ||
                other.correctLetter == correctLetter) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs) &&
            (identical(other.chosenLetter, chosenLetter) ||
                other.chosenLetter == chosenLetter) &&
            (identical(other.chosenAnswer, chosenAnswer) ||
                other.chosenAnswer == chosenAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      setId,
      questionId,
      exam,
      topicName,
      correctLetter,
      questionText,
      isCorrect,
      correctAnswer,
      answeredAt,
      timeMs,
      chosenLetter,
      chosenAnswer);

  @override
  String toString() {
    return 'QuizSetQuestionResultModel(setId: $setId, questionId: $questionId, exam: $exam, topicName: $topicName, correctLetter: $correctLetter, questionText: $questionText, isCorrect: $isCorrect, correctAnswer: $correctAnswer, answeredAt: $answeredAt, timeMs: $timeMs, chosenLetter: $chosenLetter, chosenAnswer: $chosenAnswer)';
  }
}

/// @nodoc
abstract mixin class $QuizSetQuestionResultModelCopyWith<$Res> {
  factory $QuizSetQuestionResultModelCopyWith(QuizSetQuestionResultModel value,
          $Res Function(QuizSetQuestionResultModel) _then) =
      _$QuizSetQuestionResultModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'set_id') String setId,
      @JsonKey(name: 'question_id') int questionId,
      String exam,
      @JsonKey(name: 'topic_name') String topicName,
      @JsonKey(name: 'correct_letter') String correctLetter,
      @JsonKey(name: 'question_text') String questionText,
      @JsonKey(name: 'is_correct') bool isCorrect,
      @JsonKey(name: 'correct_answer') String correctAnswer,
      @JsonKey(name: 'answered_at') DateTime? answeredAt,
      @JsonKey(name: 'time_ms') int? timeMs,
      @JsonKey(name: 'chosen_letter') String? chosenLetter,
      @JsonKey(name: 'chosen_answer') String? chosenAnswer});
}

/// @nodoc
class _$QuizSetQuestionResultModelCopyWithImpl<$Res>
    implements $QuizSetQuestionResultModelCopyWith<$Res> {
  _$QuizSetQuestionResultModelCopyWithImpl(this._self, this._then);

  final QuizSetQuestionResultModel _self;
  final $Res Function(QuizSetQuestionResultModel) _then;

  /// Create a copy of QuizSetQuestionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setId = null,
    Object? questionId = null,
    Object? exam = null,
    Object? topicName = null,
    Object? correctLetter = null,
    Object? questionText = null,
    Object? isCorrect = null,
    Object? correctAnswer = null,
    Object? answeredAt = freezed,
    Object? timeMs = freezed,
    Object? chosenLetter = freezed,
    Object? chosenAnswer = freezed,
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
      exam: null == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _self.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      correctLetter: null == correctLetter
          ? _self.correctLetter
          : correctLetter // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: null == questionText
          ? _self.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      correctAnswer: null == correctAnswer
          ? _self.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      answeredAt: freezed == answeredAt
          ? _self.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeMs: freezed == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      chosenLetter: freezed == chosenLetter
          ? _self.chosenLetter
          : chosenLetter // ignore: cast_nullable_to_non_nullable
              as String?,
      chosenAnswer: freezed == chosenAnswer
          ? _self.chosenAnswer
          : chosenAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuizSetQuestionResultModel].
extension QuizSetQuestionResultModelPatterns on QuizSetQuestionResultModel {
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
    TResult Function(_QuizSetQuestionResultModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResultModel() when $default != null:
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
    TResult Function(_QuizSetQuestionResultModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResultModel():
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
    TResult? Function(_QuizSetQuestionResultModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResultModel() when $default != null:
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
            @JsonKey(name: 'set_id') String setId,
            @JsonKey(name: 'question_id') int questionId,
            String exam,
            @JsonKey(name: 'topic_name') String topicName,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'question_text') String questionText,
            @JsonKey(name: 'is_correct') bool isCorrect,
            @JsonKey(name: 'correct_answer') String correctAnswer,
            @JsonKey(name: 'answered_at') DateTime? answeredAt,
            @JsonKey(name: 'time_ms') int? timeMs,
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'chosen_answer') String? chosenAnswer)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResultModel() when $default != null:
        return $default(
            _that.setId,
            _that.questionId,
            _that.exam,
            _that.topicName,
            _that.correctLetter,
            _that.questionText,
            _that.isCorrect,
            _that.correctAnswer,
            _that.answeredAt,
            _that.timeMs,
            _that.chosenLetter,
            _that.chosenAnswer);
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
            @JsonKey(name: 'set_id') String setId,
            @JsonKey(name: 'question_id') int questionId,
            String exam,
            @JsonKey(name: 'topic_name') String topicName,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'question_text') String questionText,
            @JsonKey(name: 'is_correct') bool isCorrect,
            @JsonKey(name: 'correct_answer') String correctAnswer,
            @JsonKey(name: 'answered_at') DateTime? answeredAt,
            @JsonKey(name: 'time_ms') int? timeMs,
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'chosen_answer') String? chosenAnswer)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResultModel():
        return $default(
            _that.setId,
            _that.questionId,
            _that.exam,
            _that.topicName,
            _that.correctLetter,
            _that.questionText,
            _that.isCorrect,
            _that.correctAnswer,
            _that.answeredAt,
            _that.timeMs,
            _that.chosenLetter,
            _that.chosenAnswer);
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
            @JsonKey(name: 'set_id') String setId,
            @JsonKey(name: 'question_id') int questionId,
            String exam,
            @JsonKey(name: 'topic_name') String topicName,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'question_text') String questionText,
            @JsonKey(name: 'is_correct') bool isCorrect,
            @JsonKey(name: 'correct_answer') String correctAnswer,
            @JsonKey(name: 'answered_at') DateTime? answeredAt,
            @JsonKey(name: 'time_ms') int? timeMs,
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'chosen_answer') String? chosenAnswer)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResultModel() when $default != null:
        return $default(
            _that.setId,
            _that.questionId,
            _that.exam,
            _that.topicName,
            _that.correctLetter,
            _that.questionText,
            _that.isCorrect,
            _that.correctAnswer,
            _that.answeredAt,
            _that.timeMs,
            _that.chosenLetter,
            _that.chosenAnswer);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QuizSetQuestionResultModel implements QuizSetQuestionResultModel {
  const _QuizSetQuestionResultModel(
      {@JsonKey(name: 'set_id') required this.setId,
      @JsonKey(name: 'question_id') required this.questionId,
      required this.exam,
      @JsonKey(name: 'topic_name') required this.topicName,
      @JsonKey(name: 'correct_letter') required this.correctLetter,
      @JsonKey(name: 'question_text') required this.questionText,
      @JsonKey(name: 'is_correct') required this.isCorrect,
      @JsonKey(name: 'correct_answer') required this.correctAnswer,
      @JsonKey(name: 'answered_at') this.answeredAt,
      @JsonKey(name: 'time_ms') this.timeMs,
      @JsonKey(name: 'chosen_letter') this.chosenLetter,
      @JsonKey(name: 'chosen_answer') this.chosenAnswer});
  factory _QuizSetQuestionResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetQuestionResultModelFromJson(json);

  @override
  @JsonKey(name: 'set_id')
  final String setId;
  @override
  @JsonKey(name: 'question_id')
  final int questionId;
  @override
  final String exam;
  @override
  @JsonKey(name: 'topic_name')
  final String topicName;
  @override
  @JsonKey(name: 'correct_letter')
  final String correctLetter;
  @override
  @JsonKey(name: 'question_text')
  final String questionText;
  @override
  @JsonKey(name: 'is_correct')
  final bool isCorrect;
  @override
  @JsonKey(name: 'correct_answer')
  final String correctAnswer;
  @override
  @JsonKey(name: 'answered_at')
  final DateTime? answeredAt;
  @override
  @JsonKey(name: 'time_ms')
  final int? timeMs;
  @override
  @JsonKey(name: 'chosen_letter')
  final String? chosenLetter;
  @override
  @JsonKey(name: 'chosen_answer')
  final String? chosenAnswer;

  /// Create a copy of QuizSetQuestionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSetQuestionResultModelCopyWith<_QuizSetQuestionResultModel>
      get copyWith => __$QuizSetQuestionResultModelCopyWithImpl<
          _QuizSetQuestionResultModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizSetQuestionResultModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSetQuestionResultModel &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.correctLetter, correctLetter) ||
                other.correctLetter == correctLetter) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs) &&
            (identical(other.chosenLetter, chosenLetter) ||
                other.chosenLetter == chosenLetter) &&
            (identical(other.chosenAnswer, chosenAnswer) ||
                other.chosenAnswer == chosenAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      setId,
      questionId,
      exam,
      topicName,
      correctLetter,
      questionText,
      isCorrect,
      correctAnswer,
      answeredAt,
      timeMs,
      chosenLetter,
      chosenAnswer);

  @override
  String toString() {
    return 'QuizSetQuestionResultModel(setId: $setId, questionId: $questionId, exam: $exam, topicName: $topicName, correctLetter: $correctLetter, questionText: $questionText, isCorrect: $isCorrect, correctAnswer: $correctAnswer, answeredAt: $answeredAt, timeMs: $timeMs, chosenLetter: $chosenLetter, chosenAnswer: $chosenAnswer)';
  }
}

/// @nodoc
abstract mixin class _$QuizSetQuestionResultModelCopyWith<$Res>
    implements $QuizSetQuestionResultModelCopyWith<$Res> {
  factory _$QuizSetQuestionResultModelCopyWith(
          _QuizSetQuestionResultModel value,
          $Res Function(_QuizSetQuestionResultModel) _then) =
      __$QuizSetQuestionResultModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'set_id') String setId,
      @JsonKey(name: 'question_id') int questionId,
      String exam,
      @JsonKey(name: 'topic_name') String topicName,
      @JsonKey(name: 'correct_letter') String correctLetter,
      @JsonKey(name: 'question_text') String questionText,
      @JsonKey(name: 'is_correct') bool isCorrect,
      @JsonKey(name: 'correct_answer') String correctAnswer,
      @JsonKey(name: 'answered_at') DateTime? answeredAt,
      @JsonKey(name: 'time_ms') int? timeMs,
      @JsonKey(name: 'chosen_letter') String? chosenLetter,
      @JsonKey(name: 'chosen_answer') String? chosenAnswer});
}

/// @nodoc
class __$QuizSetQuestionResultModelCopyWithImpl<$Res>
    implements _$QuizSetQuestionResultModelCopyWith<$Res> {
  __$QuizSetQuestionResultModelCopyWithImpl(this._self, this._then);

  final _QuizSetQuestionResultModel _self;
  final $Res Function(_QuizSetQuestionResultModel) _then;

  /// Create a copy of QuizSetQuestionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? setId = null,
    Object? questionId = null,
    Object? exam = null,
    Object? topicName = null,
    Object? correctLetter = null,
    Object? questionText = null,
    Object? isCorrect = null,
    Object? correctAnswer = null,
    Object? answeredAt = freezed,
    Object? timeMs = freezed,
    Object? chosenLetter = freezed,
    Object? chosenAnswer = freezed,
  }) {
    return _then(_QuizSetQuestionResultModel(
      setId: null == setId
          ? _self.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      exam: null == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _self.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      correctLetter: null == correctLetter
          ? _self.correctLetter
          : correctLetter // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: null == questionText
          ? _self.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      correctAnswer: null == correctAnswer
          ? _self.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      answeredAt: freezed == answeredAt
          ? _self.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeMs: freezed == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      chosenLetter: freezed == chosenLetter
          ? _self.chosenLetter
          : chosenLetter // ignore: cast_nullable_to_non_nullable
              as String?,
      chosenAnswer: freezed == chosenAnswer
          ? _self.chosenAnswer
          : chosenAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
