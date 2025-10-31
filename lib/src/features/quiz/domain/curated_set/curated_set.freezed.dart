// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curated_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CuratedSet {
  String get id;
  String get ownerId;
  String get title;
  bool get isPublished;
  DateTime get createdAt;
  DateTime get updatedAt;
  String? get description;
  List<String>? get customTopics;

  /// Create a copy of CuratedSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CuratedSetCopyWith<CuratedSet> get copyWith =>
      _$CuratedSetCopyWithImpl<CuratedSet>(this as CuratedSet, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CuratedSet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.customTopics, customTopics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      title,
      isPublished,
      createdAt,
      updatedAt,
      description,
      const DeepCollectionEquality().hash(customTopics));

  @override
  String toString() {
    return 'CuratedSet(id: $id, ownerId: $ownerId, title: $title, isPublished: $isPublished, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, customTopics: $customTopics)';
  }
}

/// @nodoc
abstract mixin class $CuratedSetCopyWith<$Res> {
  factory $CuratedSetCopyWith(
          CuratedSet value, $Res Function(CuratedSet) _then) =
      _$CuratedSetCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String title,
      bool isPublished,
      DateTime createdAt,
      DateTime updatedAt,
      String? description,
      List<String>? customTopics});
}

/// @nodoc
class _$CuratedSetCopyWithImpl<$Res> implements $CuratedSetCopyWith<$Res> {
  _$CuratedSetCopyWithImpl(this._self, this._then);

  final CuratedSet _self;
  final $Res Function(CuratedSet) _then;

  /// Create a copy of CuratedSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? title = null,
    Object? isPublished = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? description = freezed,
    Object? customTopics = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isPublished: null == isPublished
          ? _self.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      customTopics: freezed == customTopics
          ? _self.customTopics
          : customTopics // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CuratedSet].
extension CuratedSetPatterns on CuratedSet {
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
    TResult Function(_CuratedSet value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CuratedSet() when $default != null:
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
    TResult Function(_CuratedSet value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSet():
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
    TResult? Function(_CuratedSet value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSet() when $default != null:
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
            String ownerId,
            String title,
            bool isPublished,
            DateTime createdAt,
            DateTime updatedAt,
            String? description,
            List<String>? customTopics)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CuratedSet() when $default != null:
        return $default(
            _that.id,
            _that.ownerId,
            _that.title,
            _that.isPublished,
            _that.createdAt,
            _that.updatedAt,
            _that.description,
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
            String id,
            String ownerId,
            String title,
            bool isPublished,
            DateTime createdAt,
            DateTime updatedAt,
            String? description,
            List<String>? customTopics)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSet():
        return $default(
            _that.id,
            _that.ownerId,
            _that.title,
            _that.isPublished,
            _that.createdAt,
            _that.updatedAt,
            _that.description,
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
            String id,
            String ownerId,
            String title,
            bool isPublished,
            DateTime createdAt,
            DateTime updatedAt,
            String? description,
            List<String>? customTopics)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSet() when $default != null:
        return $default(
            _that.id,
            _that.ownerId,
            _that.title,
            _that.isPublished,
            _that.createdAt,
            _that.updatedAt,
            _that.description,
            _that.customTopics);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CuratedSet implements CuratedSet {
  const _CuratedSet(
      {required this.id,
      required this.ownerId,
      required this.title,
      required this.isPublished,
      required this.createdAt,
      required this.updatedAt,
      this.description,
      final List<String>? customTopics})
      : _customTopics = customTopics;

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final String title;
  @override
  final bool isPublished;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? description;
  final List<String>? _customTopics;
  @override
  List<String>? get customTopics {
    final value = _customTopics;
    if (value == null) return null;
    if (_customTopics is EqualUnmodifiableListView) return _customTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CuratedSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CuratedSetCopyWith<_CuratedSet> get copyWith =>
      __$CuratedSetCopyWithImpl<_CuratedSet>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CuratedSet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._customTopics, _customTopics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      title,
      isPublished,
      createdAt,
      updatedAt,
      description,
      const DeepCollectionEquality().hash(_customTopics));

  @override
  String toString() {
    return 'CuratedSet(id: $id, ownerId: $ownerId, title: $title, isPublished: $isPublished, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, customTopics: $customTopics)';
  }
}

/// @nodoc
abstract mixin class _$CuratedSetCopyWith<$Res>
    implements $CuratedSetCopyWith<$Res> {
  factory _$CuratedSetCopyWith(
          _CuratedSet value, $Res Function(_CuratedSet) _then) =
      __$CuratedSetCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String ownerId,
      String title,
      bool isPublished,
      DateTime createdAt,
      DateTime updatedAt,
      String? description,
      List<String>? customTopics});
}

/// @nodoc
class __$CuratedSetCopyWithImpl<$Res> implements _$CuratedSetCopyWith<$Res> {
  __$CuratedSetCopyWithImpl(this._self, this._then);

  final _CuratedSet _self;
  final $Res Function(_CuratedSet) _then;

  /// Create a copy of CuratedSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? title = null,
    Object? isPublished = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? description = freezed,
    Object? customTopics = freezed,
  }) {
    return _then(_CuratedSet(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isPublished: null == isPublished
          ? _self.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      customTopics: freezed == customTopics
          ? _self._customTopics
          : customTopics // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
