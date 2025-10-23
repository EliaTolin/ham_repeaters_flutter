// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizState {
  QuizSetResponse get quizSet;
  int get currentQuestionIndex;
  Map<int, String?> get answers; // questionId -> chosenLetter
  Map<int, int> get questionTimes; // questionId -> timeMs
  DateTime get quizStartTime;
  bool get isSubmitting;
  String? get errorMessage;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizStateCopyWith<QuizState> get copyWith =>
      _$QuizStateCopyWithImpl<QuizState>(this as QuizState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizState &&
            (identical(other.quizSet, quizSet) || other.quizSet == quizSet) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            const DeepCollectionEquality()
                .equals(other.questionTimes, questionTimes) &&
            (identical(other.quizStartTime, quizStartTime) ||
                other.quizStartTime == quizStartTime) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      quizSet,
      currentQuestionIndex,
      const DeepCollectionEquality().hash(answers),
      const DeepCollectionEquality().hash(questionTimes),
      quizStartTime,
      isSubmitting,
      errorMessage);

  @override
  String toString() {
    return 'QuizState(quizSet: $quizSet, currentQuestionIndex: $currentQuestionIndex, answers: $answers, questionTimes: $questionTimes, quizStartTime: $quizStartTime, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) _then) =
      _$QuizStateCopyWithImpl;
  @useResult
  $Res call(
      {QuizSetResponse quizSet,
      int currentQuestionIndex,
      Map<int, String?> answers,
      Map<int, int> questionTimes,
      DateTime quizStartTime,
      bool isSubmitting,
      String? errorMessage});

  $QuizSetResponseCopyWith<$Res> get quizSet;
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res> implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._self, this._then);

  final QuizState _self;
  final $Res Function(QuizState) _then;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizSet = null,
    Object? currentQuestionIndex = null,
    Object? answers = null,
    Object? questionTimes = null,
    Object? quizStartTime = null,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      quizSet: null == quizSet
          ? _self.quizSet
          : quizSet // ignore: cast_nullable_to_non_nullable
              as QuizSetResponse,
      currentQuestionIndex: null == currentQuestionIndex
          ? _self.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _self.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<int, String?>,
      questionTimes: null == questionTimes
          ? _self.questionTimes
          : questionTimes // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      quizStartTime: null == quizStartTime
          ? _self.quizStartTime
          : quizStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizSetResponseCopyWith<$Res> get quizSet {
    return $QuizSetResponseCopyWith<$Res>(_self.quizSet, (value) {
      return _then(_self.copyWith(quizSet: value));
    });
  }
}

/// Adds pattern-matching-related methods to [QuizState].
extension QuizStatePatterns on QuizState {
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
    TResult Function(_QuizState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizState() when $default != null:
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
    TResult Function(_QuizState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizState():
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
    TResult? Function(_QuizState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizState() when $default != null:
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
            QuizSetResponse quizSet,
            int currentQuestionIndex,
            Map<int, String?> answers,
            Map<int, int> questionTimes,
            DateTime quizStartTime,
            bool isSubmitting,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizState() when $default != null:
        return $default(
            _that.quizSet,
            _that.currentQuestionIndex,
            _that.answers,
            _that.questionTimes,
            _that.quizStartTime,
            _that.isSubmitting,
            _that.errorMessage);
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
            QuizSetResponse quizSet,
            int currentQuestionIndex,
            Map<int, String?> answers,
            Map<int, int> questionTimes,
            DateTime quizStartTime,
            bool isSubmitting,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizState():
        return $default(
            _that.quizSet,
            _that.currentQuestionIndex,
            _that.answers,
            _that.questionTimes,
            _that.quizStartTime,
            _that.isSubmitting,
            _that.errorMessage);
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
            QuizSetResponse quizSet,
            int currentQuestionIndex,
            Map<int, String?> answers,
            Map<int, int> questionTimes,
            DateTime quizStartTime,
            bool isSubmitting,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizState() when $default != null:
        return $default(
            _that.quizSet,
            _that.currentQuestionIndex,
            _that.answers,
            _that.questionTimes,
            _that.quizStartTime,
            _that.isSubmitting,
            _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuizState extends QuizState {
  const _QuizState(
      {required this.quizSet,
      required this.currentQuestionIndex,
      required final Map<int, String?> answers,
      required final Map<int, int> questionTimes,
      required this.quizStartTime,
      this.isSubmitting = false,
      this.errorMessage})
      : _answers = answers,
        _questionTimes = questionTimes,
        super._();

  @override
  final QuizSetResponse quizSet;
  @override
  final int currentQuestionIndex;
  final Map<int, String?> _answers;
  @override
  Map<int, String?> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

// questionId -> chosenLetter
  final Map<int, int> _questionTimes;
// questionId -> chosenLetter
  @override
  Map<int, int> get questionTimes {
    if (_questionTimes is EqualUnmodifiableMapView) return _questionTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_questionTimes);
  }

// questionId -> timeMs
  @override
  final DateTime quizStartTime;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? errorMessage;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizStateCopyWith<_QuizState> get copyWith =>
      __$QuizStateCopyWithImpl<_QuizState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizState &&
            (identical(other.quizSet, quizSet) || other.quizSet == quizSet) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality()
                .equals(other._questionTimes, _questionTimes) &&
            (identical(other.quizStartTime, quizStartTime) ||
                other.quizStartTime == quizStartTime) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      quizSet,
      currentQuestionIndex,
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(_questionTimes),
      quizStartTime,
      isSubmitting,
      errorMessage);

  @override
  String toString() {
    return 'QuizState(quizSet: $quizSet, currentQuestionIndex: $currentQuestionIndex, answers: $answers, questionTimes: $questionTimes, quizStartTime: $quizStartTime, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$QuizStateCopyWith<$Res>
    implements $QuizStateCopyWith<$Res> {
  factory _$QuizStateCopyWith(
          _QuizState value, $Res Function(_QuizState) _then) =
      __$QuizStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {QuizSetResponse quizSet,
      int currentQuestionIndex,
      Map<int, String?> answers,
      Map<int, int> questionTimes,
      DateTime quizStartTime,
      bool isSubmitting,
      String? errorMessage});

  @override
  $QuizSetResponseCopyWith<$Res> get quizSet;
}

/// @nodoc
class __$QuizStateCopyWithImpl<$Res> implements _$QuizStateCopyWith<$Res> {
  __$QuizStateCopyWithImpl(this._self, this._then);

  final _QuizState _self;
  final $Res Function(_QuizState) _then;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quizSet = null,
    Object? currentQuestionIndex = null,
    Object? answers = null,
    Object? questionTimes = null,
    Object? quizStartTime = null,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_QuizState(
      quizSet: null == quizSet
          ? _self.quizSet
          : quizSet // ignore: cast_nullable_to_non_nullable
              as QuizSetResponse,
      currentQuestionIndex: null == currentQuestionIndex
          ? _self.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<int, String?>,
      questionTimes: null == questionTimes
          ? _self._questionTimes
          : questionTimes // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      quizStartTime: null == quizStartTime
          ? _self.quizStartTime
          : quizStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizSetResponseCopyWith<$Res> get quizSet {
    return $QuizSetResponseCopyWith<$Res>(_self.quizSet, (value) {
      return _then(_self.copyWith(quizSet: value));
    });
  }
}

// dart format on
