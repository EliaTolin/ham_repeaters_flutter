// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_with_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopicWithStatsModel {
  String get name;
  String get label;
  int get totalQuestions;
  String? get description;

  /// Create a copy of TopicWithStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TopicWithStatsModelCopyWith<TopicWithStatsModel> get copyWith =>
      _$TopicWithStatsModelCopyWithImpl<TopicWithStatsModel>(
          this as TopicWithStatsModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TopicWithStatsModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, label, totalQuestions, description);

  @override
  String toString() {
    return 'TopicWithStatsModel(name: $name, label: $label, totalQuestions: $totalQuestions, description: $description)';
  }
}

/// @nodoc
abstract mixin class $TopicWithStatsModelCopyWith<$Res> {
  factory $TopicWithStatsModelCopyWith(
          TopicWithStatsModel value, $Res Function(TopicWithStatsModel) _then) =
      _$TopicWithStatsModelCopyWithImpl;
  @useResult
  $Res call(
      {String name, String label, int totalQuestions, String? description});
}

/// @nodoc
class _$TopicWithStatsModelCopyWithImpl<$Res>
    implements $TopicWithStatsModelCopyWith<$Res> {
  _$TopicWithStatsModelCopyWithImpl(this._self, this._then);

  final TopicWithStatsModel _self;
  final $Res Function(TopicWithStatsModel) _then;

  /// Create a copy of TopicWithStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? label = null,
    Object? totalQuestions = null,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuestions: null == totalQuestions
          ? _self.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TopicWithStatsModel].
extension TopicWithStatsModelPatterns on TopicWithStatsModel {
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
    TResult Function(_TopicWithStatsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopicWithStatsModel() when $default != null:
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
    TResult Function(_TopicWithStatsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicWithStatsModel():
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
    TResult? Function(_TopicWithStatsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicWithStatsModel() when $default != null:
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
            String name, String label, int totalQuestions, String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopicWithStatsModel() when $default != null:
        return $default(
            _that.name, _that.label, _that.totalQuestions, _that.description);
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
            String name, String label, int totalQuestions, String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicWithStatsModel():
        return $default(
            _that.name, _that.label, _that.totalQuestions, _that.description);
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
            String name, String label, int totalQuestions, String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicWithStatsModel() when $default != null:
        return $default(
            _that.name, _that.label, _that.totalQuestions, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TopicWithStatsModel implements TopicWithStatsModel {
  const _TopicWithStatsModel(
      {required this.name,
      required this.label,
      required this.totalQuestions,
      this.description});

  @override
  final String name;
  @override
  final String label;
  @override
  final int totalQuestions;
  @override
  final String? description;

  /// Create a copy of TopicWithStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TopicWithStatsModelCopyWith<_TopicWithStatsModel> get copyWith =>
      __$TopicWithStatsModelCopyWithImpl<_TopicWithStatsModel>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopicWithStatsModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, label, totalQuestions, description);

  @override
  String toString() {
    return 'TopicWithStatsModel(name: $name, label: $label, totalQuestions: $totalQuestions, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$TopicWithStatsModelCopyWith<$Res>
    implements $TopicWithStatsModelCopyWith<$Res> {
  factory _$TopicWithStatsModelCopyWith(_TopicWithStatsModel value,
          $Res Function(_TopicWithStatsModel) _then) =
      __$TopicWithStatsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name, String label, int totalQuestions, String? description});
}

/// @nodoc
class __$TopicWithStatsModelCopyWithImpl<$Res>
    implements _$TopicWithStatsModelCopyWith<$Res> {
  __$TopicWithStatsModelCopyWithImpl(this._self, this._then);

  final _TopicWithStatsModel _self;
  final $Res Function(_TopicWithStatsModel) _then;

  /// Create a copy of TopicWithStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? label = null,
    Object? totalQuestions = null,
    Object? description = freezed,
  }) {
    return _then(_TopicWithStatsModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuestions: null == totalQuestions
          ? _self.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
