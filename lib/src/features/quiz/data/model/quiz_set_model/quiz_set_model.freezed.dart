// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSetModel {
  String get id;
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'started_at')
  String get startedAt;
  ExamType? get exam;
  @JsonKey(name: 'custom_topics')
  List<String>? get customTopics;
  @JsonKey(name: 'finished_at')
  String? get finishedAt;

  /// Create a copy of QuizSetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSetModelCopyWith<QuizSetModel> get copyWith =>
      _$QuizSetModelCopyWithImpl<QuizSetModel>(
          this as QuizSetModel, _$identity);

  /// Serializes this QuizSetModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSetModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            const DeepCollectionEquality()
                .equals(other.customTopics, customTopics) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, startedAt, exam,
      const DeepCollectionEquality().hash(customTopics), finishedAt);

  @override
  String toString() {
    return 'QuizSetModel(id: $id, userId: $userId, startedAt: $startedAt, exam: $exam, customTopics: $customTopics, finishedAt: $finishedAt)';
  }
}

/// @nodoc
abstract mixin class $QuizSetModelCopyWith<$Res> {
  factory $QuizSetModelCopyWith(
          QuizSetModel value, $Res Function(QuizSetModel) _then) =
      _$QuizSetModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'started_at') String startedAt,
      ExamType? exam,
      @JsonKey(name: 'custom_topics') List<String>? customTopics,
      @JsonKey(name: 'finished_at') String? finishedAt});
}

/// @nodoc
class _$QuizSetModelCopyWithImpl<$Res> implements $QuizSetModelCopyWith<$Res> {
  _$QuizSetModelCopyWithImpl(this._self, this._then);

  final QuizSetModel _self;
  final $Res Function(QuizSetModel) _then;

  /// Create a copy of QuizSetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? exam = freezed,
    Object? customTopics = freezed,
    Object? finishedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String,
      exam: freezed == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamType?,
      customTopics: freezed == customTopics
          ? _self.customTopics
          : customTopics // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      finishedAt: freezed == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuizSetModel].
extension QuizSetModelPatterns on QuizSetModel {
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
    TResult Function(_QuizSetModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetModel() when $default != null:
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
    TResult Function(_QuizSetModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetModel():
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
    TResult? Function(_QuizSetModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetModel() when $default != null:
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
            String id,
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'started_at') String startedAt,
            ExamType? exam,
            @JsonKey(name: 'custom_topics') List<String>? customTopics,
            @JsonKey(name: 'finished_at') String? finishedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSetModel() when $default != null:
        return $default(_that.id, _that.userId, _that.startedAt, _that.exam,
            _that.customTopics, _that.finishedAt);
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
            String id,
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'started_at') String startedAt,
            ExamType? exam,
            @JsonKey(name: 'custom_topics') List<String>? customTopics,
            @JsonKey(name: 'finished_at') String? finishedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetModel():
        return $default(_that.id, _that.userId, _that.startedAt, _that.exam,
            _that.customTopics, _that.finishedAt);
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
            String id,
            @JsonKey(name: 'user_id') String userId,
            @JsonKey(name: 'started_at') String startedAt,
            ExamType? exam,
            @JsonKey(name: 'custom_topics') List<String>? customTopics,
            @JsonKey(name: 'finished_at') String? finishedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSetModel() when $default != null:
        return $default(_that.id, _that.userId, _that.startedAt, _that.exam,
            _that.customTopics, _that.finishedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QuizSetModel implements QuizSetModel {
  const _QuizSetModel(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'started_at') required this.startedAt,
      this.exam,
      @JsonKey(name: 'custom_topics') final List<String>? customTopics,
      @JsonKey(name: 'finished_at') this.finishedAt})
      : _customTopics = customTopics;
  factory _QuizSetModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSetModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'started_at')
  final String startedAt;
  @override
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

  @override
  @JsonKey(name: 'finished_at')
  final String? finishedAt;

  /// Create a copy of QuizSetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSetModelCopyWith<_QuizSetModel> get copyWith =>
      __$QuizSetModelCopyWithImpl<_QuizSetModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuizSetModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSetModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            const DeepCollectionEquality()
                .equals(other._customTopics, _customTopics) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, startedAt, exam,
      const DeepCollectionEquality().hash(_customTopics), finishedAt);

  @override
  String toString() {
    return 'QuizSetModel(id: $id, userId: $userId, startedAt: $startedAt, exam: $exam, customTopics: $customTopics, finishedAt: $finishedAt)';
  }
}

/// @nodoc
abstract mixin class _$QuizSetModelCopyWith<$Res>
    implements $QuizSetModelCopyWith<$Res> {
  factory _$QuizSetModelCopyWith(
          _QuizSetModel value, $Res Function(_QuizSetModel) _then) =
      __$QuizSetModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'started_at') String startedAt,
      ExamType? exam,
      @JsonKey(name: 'custom_topics') List<String>? customTopics,
      @JsonKey(name: 'finished_at') String? finishedAt});
}

/// @nodoc
class __$QuizSetModelCopyWithImpl<$Res>
    implements _$QuizSetModelCopyWith<$Res> {
  __$QuizSetModelCopyWithImpl(this._self, this._then);

  final _QuizSetModel _self;
  final $Res Function(_QuizSetModel) _then;

  /// Create a copy of QuizSetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? exam = freezed,
    Object? customTopics = freezed,
    Object? finishedAt = freezed,
  }) {
    return _then(_QuizSetModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String,
      exam: freezed == exam
          ? _self.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as ExamType?,
      customTopics: freezed == customTopics
          ? _self._customTopics
          : customTopics // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      finishedAt: freezed == finishedAt
          ? _self.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
