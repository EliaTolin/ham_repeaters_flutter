// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_question_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizQuestionResultModel {
  @JsonKey(name: 'set_id')
  String get setId;
  @JsonKey(name: 'question_id')
  int get questionId;
  @JsonKey(name: 'topic_name')
  String get topicName;
  @ExamTypeConverter()
  ExamType get exam;
  @JsonKey(name: 'correct_letter')
  String get correctLetter;
  @JsonKey(name: 'is_correct')
  bool get isCorrect;
  @JsonKey(name: 'chosen_letter')
  String? get chosenLetter;
  @JsonKey(name: 'answered_at')
  String? get answeredAt;
  @JsonKey(name: 'time_ms')
  int? get timeMs;

  /// Create a copy of QuizQuestionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizQuestionResultModelCopyWith<QuizQuestionResultModel> get copyWith =>
      _$QuizQuestionResultModelCopyWithImpl<QuizQuestionResultModel>(
          this as QuizQuestionResultModel, _$identity);

  /// Serializes this QuizQuestionResultModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizQuestionResultModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, setId, questionId, topicName,
      exam, correctLetter, isCorrect, chosenLetter, answeredAt, timeMs);

  @override
  String toString() {
    return 'QuizQuestionResultModel(setId: $setId, questionId: $questionId, topicName: $topicName, exam: $exam, correctLetter: $correctLetter, isCorrect: $isCorrect, chosenLetter: $chosenLetter, answeredAt: $answeredAt, timeMs: $timeMs)';
  }
}

/// @nodoc
abstract mixin class $QuizQuestionResultModelCopyWith<$Res> {
  factory $QuizQuestionResultModelCopyWith(QuizQuestionResultModel value,
          $Res Function(QuizQuestionResultModel) _then) =
      _$QuizQuestionResultModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'set_id') String setId,
      @JsonKey(name: 'question_id') int questionId,
      @JsonKey(name: 'topic_name') String topicName,
      @ExamTypeConverter() ExamType exam,
      @JsonKey(name: 'correct_letter') String correctLetter,
      @JsonKey(name: 'is_correct') bool isCorrect,
      @JsonKey(name: 'chosen_letter') String? chosenLetter,
      @JsonKey(name: 'answered_at') String? answeredAt,
      @JsonKey(name: 'time_ms') int? timeMs});
}

/// @nodoc
class _$QuizQuestionResultModelCopyWithImpl<$Res>
    implements $QuizQuestionResultModelCopyWith<$Res> {
  _$QuizQuestionResultModelCopyWithImpl(this._self, this._then);

  final QuizQuestionResultModel _self;
  final $Res Function(QuizQuestionResultModel) _then;

  /// Create a copy of QuizQuestionResultModel
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
              as String?,
      timeMs: freezed == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuizQuestionResultModel].
extension QuizQuestionResultModelPatterns on QuizQuestionResultModel {
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
    TResult Function(_QuizQuestionResultModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResultModel() when $default != null:
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
    TResult Function(_QuizQuestionResultModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResultModel():
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
    TResult? Function(_QuizQuestionResultModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResultModel() when $default != null:
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
            @JsonKey(name: 'topic_name') String topicName,
            @ExamTypeConverter() ExamType exam,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'is_correct') bool isCorrect,
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'answered_at') String? answeredAt,
            @JsonKey(name: 'time_ms') int? timeMs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResultModel() when $default != null:
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
            @JsonKey(name: 'set_id') String setId,
            @JsonKey(name: 'question_id') int questionId,
            @JsonKey(name: 'topic_name') String topicName,
            @ExamTypeConverter() ExamType exam,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'is_correct') bool isCorrect,
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'answered_at') String? answeredAt,
            @JsonKey(name: 'time_ms') int? timeMs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResultModel():
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
            @JsonKey(name: 'set_id') String setId,
            @JsonKey(name: 'question_id') int questionId,
            @JsonKey(name: 'topic_name') String topicName,
            @ExamTypeConverter() ExamType exam,
            @JsonKey(name: 'correct_letter') String correctLetter,
            @JsonKey(name: 'is_correct') bool isCorrect,
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'answered_at') String? answeredAt,
            @JsonKey(name: 'time_ms') int? timeMs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizQuestionResultModel() when $default != null:
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
@JsonSerializable()
class _QuizQuestionResultModel implements QuizQuestionResultModel {
  const _QuizQuestionResultModel(
      {@JsonKey(name: 'set_id') required this.setId,
      @JsonKey(name: 'question_id') required this.questionId,
      @JsonKey(name: 'topic_name') required this.topicName,
      @ExamTypeConverter() required this.exam,
      @JsonKey(name: 'correct_letter') required this.correctLetter,
      @JsonKey(name: 'is_correct') required this.isCorrect,
      @JsonKey(name: 'chosen_letter') this.chosenLetter,
      @JsonKey(name: 'answered_at') this.answeredAt,
      @JsonKey(name: 'time_ms') this.timeMs});
  factory _QuizQuestionResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionResultModelFromJson(json);

  @override
  @JsonKey(name: 'set_id')
  final String setId;
  @override
  @JsonKey(name: 'question_id')
  final int questionId;
  @override
  @JsonKey(name: 'topic_name')
  final String topicName;
  @override
  @ExamTypeConverter()
  final ExamType exam;
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
  @JsonKey(name: 'answered_at')
  final String? answeredAt;
  @override
  @JsonKey(name: 'time_ms')
  final int? timeMs;

  /// Create a copy of QuizQuestionResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizQuestionResultModelCopyWith<_QuizQuestionResultModel> get copyWith =>
      __$QuizQuestionResultModelCopyWithImpl<_QuizQuestionResultModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizQuestionResultModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizQuestionResultModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, setId, questionId, topicName,
      exam, correctLetter, isCorrect, chosenLetter, answeredAt, timeMs);

  @override
  String toString() {
    return 'QuizQuestionResultModel(setId: $setId, questionId: $questionId, topicName: $topicName, exam: $exam, correctLetter: $correctLetter, isCorrect: $isCorrect, chosenLetter: $chosenLetter, answeredAt: $answeredAt, timeMs: $timeMs)';
  }
}

/// @nodoc
abstract mixin class _$QuizQuestionResultModelCopyWith<$Res>
    implements $QuizQuestionResultModelCopyWith<$Res> {
  factory _$QuizQuestionResultModelCopyWith(_QuizQuestionResultModel value,
          $Res Function(_QuizQuestionResultModel) _then) =
      __$QuizQuestionResultModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'set_id') String setId,
      @JsonKey(name: 'question_id') int questionId,
      @JsonKey(name: 'topic_name') String topicName,
      @ExamTypeConverter() ExamType exam,
      @JsonKey(name: 'correct_letter') String correctLetter,
      @JsonKey(name: 'is_correct') bool isCorrect,
      @JsonKey(name: 'chosen_letter') String? chosenLetter,
      @JsonKey(name: 'answered_at') String? answeredAt,
      @JsonKey(name: 'time_ms') int? timeMs});
}

/// @nodoc
class __$QuizQuestionResultModelCopyWithImpl<$Res>
    implements _$QuizQuestionResultModelCopyWith<$Res> {
  __$QuizQuestionResultModelCopyWithImpl(this._self, this._then);

  final _QuizQuestionResultModel _self;
  final $Res Function(_QuizQuestionResultModel) _then;

  /// Create a copy of QuizQuestionResultModel
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
    return _then(_QuizQuestionResultModel(
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
              as String?,
      timeMs: freezed == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
