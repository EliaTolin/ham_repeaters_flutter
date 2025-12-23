// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSetQuestionModel {
  @JsonKey(name: 'set_id')
  String get setId;
  @JsonKey(name: 'question_id')
  int get questionId;
  @JsonKey(name: 'chosen_letter')
  String? get chosenLetter;
  @JsonKey(name: 'answered_at')
  String? get answeredAt;
  @JsonKey(name: 'time_ms')
  int? get timeMs;

  /// Create a copy of QuizSetQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSetQuestionModelCopyWith<QuizSetQuestionModel> get copyWith =>
      _$QuizSetQuestionModelCopyWithImpl<QuizSetQuestionModel>(
          this as QuizSetQuestionModel, _$identity);

  /// Serializes this QuizSetQuestionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSetQuestionModel &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.chosenLetter, chosenLetter) ||
                other.chosenLetter == chosenLetter) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, setId, questionId, chosenLetter, answeredAt, timeMs);

  @override
  String toString() {
    return 'QuizSetQuestionModel(setId: $setId, questionId: $questionId, chosenLetter: $chosenLetter, answeredAt: $answeredAt, timeMs: $timeMs)';
  }
}

/// @nodoc
abstract mixin class $QuizSetQuestionModelCopyWith<$Res> {
  factory $QuizSetQuestionModelCopyWith(QuizSetQuestionModel value,
          $Res Function(QuizSetQuestionModel) _then) =
      _$QuizSetQuestionModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'set_id') String setId,
      @JsonKey(name: 'question_id') int questionId,
      @JsonKey(name: 'chosen_letter') String? chosenLetter,
      @JsonKey(name: 'answered_at') String? answeredAt,
      @JsonKey(name: 'time_ms') int? timeMs});
}

/// @nodoc
class _$QuizSetQuestionModelCopyWithImpl<$Res>
    implements $QuizSetQuestionModelCopyWith<$Res> {
  _$QuizSetQuestionModelCopyWithImpl(this._self, this._then);

  final QuizSetQuestionModel _self;
  final $Res Function(QuizSetQuestionModel) _then;

  /// Create a copy of QuizSetQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setId = null,
    Object? questionId = null,
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

/// Adds pattern-matching-related methods to [QuizSetQuestionModel].
extension QuizSetQuestionModelPatterns on QuizSetQuestionModel {
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
    TResult Function(_QuizSetQuestionModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionModel() when $default != null:
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
    TResult Function(_QuizSetQuestionModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionModel():
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
    TResult? Function(_QuizSetQuestionModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionModel() when $default != null:
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
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'answered_at') String? answeredAt,
            @JsonKey(name: 'time_ms') int? timeMs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionModel() when $default != null:
        return $default(_that.setId, _that.questionId, _that.chosenLetter,
            _that.answeredAt, _that.timeMs);
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
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'answered_at') String? answeredAt,
            @JsonKey(name: 'time_ms') int? timeMs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionModel():
        return $default(_that.setId, _that.questionId, _that.chosenLetter,
            _that.answeredAt, _that.timeMs);
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
            @JsonKey(name: 'chosen_letter') String? chosenLetter,
            @JsonKey(name: 'answered_at') String? answeredAt,
            @JsonKey(name: 'time_ms') int? timeMs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestionModel() when $default != null:
        return $default(_that.setId, _that.questionId, _that.chosenLetter,
            _that.answeredAt, _that.timeMs);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QuizSetQuestionModel implements QuizSetQuestionModel {
  const _QuizSetQuestionModel(
      {@JsonKey(name: 'set_id') required this.setId,
      @JsonKey(name: 'question_id') required this.questionId,
      @JsonKey(name: 'chosen_letter') this.chosenLetter,
      @JsonKey(name: 'answered_at') this.answeredAt,
      @JsonKey(name: 'time_ms') this.timeMs});
  factory _QuizSetQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetQuestionModelFromJson(json);

  @override
  @JsonKey(name: 'set_id')
  final String setId;
  @override
  @JsonKey(name: 'question_id')
  final int questionId;
  @override
  @JsonKey(name: 'chosen_letter')
  final String? chosenLetter;
  @override
  @JsonKey(name: 'answered_at')
  final String? answeredAt;
  @override
  @JsonKey(name: 'time_ms')
  final int? timeMs;

  /// Create a copy of QuizSetQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSetQuestionModelCopyWith<_QuizSetQuestionModel> get copyWith =>
      __$QuizSetQuestionModelCopyWithImpl<_QuizSetQuestionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizSetQuestionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSetQuestionModel &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.chosenLetter, chosenLetter) ||
                other.chosenLetter == chosenLetter) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, setId, questionId, chosenLetter, answeredAt, timeMs);

  @override
  String toString() {
    return 'QuizSetQuestionModel(setId: $setId, questionId: $questionId, chosenLetter: $chosenLetter, answeredAt: $answeredAt, timeMs: $timeMs)';
  }
}

/// @nodoc
abstract mixin class _$QuizSetQuestionModelCopyWith<$Res>
    implements $QuizSetQuestionModelCopyWith<$Res> {
  factory _$QuizSetQuestionModelCopyWith(_QuizSetQuestionModel value,
          $Res Function(_QuizSetQuestionModel) _then) =
      __$QuizSetQuestionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'set_id') String setId,
      @JsonKey(name: 'question_id') int questionId,
      @JsonKey(name: 'chosen_letter') String? chosenLetter,
      @JsonKey(name: 'answered_at') String? answeredAt,
      @JsonKey(name: 'time_ms') int? timeMs});
}

/// @nodoc
class __$QuizSetQuestionModelCopyWithImpl<$Res>
    implements _$QuizSetQuestionModelCopyWith<$Res> {
  __$QuizSetQuestionModelCopyWithImpl(this._self, this._then);

  final _QuizSetQuestionModel _self;
  final $Res Function(_QuizSetQuestionModel) _then;

  /// Create a copy of QuizSetQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? setId = null,
    Object? questionId = null,
    Object? chosenLetter = freezed,
    Object? answeredAt = freezed,
    Object? timeMs = freezed,
  }) {
    return _then(_QuizSetQuestionModel(
      setId: null == setId
          ? _self.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
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
