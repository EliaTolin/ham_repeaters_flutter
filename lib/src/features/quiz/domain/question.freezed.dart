// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Question {
  int get id;
  String get questionText;
  String get topicName;
  ExamType get exam;
  String get answerA;
  String get answerB;
  String get answerC;
  String get correctLetter;
  String get correctAnswer;
  DateTime get createdAt;
  DateTime get updatedAt;
  String? get explanation;
  String? get sourceRef;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<Question> get copyWith =>
      _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Question &&
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
    return 'Question(id: $id, questionText: $questionText, topicName: $topicName, exam: $exam, answerA: $answerA, answerB: $answerB, answerC: $answerC, correctLetter: $correctLetter, correctAnswer: $correctAnswer, createdAt: $createdAt, updatedAt: $updatedAt, explanation: $explanation, sourceRef: $sourceRef)';
  }
}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) =
      _$QuestionCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String questionText,
      String topicName,
      ExamType exam,
      String answerA,
      String answerB,
      String answerC,
      String correctLetter,
      String correctAnswer,
      DateTime createdAt,
      DateTime updatedAt,
      String? explanation,
      String? sourceRef});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._self, this._then);

  final Question _self;
  final $Res Function(Question) _then;

  /// Create a copy of Question
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
              as ExamType,
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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

/// Adds pattern-matching-related methods to [Question].
extension QuestionPatterns on Question {
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
    TResult Function(_Question value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Question() when $default != null:
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
    TResult Function(_Question value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Question():
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
    TResult? Function(_Question value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Question() when $default != null:
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
            String questionText,
            String topicName,
            ExamType exam,
            String answerA,
            String answerB,
            String answerC,
            String correctLetter,
            String correctAnswer,
            DateTime createdAt,
            DateTime updatedAt,
            String? explanation,
            String? sourceRef)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Question() when $default != null:
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
            String questionText,
            String topicName,
            ExamType exam,
            String answerA,
            String answerB,
            String answerC,
            String correctLetter,
            String correctAnswer,
            DateTime createdAt,
            DateTime updatedAt,
            String? explanation,
            String? sourceRef)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Question():
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
            String questionText,
            String topicName,
            ExamType exam,
            String answerA,
            String answerB,
            String answerC,
            String correctLetter,
            String correctAnswer,
            DateTime createdAt,
            DateTime updatedAt,
            String? explanation,
            String? sourceRef)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Question() when $default != null:
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

class _Question implements Question {
  const _Question(
      {required this.id,
      required this.questionText,
      required this.topicName,
      required this.exam,
      required this.answerA,
      required this.answerB,
      required this.answerC,
      required this.correctLetter,
      required this.correctAnswer,
      required this.createdAt,
      required this.updatedAt,
      this.explanation,
      this.sourceRef});

  @override
  final int id;
  @override
  final String questionText;
  @override
  final String topicName;
  @override
  final ExamType exam;
  @override
  final String answerA;
  @override
  final String answerB;
  @override
  final String answerC;
  @override
  final String correctLetter;
  @override
  final String correctAnswer;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? explanation;
  @override
  final String? sourceRef;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Question &&
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
    return 'Question(id: $id, questionText: $questionText, topicName: $topicName, exam: $exam, answerA: $answerA, answerB: $answerB, answerC: $answerC, correctLetter: $correctLetter, correctAnswer: $correctAnswer, createdAt: $createdAt, updatedAt: $updatedAt, explanation: $explanation, sourceRef: $sourceRef)';
  }
}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) =
      __$QuestionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String questionText,
      String topicName,
      ExamType exam,
      String answerA,
      String answerB,
      String answerC,
      String correctLetter,
      String correctAnswer,
      DateTime createdAt,
      DateTime updatedAt,
      String? explanation,
      String? sourceRef});
}

/// @nodoc
class __$QuestionCopyWithImpl<$Res> implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(this._self, this._then);

  final _Question _self;
  final $Res Function(_Question) _then;

  /// Create a copy of Question
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
    return _then(_Question(
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
              as ExamType,
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
