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
  String get quizSetId;
  List<Question> get questions;
  int get totalQuestions;

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
            (identical(other.quizSetId, quizSetId) ||
                other.quizSetId == quizSetId) &&
            const DeepCollectionEquality().equals(other.questions, questions) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quizSetId,
      const DeepCollectionEquality().hash(questions), totalQuestions);

  @override
  String toString() {
    return 'QuizState(quizSetId: $quizSetId, questions: $questions, totalQuestions: $totalQuestions)';
  }
}

/// @nodoc
abstract mixin class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) _then) =
      _$QuizStateCopyWithImpl;
  @useResult
  $Res call({String quizSetId, List<Question> questions, int totalQuestions});
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
    Object? quizSetId = null,
    Object? questions = null,
    Object? totalQuestions = null,
  }) {
    return _then(_self.copyWith(
      quizSetId: null == quizSetId
          ? _self.quizSetId
          : quizSetId // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _self.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      totalQuestions: null == totalQuestions
          ? _self.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
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
            String quizSetId, List<Question> questions, int totalQuestions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizState() when $default != null:
        return $default(_that.quizSetId, _that.questions, _that.totalQuestions);
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
            String quizSetId, List<Question> questions, int totalQuestions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizState():
        return $default(_that.quizSetId, _that.questions, _that.totalQuestions);
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
            String quizSetId, List<Question> questions, int totalQuestions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizState() when $default != null:
        return $default(_that.quizSetId, _that.questions, _that.totalQuestions);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuizState implements QuizState {
  const _QuizState(
      {required this.quizSetId,
      required final List<Question> questions,
      required this.totalQuestions})
      : _questions = questions;

  @override
  final String quizSetId;
  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final int totalQuestions;

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
            (identical(other.quizSetId, quizSetId) ||
                other.quizSetId == quizSetId) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quizSetId,
      const DeepCollectionEquality().hash(_questions), totalQuestions);

  @override
  String toString() {
    return 'QuizState(quizSetId: $quizSetId, questions: $questions, totalQuestions: $totalQuestions)';
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
  $Res call({String quizSetId, List<Question> questions, int totalQuestions});
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
    Object? quizSetId = null,
    Object? questions = null,
    Object? totalQuestions = null,
  }) {
    return _then(_QuizState(
      quizSetId: null == quizSetId
          ? _self.quizSetId
          : quizSetId // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _self._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      totalQuestions: null == totalQuestions
          ? _self.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
