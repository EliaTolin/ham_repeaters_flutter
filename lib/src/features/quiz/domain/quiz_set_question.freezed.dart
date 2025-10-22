// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSetQuestion {
  String get setId;
  int get questionId;
  String? get chosenLetter;
  DateTime? get answeredAt;
  int? get timeMs;

  /// Create a copy of QuizSetQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSetQuestionCopyWith<QuizSetQuestion> get copyWith =>
      _$QuizSetQuestionCopyWithImpl<QuizSetQuestion>(
          this as QuizSetQuestion, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSetQuestion &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.chosenLetter, chosenLetter) ||
                other.chosenLetter == chosenLetter) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, setId, questionId, chosenLetter, answeredAt, timeMs);

  @override
  String toString() {
    return 'QuizSetQuestion(setId: $setId, questionId: $questionId, chosenLetter: $chosenLetter, answeredAt: $answeredAt, timeMs: $timeMs)';
  }
}

/// @nodoc
abstract mixin class $QuizSetQuestionCopyWith<$Res> {
  factory $QuizSetQuestionCopyWith(
          QuizSetQuestion value, $Res Function(QuizSetQuestion) _then) =
      _$QuizSetQuestionCopyWithImpl;
  @useResult
  $Res call(
      {String setId,
      int questionId,
      String? chosenLetter,
      DateTime? answeredAt,
      int? timeMs});
}

/// @nodoc
class _$QuizSetQuestionCopyWithImpl<$Res>
    implements $QuizSetQuestionCopyWith<$Res> {
  _$QuizSetQuestionCopyWithImpl(this._self, this._then);

  final QuizSetQuestion _self;
  final $Res Function(QuizSetQuestion) _then;

  /// Create a copy of QuizSetQuestion
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
              as DateTime?,
      timeMs: freezed == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuizSetQuestion].
extension QuizSetQuestionPatterns on QuizSetQuestion {
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
    TResult Function(_QuizSetQuestion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestion() when $default != null:
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
    TResult Function(_QuizSetQuestion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestion():
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
    TResult? Function(_QuizSetQuestion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestion() when $default != null:
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
    TResult Function(String setId, int questionId, String? chosenLetter,
            DateTime? answeredAt, int? timeMs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestion() when $default != null:
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
    TResult Function(String setId, int questionId, String? chosenLetter,
            DateTime? answeredAt, int? timeMs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestion():
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
    TResult? Function(String setId, int questionId, String? chosenLetter,
            DateTime? answeredAt, int? timeMs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetQuestion() when $default != null:
        return $default(_that.setId, _that.questionId, _that.chosenLetter,
            _that.answeredAt, _that.timeMs);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuizSetQuestion implements QuizSetQuestion {
  const _QuizSetQuestion(
      {required this.setId,
      required this.questionId,
      this.chosenLetter,
      this.answeredAt,
      this.timeMs});

  @override
  final String setId;
  @override
  final int questionId;
  @override
  final String? chosenLetter;
  @override
  final DateTime? answeredAt;
  @override
  final int? timeMs;

  /// Create a copy of QuizSetQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSetQuestionCopyWith<_QuizSetQuestion> get copyWith =>
      __$QuizSetQuestionCopyWithImpl<_QuizSetQuestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSetQuestion &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.chosenLetter, chosenLetter) ||
                other.chosenLetter == chosenLetter) &&
            (identical(other.answeredAt, answeredAt) ||
                other.answeredAt == answeredAt) &&
            (identical(other.timeMs, timeMs) || other.timeMs == timeMs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, setId, questionId, chosenLetter, answeredAt, timeMs);

  @override
  String toString() {
    return 'QuizSetQuestion(setId: $setId, questionId: $questionId, chosenLetter: $chosenLetter, answeredAt: $answeredAt, timeMs: $timeMs)';
  }
}

/// @nodoc
abstract mixin class _$QuizSetQuestionCopyWith<$Res>
    implements $QuizSetQuestionCopyWith<$Res> {
  factory _$QuizSetQuestionCopyWith(
          _QuizSetQuestion value, $Res Function(_QuizSetQuestion) _then) =
      __$QuizSetQuestionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String setId,
      int questionId,
      String? chosenLetter,
      DateTime? answeredAt,
      int? timeMs});
}

/// @nodoc
class __$QuizSetQuestionCopyWithImpl<$Res>
    implements _$QuizSetQuestionCopyWith<$Res> {
  __$QuizSetQuestionCopyWithImpl(this._self, this._then);

  final _QuizSetQuestion _self;
  final $Res Function(_QuizSetQuestion) _then;

  /// Create a copy of QuizSetQuestion
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
    return _then(_QuizSetQuestion(
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
              as DateTime?,
      timeMs: freezed == timeMs
          ? _self.timeMs
          : timeMs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
