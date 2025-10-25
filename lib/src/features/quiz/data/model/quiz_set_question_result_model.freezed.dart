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
  @JsonKey(name: 'answered_at')
  String get answeredAt;
  @JsonKey(name: 'time_ms')
  int get timeMs;
  @JsonKey(name: 'topic_name')
  String get topicName;
  String get exam;
  @JsonKey(name: 'correct_letter')
  String get correctLetter;
  @JsonKey(name: 'is_correct')
  bool get isCorrect;
  @JsonKey(name: 'chosen_letter')
  String? get chosenLetter;
  @JsonKey(name: 'chosen_answer')
  String? get chosenAnswer;
  @JsonKey(name: 'correct_answer')
  String? get correctAnswer;
  @JsonKey(name: 'question_text')
  String? get questionText;

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
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.correctLetter, correctLetter) ||
                other.correctLetter == correctLetter) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.chosenLetter, chosenLetter) ||
                other.chosenLetter == chosenLetter) &&
            (identical(other.chosenAnswer, chosenAnswer) ||
                other.chosenAnswer == chosenAnswer) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      setId,
      questionId,
      answeredAt,
      timeMs,
      topicName,
      exam,
      correctLetter,
      isCorrect,
      chosenLetter,
      chosenAnswer,
      correctAnswer,
      questionText);

  @override
  String toString() {
    return 'QuizSetQuestionResultModel(setId: $setId, questionId: $questionId, answeredAt: $answeredAt, timeMs: $timeMs, topicName: $topicName, exam: $exam, correctLetter: $correctLetter, isCorrect: $isCorrect, chosenLetter: $chosenLetter, chosenAnswer: $chosenAnswer, correctAnswer: $correctAnswer, questionText: $questionText)';
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
      @JsonKey(name: 'answered_at') String answeredAt,
      @JsonKey(name: 'time_ms') int timeMs,
      @JsonKey(name: 'topic_name') String topicName,
      String exam,
      @JsonKey(name: 'correct_letter') String correctLetter,
      @JsonKey(name: 'is_correct') bool isCorrect,
      @JsonKey(name: 'chosen_letter') String? chosenLetter,
      @JsonKey(name: 'chosen_answer') String? chosenAnswer,
      @JsonKey(name: 'correct_answer') String? correctAnswer,
      @JsonKey(name: 'question_text') String? questionText});
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
    Object? answeredAt = null,
    Object? timeMs = null,
    Object? topicName = null,
    Object? exam = null,
    Object? correctLetter = null,
    Object? isCorrect = null,
    Object? chosenLetter = freezed,
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
      answeredAt: null == answeredAt
          ? _self.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as String,
      timeMs: null == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int,
      topicName: null == topicName
          ? _self.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      exam: null == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as String,
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
            @JsonKey(name: 'answered_at') String answeredAt,
            @JsonKey(name: 'time_ms') int timeMs,
            @JsonKey(name: 'topic_name') String topicName,
            String exam,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'is_correct') bool isCorrect,
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'chosen_answer') String? chosenAnswer,
            @JsonKey(name: 'correct_answer') String? correctAnswer,
            @JsonKey(name: 'question_text') String? questionText)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResultModel() when $default != null:
        return $default(
            _that.setId,
            _that.questionId,
            _that.answeredAt,
            _that.timeMs,
            _that.topicName,
            _that.exam,
            _that.correctLetter,
            _that.isCorrect,
            _that.chosenLetter,
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
            @JsonKey(name: 'set_id') String setId,
            @JsonKey(name: 'question_id') int questionId,
            @JsonKey(name: 'answered_at') String answeredAt,
            @JsonKey(name: 'time_ms') int timeMs,
            @JsonKey(name: 'topic_name') String topicName,
            String exam,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'is_correct') bool isCorrect,
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'chosen_answer') String? chosenAnswer,
            @JsonKey(name: 'correct_answer') String? correctAnswer,
            @JsonKey(name: 'question_text') String? questionText)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResultModel():
        return $default(
            _that.setId,
            _that.questionId,
            _that.answeredAt,
            _that.timeMs,
            _that.topicName,
            _that.exam,
            _that.correctLetter,
            _that.isCorrect,
            _that.chosenLetter,
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
            @JsonKey(name: 'set_id') String setId,
            @JsonKey(name: 'question_id') int questionId,
            @JsonKey(name: 'answered_at') String answeredAt,
            @JsonKey(name: 'time_ms') int timeMs,
            @JsonKey(name: 'topic_name') String topicName,
            String exam,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'is_correct') bool isCorrect,
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'chosen_answer') String? chosenAnswer,
            @JsonKey(name: 'correct_answer') String? correctAnswer,
            @JsonKey(name: 'question_text') String? questionText)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionResultModel() when $default != null:
        return $default(
            _that.setId,
            _that.questionId,
            _that.answeredAt,
            _that.timeMs,
            _that.topicName,
            _that.exam,
            _that.correctLetter,
            _that.isCorrect,
            _that.chosenLetter,
            _that.chosenAnswer,
            _that.correctAnswer,
            _that.questionText);
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
      @JsonKey(name: 'answered_at') required this.answeredAt,
      @JsonKey(name: 'time_ms') required this.timeMs,
      @JsonKey(name: 'topic_name') required this.topicName,
      required this.exam,
      @JsonKey(name: 'correct_letter') required this.correctLetter,
      @JsonKey(name: 'is_correct') required this.isCorrect,
      @JsonKey(name: 'chosen_letter') this.chosenLetter,
      @JsonKey(name: 'chosen_answer') this.chosenAnswer,
      @JsonKey(name: 'correct_answer') this.correctAnswer,
      @JsonKey(name: 'question_text') this.questionText});
  factory _QuizSetQuestionResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetQuestionResultModelFromJson(json);

  @override
  @JsonKey(name: 'set_id')
  final String setId;
  @override
  @JsonKey(name: 'question_id')
  final int questionId;
  @override
  @JsonKey(name: 'answered_at')
  final String answeredAt;
  @override
  @JsonKey(name: 'time_ms')
  final int timeMs;
  @override
  @JsonKey(name: 'topic_name')
  final String topicName;
  @override
  final String exam;
  @override
  @JsonKey(name: 'correct_letter')
  final String correctLetter;
  @override
  @JsonKey(name: 'is_correct')
  final bool isCorrect;
  @override
  @JsonKey(name: 'chosen_letter')
  final String? chosenLetter;
  @override
  @JsonKey(name: 'chosen_answer')
  final String? chosenAnswer;
  @override
  @JsonKey(name: 'correct_answer')
  final String? correctAnswer;
  @override
  @JsonKey(name: 'question_text')
  final String? questionText;

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
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.correctLetter, correctLetter) ||
                other.correctLetter == correctLetter) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.chosenLetter, chosenLetter) ||
                other.chosenLetter == chosenLetter) &&
            (identical(other.chosenAnswer, chosenAnswer) ||
                other.chosenAnswer == chosenAnswer) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      setId,
      questionId,
      answeredAt,
      timeMs,
      topicName,
      exam,
      correctLetter,
      isCorrect,
      chosenLetter,
      chosenAnswer,
      correctAnswer,
      questionText);

  @override
  String toString() {
    return 'QuizSetQuestionResultModel(setId: $setId, questionId: $questionId, answeredAt: $answeredAt, timeMs: $timeMs, topicName: $topicName, exam: $exam, correctLetter: $correctLetter, isCorrect: $isCorrect, chosenLetter: $chosenLetter, chosenAnswer: $chosenAnswer, correctAnswer: $correctAnswer, questionText: $questionText)';
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
      @JsonKey(name: 'answered_at') String answeredAt,
      @JsonKey(name: 'time_ms') int timeMs,
      @JsonKey(name: 'topic_name') String topicName,
      String exam,
      @JsonKey(name: 'correct_letter') String correctLetter,
      @JsonKey(name: 'is_correct') bool isCorrect,
      @JsonKey(name: 'chosen_letter') String? chosenLetter,
      @JsonKey(name: 'chosen_answer') String? chosenAnswer,
      @JsonKey(name: 'correct_answer') String? correctAnswer,
      @JsonKey(name: 'question_text') String? questionText});
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
    Object? answeredAt = null,
    Object? timeMs = null,
    Object? topicName = null,
    Object? exam = null,
    Object? correctLetter = null,
    Object? isCorrect = null,
    Object? chosenLetter = freezed,
    Object? chosenAnswer = freezed,
    Object? correctAnswer = freezed,
    Object? questionText = freezed,
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
      answeredAt: null == answeredAt
          ? _self.answeredAt
          : answeredAt // ignore: cast_nullable_to_non_nullable
              as String,
      timeMs: null == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int,
      topicName: null == topicName
          ? _self.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      exam: null == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as String,
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
