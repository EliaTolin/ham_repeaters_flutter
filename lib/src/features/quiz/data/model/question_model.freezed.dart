// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionModel {
  int get id;
  @JsonKey(name: 'question_text')
  String get questionText;
  @JsonKey(name: 'topic_name')
  String get topicName;
  String get exam;
  @JsonKey(name: 'answer_a')
  String get answerA;
  @JsonKey(name: 'answer_b')
  String get answerB;
  @JsonKey(name: 'answer_c')
  String get answerC;
  @JsonKey(name: 'correct_letter')
  String get correctLetter;
  @JsonKey(name: 'correct_answer')
  String get correctAnswer;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  String? get explanation;
  @JsonKey(name: 'source_ref')
  String? get sourceRef;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      _$QuestionModelCopyWithImpl<QuestionModel>(
          this as QuestionModel, _$identity);

  /// Serializes this QuestionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.answerA, answerA) || other.answerA == answerA) &&
            (identical(other.answerB, answerB) || other.answerB == answerB) &&
            (identical(other.answerC, answerC) || other.answerC == answerC) &&
            (identical(other.correctLetter, correctLetter) ||
                other.correctLetter == correctLetter) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.sourceRef, sourceRef) ||
                other.sourceRef == sourceRef));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      questionText,
      topicName,
      exam,
      answerA,
      answerB,
      answerC,
      correctLetter,
      correctAnswer,
      createdAt,
      updatedAt,
      explanation,
      sourceRef);

  @override
  String toString() {
    return 'QuestionModel(id: $id, questionText: $questionText, topicName: $topicName, exam: $exam, answerA: $answerA, answerB: $answerB, answerC: $answerC, correctLetter: $correctLetter, correctAnswer: $correctAnswer, createdAt: $createdAt, updatedAt: $updatedAt, explanation: $explanation, sourceRef: $sourceRef)';
  }
}

/// @nodoc
abstract mixin class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) _then) =
      _$QuestionModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'question_text') String questionText,
      @JsonKey(name: 'topic_name') String topicName,
      String exam,
      @JsonKey(name: 'answer_a') String answerA,
      @JsonKey(name: 'answer_b') String answerB,
      @JsonKey(name: 'answer_c') String answerC,
      @JsonKey(name: 'correct_letter') String correctLetter,
      @JsonKey(name: 'correct_answer') String correctAnswer,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      String? explanation,
      @JsonKey(name: 'source_ref') String? sourceRef});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._self, this._then);

  final QuestionModel _self;
  final $Res Function(QuestionModel) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionText = null,
    Object? topicName = null,
    Object? exam = null,
    Object? answerA = null,
    Object? answerB = null,
    Object? answerC = null,
    Object? correctLetter = null,
    Object? correctAnswer = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? explanation = freezed,
    Object? sourceRef = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      questionText: null == questionText
          ? _self.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _self.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      exam: null == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as String,
      answerA: null == answerA
          ? _self.answerA
          : answerA // ignore: cast_nullable_to_non_nullable
              as String,
      answerB: null == answerB
          ? _self.answerB
          : answerB // ignore: cast_nullable_to_non_nullable
              as String,
      answerC: null == answerC
          ? _self.answerC
          : answerC // ignore: cast_nullable_to_non_nullable
              as String,
      correctLetter: null == correctLetter
          ? _self.correctLetter
          : correctLetter // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswer: null == correctAnswer
          ? _self.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: freezed == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceRef: freezed == sourceRef
          ? _self.sourceRef
          : sourceRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuestionModel].
