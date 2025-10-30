// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSet {
  String get id;
  String get userId;
  DateTime get startedAt;
  ExamType? get exam;
  List<String>? get customTopics;
  DateTime? get finishedAt;

  /// Create a copy of QuizSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizSetCopyWith<QuizSet> get copyWith =>
      _$QuizSetCopyWithImpl<QuizSet>(this as QuizSet, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizSet &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, userId, startedAt, exam,
      const DeepCollectionEquality().hash(customTopics), finishedAt);

  @override
  String toString() {
    return 'QuizSet(id: $id, userId: $userId, startedAt: $startedAt, exam: $exam, customTopics: $customTopics, finishedAt: $finishedAt)';
  }
}

/// @nodoc
abstract mixin class $QuizSetCopyWith<$Res> {
  factory $QuizSetCopyWith(QuizSet value, $Res Function(QuizSet) _then) =
      _$QuizSetCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime startedAt,
      ExamType? exam,
      List<String>? customTopics,
      DateTime? finishedAt});
}

/// @nodoc
class _$QuizSetCopyWithImpl<$Res> implements $QuizSetCopyWith<$Res> {
  _$QuizSetCopyWithImpl(this._self, this._then);

  final QuizSet _self;
  final $Res Function(QuizSet) _then;

  /// Create a copy of QuizSet
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
              as DateTime,
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
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuizSet].
extension QuizSetPatterns on QuizSet {
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
    TResult Function(_QuizSet value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSet() when $default != null:
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
    TResult Function(_QuizSet value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSet():
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
    TResult? Function(_QuizSet value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSet() when $default != null:
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
    TResult Function(String id, String userId, DateTime startedAt,
            ExamType? exam, List<String>? customTopics, DateTime? finishedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizSet() when $default != null:
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
    TResult Function(String id, String userId, DateTime startedAt,
            ExamType? exam, List<String>? customTopics, DateTime? finishedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSet():
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
    TResult? Function(String id, String userId, DateTime startedAt,
            ExamType? exam, List<String>? customTopics, DateTime? finishedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizSet() when $default != null:
        return $default(_that.id, _that.userId, _that.startedAt, _that.exam,
            _that.customTopics, _that.finishedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuizSet implements QuizSet {
  const _QuizSet(
      {required this.id,
      required this.userId,
      required this.startedAt,
      this.exam,
      final List<String>? customTopics,
      this.finishedAt})
      : _customTopics = customTopics;

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime startedAt;
  @override
  final ExamType? exam;
  final List<String>? _customTopics;
  @override
  List<String>? get customTopics {
    final value = _customTopics;
    if (value == null) return null;
    if (_customTopics is EqualUnmodifiableListView) return _customTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? finishedAt;

  /// Create a copy of QuizSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizSetCopyWith<_QuizSet> get copyWith =>
      __$QuizSetCopyWithImpl<_QuizSet>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizSet &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, userId, startedAt, exam,
      const DeepCollectionEquality().hash(_customTopics), finishedAt);

  @override
  String toString() {
    return 'QuizSet(id: $id, userId: $userId, startedAt: $startedAt, exam: $exam, customTopics: $customTopics, finishedAt: $finishedAt)';
  }
}

/// @nodoc
abstract mixin class _$QuizSetCopyWith<$Res> implements $QuizSetCopyWith<$Res> {
  factory _$QuizSetCopyWith(_QuizSet value, $Res Function(_QuizSet) _then) =
      __$QuizSetCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime startedAt,
      ExamType? exam,
      List<String>? customTopics,
      DateTime? finishedAt});
}

/// @nodoc
class __$QuizSetCopyWithImpl<$Res> implements _$QuizSetCopyWith<$Res> {
  __$QuizSetCopyWithImpl(this._self, this._then);

  final _QuizSet _self;
  final $Res Function(_QuizSet) _then;

  /// Create a copy of QuizSet
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
    return _then(_QuizSet(
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
              as DateTime,
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
              as DateTime?,
    ));
  }
}

// dart format on
