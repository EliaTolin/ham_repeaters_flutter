// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set_score_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSetScoreModel {
  @JsonKey(name: 'set_id')
  String get setId;
  @JsonKey(name: 'user_id')
  String get userId;
  @QuizModeConverter()
  QuizMode get mode;
  int get answered;
  int get correct;
  int get wrong;
  int get total;
  @JsonKey(name: 'accuracy_pct')
  double get accuracyPct;
  @JsonKey(name: 'started_at')
  DateTime get startedAt;
  @JsonKey(name: 'finished_at')
  DateTime? get finishedAt;
  @ExamTypeConverter()
  ExamType? get exam;
  @JsonKey(name: 'custom_topics')
  List<String>? get customTopics;

  /// Create a copy of QuizSetScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSetScoreModelCopyWith<QuizSetScoreModel> get copyWith =>
      _$QuizSetScoreModelCopyWithImpl<QuizSetScoreModel>(
          this as QuizSetScoreModel, _$identity);

  /// Serializes this QuizSetScoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSetScoreModel &&
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
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            const DeepCollectionEquality()
                .equals(other.customTopics, customTopics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      startedAt,
      finishedAt,
      exam,
      const DeepCollectionEquality().hash(customTopics));

  @override
  String toString() {
    return 'QuizSetScoreModel(setId: $setId, userId: $userId, mode: $mode, answered: $answered, correct: $correct, wrong: $wrong, total: $total, accuracyPct: $accuracyPct, startedAt: $startedAt, finishedAt: $finishedAt, exam: $exam, customTopics: $customTopics)';
  }
}

/// @nodoc
abstract mixin class $QuizSetScoreModelCopyWith<$Res> {
  factory $QuizSetScoreModelCopyWith(
          QuizSetScoreModel value, $Res Function(QuizSetScoreModel) _then) =
      _$QuizSetScoreModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'set_id') String setId,
      @JsonKey(name: 'user_id') String userId,
      @QuizModeConverter() QuizMode mode,
      int answered,
      int correct,
      int wrong,
      int total,
      @JsonKey(name: 'accuracy_pct') double accuracyPct,
      @JsonKey(name: 'started_at') DateTime startedAt,
      @JsonKey(name: 'finished_at') DateTime? finishedAt,
      @ExamTypeConverter() ExamType? exam,
      @JsonKey(name: 'custom_topics') List<String>? customTopics});
}