extension QuestionModelPatterns on QuestionModel {
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
    TResult Function(_QuestionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuestionModel() when $default != null:
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
    TResult Function(_QuestionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuestionModel():
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
    TResult? Function(_QuestionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuestionModel() when $default != null:
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
            int id,
            @JsonKey(name: 'question_text') String questionText,
            @JsonKey(name: 'topic_name') String topicName,
            String exam,
            @JsonKey(name: 'answer_a') String answerA,
            @JsonKey(name: 'answer_b') String answerB,
            @JsonKey(name: 'answer_c') String answerC,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'correct_answer') String correctAnswer,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            String? explanation,
            @JsonKey(name: 'source_ref') String? sourceRef)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuestionModel() when $default != null:
        return $default(
            _that.id,
            _that.questionText,
            _that.topicName,
            _that.exam,
            _that.answerA,
            _that.answerB,
            _that.answerC,
            _that.correctLetter,
            _that.correctAnswer,
            _that.createdAt,
            _that.updatedAt,
            _that.explanation,
            _that.sourceRef);
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
            int id,
            @JsonKey(name: 'question_text') String questionText,
            @JsonKey(name: 'topic_name') String topicName,
            String exam,
            @JsonKey(name: 'answer_a') String answerA,
            @JsonKey(name: 'answer_b') String answerB,
            @JsonKey(name: 'answer_c') String answerC,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'correct_answer') String correctAnswer,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            String? explanation,
            @JsonKey(name: 'source_ref') String? sourceRef)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuestionModel():
        return $default(
            _that.id,
            _that.questionText,
            _that.topicName,
            _that.exam,
            _that.answerA,
            _that.answerB,
            _that.answerC,
            _that.correctLetter,
            _that.correctAnswer,
            _that.createdAt,
            _that.updatedAt,
            _that.explanation,
            _that.sourceRef);
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
            int id,
            @JsonKey(name: 'question_text') String questionText,
            @JsonKey(name: 'topic_name') String topicName,
            String exam,
            @JsonKey(name: 'answer_a') String answerA,
            @JsonKey(name: 'answer_b') String answerB,
            @JsonKey(name: 'answer_c') String answerC,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'correct_answer') String correctAnswer,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt,
            String? explanation,
            @JsonKey(name: 'source_ref') String? sourceRef)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuestionModel() when $default != null:
        return $default(
            _that.id,
            _that.questionText,
            _that.topicName,
            _that.exam,
            _that.answerA,
            _that.answerB,
            _that.answerC,
            _that.correctLetter,
            _that.correctAnswer,
            _that.createdAt,
            _that.updatedAt,
            _that.explanation,
            _that.sourceRef);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QuestionModel implements QuestionModel {
  const _QuestionModel(
      {required this.id,
      @JsonKey(name: 'question_text') required this.questionText,
      @JsonKey(name: 'topic_name') required this.topicName,
      required this.exam,
      @JsonKey(name: 'answer_a') required this.answerA,
      @JsonKey(name: 'answer_b') required this.answerB,
      @JsonKey(name: 'answer_c') required this.answerC,
      @JsonKey(name: 'correct_letter') required this.correctLetter,
      @JsonKey(name: 'correct_answer') required this.correctAnswer,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.explanation,
      @JsonKey(name: 'source_ref') this.sourceRef});
  factory _QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'question_text')
  final String questionText;
  @override
  @JsonKey(name: 'topic_name')
  final String topicName;
  @override
  final String exam;
  @override
  @JsonKey(name: 'answer_a')
  final String answerA;
  @override
  @JsonKey(name: 'answer_b')
  final String answerB;
  @override
  @JsonKey(name: 'answer_c')
  final String answerC;
  @override
  @JsonKey(name: 'correct_letter')
  final String correctLetter;
  @override
  @JsonKey(name: 'correct_answer')
  final String correctAnswer;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final String? explanation;
  @override
  @JsonKey(name: 'source_ref')
  final String? sourceRef;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestionModelCopyWith<_QuestionModel> get copyWith =>
      __$QuestionModelCopyWithImpl<_QuestionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.answerA, answerA) || other.answerA == answerA) &&
            (identical(other.answerB, answerB) || other.answerB == answerB) &&
            (identical(other.answerC, answerC) || other.answerC == answerC) &&
            (identical(other.correctLetter, correctLetter) ||
                other.correctLetter == correctLetter) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.sourceRef, sourceRef) ||
                other.sourceRef == sourceRef));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      questionText,
      topicName,
      exam,
      answerA,
      answerB,
      answerC,
      correctLetter,
      correctAnswer,
      createdAt,
      updatedAt,
      explanation,
      sourceRef);

  @override
  String toString() {
    return 'QuestionModel(id: $id, questionText: $questionText, topicName: $topicName, exam: $exam, answerA: $answerA, answerB: $answerB, answerC: $answerC, correctLetter: $correctLetter, correctAnswer: $correctAnswer, createdAt: $createdAt, updatedAt: $updatedAt, explanation: $explanation, sourceRef: $sourceRef)';
  }
}

/// @nodoc
abstract mixin class _$QuestionModelCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$QuestionModelCopyWith(
          _QuestionModel value, $Res Function(_QuestionModel) _then) =
      __$QuestionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'question_text') String questionText,
      @JsonKey(name: 'topic_name') String topicName,
      String exam,
      @JsonKey(name: 'answer_a') String answerA,
      @JsonKey(name: 'answer_b') String answerB,
      @JsonKey(name: 'answer_c') String answerC,
      @JsonKey(name: 'correct_letter') String correctLetter,
      @JsonKey(name: 'correct_answer') String correctAnswer,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      String? explanation,
      @JsonKey(name: 'source_ref') String? sourceRef});
}

/// @nodoc
class __$QuestionModelCopyWithImpl<$Res>
    implements _$QuestionModelCopyWith<$Res> {
  __$QuestionModelCopyWithImpl(this._self, this._then);

  final _QuestionModel _self;
  final $Res Function(_QuestionModel) _then;

  /// Create a copy of QuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? questionText = null,
    Object? topicName = null,
    Object? exam = null,
    Object? answerA = null,
    Object? answerB = null,
    Object? answerC = null,
    Object? correctLetter = null,
    Object? correctAnswer = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? explanation = freezed,
    Object? sourceRef = freezed,
  }) {
    return _then(_QuestionModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      questionText: null == questionText
          ? _self.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: null == topicName
          ? _self.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      exam: null == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as String,
      answerA: null == answerA
          ? _self.answerA
          : answerA // ignore: cast_nullable_to_non_nullable
              as String,
      answerB: null == answerB
          ? _self.answerB
          : answerB // ignore: cast_nullable_to_non_nullable
              as String,
      answerC: null == answerC
          ? _self.answerC
          : answerC // ignore: cast_nullable_to_non_nullable
              as String,
      correctLetter: null == correctLetter
          ? _self.correctLetter
          : correctLetter // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswer: null == correctAnswer
          ? _self.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: freezed == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceRef: freezed == sourceRef
          ? _self.sourceRef
          : sourceRef // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
