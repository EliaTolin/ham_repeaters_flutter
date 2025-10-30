// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curated_set_preview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CuratedSetPreviewModel {
  String get id;
  String get title;
  @JsonKey(name: 'questions_count')
  int get questionsCount;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  String? get description;

  /// Create a copy of CuratedSetPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CuratedSetPreviewModelCopyWith<CuratedSetPreviewModel> get copyWith =>
      _$CuratedSetPreviewModelCopyWithImpl<CuratedSetPreviewModel>(
          this as CuratedSetPreviewModel, _$identity);

  /// Serializes this CuratedSetPreviewModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CuratedSetPreviewModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.questionsCount, questionsCount) ||
                other.questionsCount == questionsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, questionsCount,
      createdAt, updatedAt, description);

  @override
  String toString() {
    return 'CuratedSetPreviewModel(id: $id, title: $title, questionsCount: $questionsCount, createdAt: $createdAt, updatedAt: $updatedAt, description: $description)';
  }
}

/// @nodoc
abstract mixin class $CuratedSetPreviewModelCopyWith<$Res> {
  factory $CuratedSetPreviewModelCopyWith(CuratedSetPreviewModel value,
          $Res Function(CuratedSetPreviewModel) _then) =
      _$CuratedSetPreviewModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: 'questions_count') int questionsCount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? description});
}

/// @nodoc
class _$CuratedSetPreviewModelCopyWithImpl<$Res>
    implements $CuratedSetPreviewModelCopyWith<$Res> {
  _$CuratedSetPreviewModelCopyWithImpl(this._self, this._then);

  final CuratedSetPreviewModel _self;
  final $Res Function(CuratedSetPreviewModel) _then;

  /// Create a copy of CuratedSetPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? questionsCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      questionsCount: null == questionsCount
          ? _self.questionsCount
          : questionsCount // ignore: cast_nullable_to_non_nullable
              as int,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [CuratedSetPreviewModel].
extension CuratedSetPreviewModelPatterns on CuratedSetPreviewModel {
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
    TResult Function(_CuratedSetPreviewModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CuratedSetPreviewModel() when $default != null:
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
    TResult Function(_CuratedSetPreviewModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetPreviewModel():
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
    TResult? Function(_CuratedSetPreviewModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetPreviewModel() when $default != null:
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
            String title,
            @JsonKey(name: 'questions_count') int questionsCount,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CuratedSetPreviewModel() when $default != null:
        return $default(_that.id, _that.title, _that.questionsCount,
            _that.createdAt, _that.updatedAt, _that.description);
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
            String title,
            @JsonKey(name: 'questions_count') int questionsCount,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetPreviewModel():
        return $default(_that.id, _that.title, _that.questionsCount,
            _that.createdAt, _that.updatedAt, _that.description);
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
            String title,
            @JsonKey(name: 'questions_count') int questionsCount,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetPreviewModel() when $default != null:
        return $default(_that.id, _that.title, _that.questionsCount,
            _that.createdAt, _that.updatedAt, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CuratedSetPreviewModel implements CuratedSetPreviewModel {
  const _CuratedSetPreviewModel(
      {required this.id,
      required this.title,
      @JsonKey(name: 'questions_count') required this.questionsCount,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.description});
  factory _CuratedSetPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$CuratedSetPreviewModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey(name: 'questions_count')
  final int questionsCount;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final String? description;

  /// Create a copy of CuratedSetPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CuratedSetPreviewModelCopyWith<_CuratedSetPreviewModel> get copyWith =>
      __$CuratedSetPreviewModelCopyWithImpl<_CuratedSetPreviewModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CuratedSetPreviewModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CuratedSetPreviewModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.questionsCount, questionsCount) ||
                other.questionsCount == questionsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, questionsCount,
      createdAt, updatedAt, description);

  @override
  String toString() {
    return 'CuratedSetPreviewModel(id: $id, title: $title, questionsCount: $questionsCount, createdAt: $createdAt, updatedAt: $updatedAt, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$CuratedSetPreviewModelCopyWith<$Res>
    implements $CuratedSetPreviewModelCopyWith<$Res> {
  factory _$CuratedSetPreviewModelCopyWith(_CuratedSetPreviewModel value,
          $Res Function(_CuratedSetPreviewModel) _then) =
      __$CuratedSetPreviewModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: 'questions_count') int questionsCount,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? description});
}

/// @nodoc
class __$CuratedSetPreviewModelCopyWithImpl<$Res>
    implements _$CuratedSetPreviewModelCopyWith<$Res> {
  __$CuratedSetPreviewModelCopyWithImpl(this._self, this._then);

  final _CuratedSetPreviewModel _self;
  final $Res Function(_CuratedSetPreviewModel) _then;

  /// Create a copy of CuratedSetPreviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? questionsCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? description = freezed,
  }) {
    return _then(_CuratedSetPreviewModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      questionsCount: null == questionsCount
          ? _self.questionsCount
          : questionsCount // ignore: cast_nullable_to_non_nullable
              as int,
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
    ));
  }
}

// dart format on
