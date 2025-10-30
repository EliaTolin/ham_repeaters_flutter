// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSetResponseModel {
  @JsonKey(name: 'quizSetId')
  String get quizSetId;
  List<QuestionModel> get questions;
  @JsonKey(name: 'totalQuestions')
  int get totalQuestions;

  /// Create a copy of QuizSetResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSetResponseModelCopyWith<QuizSetResponseModel> get copyWith =>
      _$QuizSetResponseModelCopyWithImpl<QuizSetResponseModel>(
          this as QuizSetResponseModel, _$identity);

  /// Serializes this QuizSetResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSetResponseModel &&
            (identical(other.quizSetId, quizSetId) ||
                other.quizSetId == quizSetId) &&
            const DeepCollectionEquality().equals(other.questions, questions) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quizSetId,
      const DeepCollectionEquality().hash(questions), totalQuestions);

  @override
  String toString() {
    return 'QuizSetResponseModel(quizSetId: $quizSetId, questions: $questions, totalQuestions: $totalQuestions)';
  }
}

/// @nodoc
abstract mixin class $QuizSetResponseModelCopyWith<$Res> {
  factory $QuizSetResponseModelCopyWith(QuizSetResponseModel value,
          $Res Function(QuizSetResponseModel) _then) =
      _$QuizSetResponseModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'quizSetId') String quizSetId,
      List<QuestionModel> questions,
      @JsonKey(name: 'totalQuestions') int totalQuestions});
}

/// @nodoc
class _$QuizSetResponseModelCopyWithImpl<$Res>
    implements $QuizSetResponseModelCopyWith<$Res> {
  _$QuizSetResponseModelCopyWithImpl(this._self, this._then);

  final QuizSetResponseModel _self;
  final $Res Function(QuizSetResponseModel) _then;

  /// Create a copy of QuizSetResponseModel
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
              as List<QuestionModel>,
      totalQuestions: null == totalQuestions
          ? _self.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuizSetResponseModel].
extension QuizSetResponseModelPatterns on QuizSetResponseModel {
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
    TResult Function(_QuizSetResponseModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetResponseModel() when $default != null:
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
    TResult Function(_QuizSetResponseModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetResponseModel():
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
    TResult? Function(_QuizSetResponseModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetResponseModel() when $default != null:
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
            @JsonKey(name: 'quizSetId') String quizSetId,
            List<QuestionModel> questions,
            @JsonKey(name: 'totalQuestions') int totalQuestions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetResponseModel() when $default != null:
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
            @JsonKey(name: 'quizSetId') String quizSetId,
            List<QuestionModel> questions,
            @JsonKey(name: 'totalQuestions') int totalQuestions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetResponseModel():
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
            @JsonKey(name: 'quizSetId') String quizSetId,
            List<QuestionModel> questions,
            @JsonKey(name: 'totalQuestions') int totalQuestions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetResponseModel() when $default != null:
        return $default(_that.quizSetId, _that.questions, _that.totalQuestions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QuizSetResponseModel implements QuizSetResponseModel {
  const _QuizSetResponseModel(
      {@JsonKey(name: 'quizSetId') required this.quizSetId,
      required final List<QuestionModel> questions,
      @JsonKey(name: 'totalQuestions') required this.totalQuestions})
      : _questions = questions;
  factory _QuizSetResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetResponseModelFromJson(json);

  @override
  @JsonKey(name: 'quizSetId')
  final String quizSetId;
  final List<QuestionModel> _questions;
  @override
  List<QuestionModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  @JsonKey(name: 'totalQuestions')
  final int totalQuestions;

  /// Create a copy of QuizSetResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSetResponseModelCopyWith<_QuizSetResponseModel> get copyWith =>
      __$QuizSetResponseModelCopyWithImpl<_QuizSetResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizSetResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSetResponseModel &&
            (identical(other.quizSetId, quizSetId) ||
                other.quizSetId == quizSetId) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quizSetId,
      const DeepCollectionEquality().hash(_questions), totalQuestions);

  @override
  String toString() {
    return 'QuizSetResponseModel(quizSetId: $quizSetId, questions: $questions, totalQuestions: $totalQuestions)';
  }
}

/// @nodoc
abstract mixin class _$QuizSetResponseModelCopyWith<$Res>
    implements $QuizSetResponseModelCopyWith<$Res> {
  factory _$QuizSetResponseModelCopyWith(_QuizSetResponseModel value,
          $Res Function(_QuizSetResponseModel) _then) =
      __$QuizSetResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'quizSetId') String quizSetId,
      List<QuestionModel> questions,
      @JsonKey(name: 'totalQuestions') int totalQuestions});
}

/// @nodoc
class __$QuizSetResponseModelCopyWithImpl<$Res>
    implements _$QuizSetResponseModelCopyWith<$Res> {
  __$QuizSetResponseModelCopyWithImpl(this._self, this._then);

  final _QuizSetResponseModel _self;
  final $Res Function(_QuizSetResponseModel) _then;

  /// Create a copy of QuizSetResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quizSetId = null,
    Object? questions = null,
    Object? totalQuestions = null,
  }) {
    return _then(_QuizSetResponseModel(
      quizSetId: null == quizSetId
          ? _self.quizSetId
          : quizSetId // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _self._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>,
      totalQuestions: null == totalQuestions
          ? _self.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
