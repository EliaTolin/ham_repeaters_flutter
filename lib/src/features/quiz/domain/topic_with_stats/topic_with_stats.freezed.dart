// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_with_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopicWithStats {
  String get name;
  String get label;
  int get totalQuestions;
  String? get description;

  /// Create a copy of TopicWithStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TopicWithStatsCopyWith<TopicWithStats> get copyWith =>
      _$TopicWithStatsCopyWithImpl<TopicWithStats>(
          this as TopicWithStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TopicWithStats &&
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
    return 'TopicWithStats(name: $name, label: $label, totalQuestions: $totalQuestions, description: $description)';
  }
}

/// @nodoc
abstract mixin class $TopicWithStatsCopyWith<$Res> {
  factory $TopicWithStatsCopyWith(
          TopicWithStats value, $Res Function(TopicWithStats) _then) =
      _$TopicWithStatsCopyWithImpl;
  @useResult
  $Res call(
      {String name, String label, int totalQuestions, String? description});
}

/// @nodoc
class _$TopicWithStatsCopyWithImpl<$Res>
    implements $TopicWithStatsCopyWith<$Res> {
  _$TopicWithStatsCopyWithImpl(this._self, this._then);

  final TopicWithStats _self;
  final $Res Function(TopicWithStats) _then;

  /// Create a copy of TopicWithStats
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

/// Adds pattern-matching-related methods to [TopicWithStats].
extension TopicWithStatsPatterns on TopicWithStats {
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
    TResult Function(_TopicWithStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopicWithStats() when $default != null:
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
    TResult Function(_TopicWithStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicWithStats():
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
    TResult? Function(_TopicWithStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicWithStats() when $default != null:
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
      case _TopicWithStats() when $default != null:
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
      case _TopicWithStats():
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
      case _TopicWithStats() when $default != null:
        return $default(
            _that.name, _that.label, _that.totalQuestions, _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TopicWithStats implements TopicWithStats {
  const _TopicWithStats(
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

  /// Create a copy of TopicWithStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TopicWithStatsCopyWith<_TopicWithStats> get copyWith =>
      __$TopicWithStatsCopyWithImpl<_TopicWithStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopicWithStats &&
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
    return 'TopicWithStats(name: $name, label: $label, totalQuestions: $totalQuestions, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$TopicWithStatsCopyWith<$Res>
    implements $TopicWithStatsCopyWith<$Res> {
  factory _$TopicWithStatsCopyWith(
          _TopicWithStats value, $Res Function(_TopicWithStats) _then) =
      __$TopicWithStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name, String label, int totalQuestions, String? description});
}

/// @nodoc
class __$TopicWithStatsCopyWithImpl<$Res>
    implements _$TopicWithStatsCopyWith<$Res> {
  __$TopicWithStatsCopyWithImpl(this._self, this._then);

  final _TopicWithStats _self;
  final $Res Function(_TopicWithStats) _then;

  /// Create a copy of TopicWithStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? label = null,
    Object? totalQuestions = null,
    Object? description = freezed,
  }) {
    return _then(_TopicWithStats(
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