/// @nodoc
class _$QuizSetScoreModelCopyWithImpl<$Res>
    implements $QuizSetScoreModelCopyWith<$Res> {
  _$QuizSetScoreModelCopyWithImpl(this._self, this._then);

  final QuizSetScoreModel _self;
  final $Res Function(QuizSetScoreModel) _then;

  /// Create a copy of QuizSetScoreModel
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
    Object? startedAt = null,
    Object? finishedAt = freezed,
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
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      finishedAt: freezed == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

/// Adds pattern-matching-related methods to [QuizSetScoreModel].
extension QuizSetScoreModelPatterns on QuizSetScoreModel {
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
    TResult Function(_QuizSetScoreModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetScoreModel() when $default != null:
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
    TResult Function(_QuizSetScoreModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetScoreModel():
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
    TResult? Function(_QuizSetScoreModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetScoreModel() when $default != null:
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
            @JsonKey(name: 'user_id') String userId,
            @QuizModeConverter() QuizMode mode,
            int answered,
            int correct,
            int wrong,
            int total,
            @JsonKey(name: 'accuracy_pct') double accuracyPct,
            @JsonKey(name: 'started_at') DateTime startedAt,
            @JsonKey(name: 'finished_at') DateTime? finishedAt,
            @ExamTypeConverter() ExamType? exam,
            @JsonKey(name: 'custom_topics') List<String>? customTopics)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetScoreModel() when $default != null:
        return $default(
            _that.setId,
            _that.userId,
            _that.mode,
            _that.answered,
            _that.correct,
            _that.wrong,
            _that.total,
            _that.accuracyPct,
            _that.startedAt,
            _that.finishedAt,
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
            @JsonKey(name: 'set_id') String setId,
            @JsonKey(name: 'user_id') String userId,
            @QuizModeConverter() QuizMode mode,
            int answered,
            int correct,
            int wrong,
            int total,
            @JsonKey(name: 'accuracy_pct') double accuracyPct,
            @JsonKey(name: 'started_at') DateTime startedAt,
            @JsonKey(name: 'finished_at') DateTime? finishedAt,
            @ExamTypeConverter() ExamType? exam,
            @JsonKey(name: 'custom_topics') List<String>? customTopics)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetScoreModel():
        return $default(
            _that.setId,
            _that.userId,
            _that.mode,
            _that.answered,
            _that.correct,
            _that.wrong,
            _that.total,
            _that.accuracyPct,
            _that.startedAt,
            _that.finishedAt,
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
            @JsonKey(name: 'set_id') String setId,
            @JsonKey(name: 'user_id') String userId,
            @QuizModeConverter() QuizMode mode,
            int answered,
            int correct,
            int wrong,
            int total,
            @JsonKey(name: 'accuracy_pct') double accuracyPct,
            @JsonKey(name: 'started_at') DateTime startedAt,
            @JsonKey(name: 'finished_at') DateTime? finishedAt,
            @ExamTypeConverter() ExamType? exam,
            @JsonKey(name: 'custom_topics') List<String>? customTopics)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetScoreModel() when $default != null:
        return $default(
            _that.setId,
            _that.userId,
            _that.mode,
            _that.answered,
            _that.correct,
            _that.wrong,
            _that.total,
            _that.accuracyPct,
            _that.startedAt,
            _that.finishedAt,
            _that.exam,
            _that.customTopics);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QuizSetScoreModel implements QuizSetScoreModel {
  const _QuizSetScoreModel(
      {@JsonKey(name: 'set_id') required this.setId,
      @JsonKey(name: 'user_id') required this.userId,
      @QuizModeConverter() required this.mode,
      required this.answered,
      required this.correct,
      required this.wrong,
      required this.total,
      @JsonKey(name: 'accuracy_pct') required this.accuracyPct,
      @JsonKey(name: 'started_at') required this.startedAt,
      @JsonKey(name: 'finished_at') this.finishedAt,
      @ExamTypeConverter() this.exam,
      @JsonKey(name: 'custom_topics') final List<String>? customTopics})
      : _customTopics = customTopics;
  factory _QuizSetScoreModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetScoreModelFromJson(json);

  @override
  @JsonKey(name: 'set_id')
  final String setId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @QuizModeConverter()
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
  @JsonKey(name: 'accuracy_pct')
  final double accuracyPct;
  @override
  @JsonKey(name: 'started_at')
  final DateTime startedAt;
  @override
  @JsonKey(name: 'finished_at')
  final DateTime? finishedAt;
  @override
  @ExamTypeConverter()
  final ExamType? exam;
  final List<String>? _customTopics;
  @override
  @JsonKey(name: 'custom_topics')
  List<String>? get customTopics {
    final value = _customTopics;
    if (value == null) return null;
    if (_customTopics is EqualUnmodifiableListView) return _customTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of QuizSetScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSetScoreModelCopyWith<_QuizSetScoreModel> get copyWith =>
      __$QuizSetScoreModelCopyWithImpl<_QuizSetScoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizSetScoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSetScoreModel &&
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
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            const DeepCollectionEquality()
                .equals(other._customTopics, _customTopics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      startedAt,
      finishedAt,
      exam,
      const DeepCollectionEquality().hash(_customTopics));

  @override
  String toString() {
    return 'QuizSetScoreModel(setId: $setId, userId: $userId, mode: $mode, answered: $answered, correct: $correct, wrong: $wrong, total: $total, accuracyPct: $accuracyPct, startedAt: $startedAt, finishedAt: $finishedAt, exam: $exam, customTopics: $customTopics)';
  }
}

/// @nodoc
abstract mixin class _$QuizSetScoreModelCopyWith<$Res>
    implements $QuizSetScoreModelCopyWith<$Res> {
  factory _$QuizSetScoreModelCopyWith(
          _QuizSetScoreModel value, $Res Function(_QuizSetScoreModel) _then) =
      __$QuizSetScoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'set_id') String setId,
      @JsonKey(name: 'user_id') String userId,
      @QuizModeConverter() QuizMode mode,
      int answered,
      int correct,
      int wrong,
      int total,
      @JsonKey(name: 'accuracy_pct') double accuracyPct,
      @JsonKey(name: 'started_at') DateTime startedAt,
      @JsonKey(name: 'finished_at') DateTime? finishedAt,
      @ExamTypeConverter() ExamType? exam,
      @JsonKey(name: 'custom_topics') List<String>? customTopics});
}

/// @nodoc
class __$QuizSetScoreModelCopyWithImpl<$Res>
    implements _$QuizSetScoreModelCopyWith<$Res> {
  __$QuizSetScoreModelCopyWithImpl(this._self, this._then);

  final _QuizSetScoreModel _self;
  final $Res Function(_QuizSetScoreModel) _then;

  /// Create a copy of QuizSetScoreModel
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
    Object? startedAt = null,
    Object? finishedAt = freezed,
    Object? exam = freezed,
    Object? customTopics = freezed,
  }) {
    return _then(_QuizSetScoreModel(
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
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      finishedAt: freezed == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
