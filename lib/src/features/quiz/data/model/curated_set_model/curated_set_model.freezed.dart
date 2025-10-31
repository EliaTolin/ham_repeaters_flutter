// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curated_set_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CuratedSetModel {
  String get id;
  @JsonKey(name: 'owner_id')
  String get ownerId;
  String get title;
  @JsonKey(name: 'is_published')
  bool get isPublished;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  String? get description;
  @JsonKey(name: 'custom_topics')
  List<String>? get customTopics;

  /// Create a copy of CuratedSetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CuratedSetModelCopyWith<CuratedSetModel> get copyWith =>
      _$CuratedSetModelCopyWithImpl<CuratedSetModel>(
          this as CuratedSetModel, _$identity);

  /// Serializes this CuratedSetModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CuratedSetModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'CuratedSetModel(id: $id, ownerId: $ownerId, title: $title, isPublished: $isPublished, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, customTopics: $customTopics)';
  }
}

/// @nodoc
abstract mixin class $CuratedSetModelCopyWith<$Res> {
  factory $CuratedSetModelCopyWith(
          CuratedSetModel value, $Res Function(CuratedSetModel) _then) =
      _$CuratedSetModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'owner_id') String ownerId,
      String title,
      @JsonKey(name: 'is_published') bool isPublished,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? description,
      @JsonKey(name: 'custom_topics') List<String>? customTopics});
}

/// @nodoc
class _$CuratedSetModelCopyWithImpl<$Res>
    implements $CuratedSetModelCopyWith<$Res> {
  _$CuratedSetModelCopyWithImpl(this._self, this._then);

  final CuratedSetModel _self;
  final $Res Function(CuratedSetModel) _then;

  /// Create a copy of CuratedSetModel
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

/// Adds pattern-matching-related methods to [CuratedSetModel].
extension CuratedSetModelPatterns on CuratedSetModel {
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
    TResult Function(_CuratedSetModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CuratedSetModel() when $default != null:
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
    TResult Function(_CuratedSetModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetModel():
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
    TResult? Function(_CuratedSetModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetModel() when $default != null:
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
            @JsonKey(name: 'owner_id') String ownerId,
            String title,
            @JsonKey(name: 'is_published') bool isPublished,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            String? description,
            @JsonKey(name: 'custom_topics') List<String>? customTopics)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CuratedSetModel() when $default != null:
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
            @JsonKey(name: 'owner_id') String ownerId,
            String title,
            @JsonKey(name: 'is_published') bool isPublished,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            String? description,
            @JsonKey(name: 'custom_topics') List<String>? customTopics)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetModel():
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
            @JsonKey(name: 'owner_id') String ownerId,
            String title,
            @JsonKey(name: 'is_published') bool isPublished,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            String? description,
            @JsonKey(name: 'custom_topics') List<String>? customTopics)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetModel() when $default != null:
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
@JsonSerializable()
class _CuratedSetModel implements CuratedSetModel {
  const _CuratedSetModel(
      {required this.id,
      @JsonKey(name: 'owner_id') required this.ownerId,
      required this.title,
      @JsonKey(name: 'is_published') required this.isPublished,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.description,
      @JsonKey(name: 'custom_topics') final List<String>? customTopics})
      : _customTopics = customTopics;
  factory _CuratedSetModel.fromJson(Map<String, dynamic> json) =>
      _$CuratedSetModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  final String title;
  @override
  @JsonKey(name: 'is_published')
  final bool isPublished;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final String? description;
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

  /// Create a copy of CuratedSetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CuratedSetModelCopyWith<_CuratedSetModel> get copyWith =>
      __$CuratedSetModelCopyWithImpl<_CuratedSetModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CuratedSetModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CuratedSetModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'CuratedSetModel(id: $id, ownerId: $ownerId, title: $title, isPublished: $isPublished, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, customTopics: $customTopics)';
  }
}

/// @nodoc
abstract mixin class _$CuratedSetModelCopyWith<$Res>
    implements $CuratedSetModelCopyWith<$Res> {
  factory _$CuratedSetModelCopyWith(
          _CuratedSetModel value, $Res Function(_CuratedSetModel) _then) =
      __$CuratedSetModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'owner_id') String ownerId,
      String title,
      @JsonKey(name: 'is_published') bool isPublished,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? description,
      @JsonKey(name: 'custom_topics') List<String>? customTopics});
}

/// @nodoc
class __$CuratedSetModelCopyWithImpl<$Res>
    implements _$CuratedSetModelCopyWith<$Res> {
  __$CuratedSetModelCopyWithImpl(this._self, this._then);

  final _CuratedSetModel _self;
  final $Res Function(_CuratedSetModel) _then;

  /// Create a copy of CuratedSetModel
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
    return _then(_CuratedSetModel(
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
