// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopicRequest {
  String get topic;
  int get numQuestions;

  /// Create a copy of TopicRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TopicRequestCopyWith<TopicRequest> get copyWith =>
      _$TopicRequestCopyWithImpl<TopicRequest>(
          this as TopicRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TopicRequest &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.numQuestions, numQuestions) ||
                other.numQuestions == numQuestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topic, numQuestions);

  @override
  String toString() {
    return 'TopicRequest(topic: $topic, numQuestions: $numQuestions)';
  }
}

/// @nodoc
abstract mixin class $TopicRequestCopyWith<$Res> {
  factory $TopicRequestCopyWith(
          TopicRequest value, $Res Function(TopicRequest) _then) =
      _$TopicRequestCopyWithImpl;
  @useResult
  $Res call({String topic, int numQuestions});
}

/// @nodoc
class _$TopicRequestCopyWithImpl<$Res> implements $TopicRequestCopyWith<$Res> {
  _$TopicRequestCopyWithImpl(this._self, this._then);

  final TopicRequest _self;
  final $Res Function(TopicRequest) _then;

  /// Create a copy of TopicRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? numQuestions = null,
  }) {
    return _then(_self.copyWith(
      topic: null == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      numQuestions: null == numQuestions
          ? _self.numQuestions
          : numQuestions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [TopicRequest].
extension TopicRequestPatterns on TopicRequest {
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
    TResult Function(_TopicRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopicRequest() when $default != null:
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
    TResult Function(_TopicRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicRequest():
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
    TResult? Function(_TopicRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicRequest() when $default != null:
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
    TResult Function(String topic, int numQuestions)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopicRequest() when $default != null:
        return $default(_that.topic, _that.numQuestions);
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
    TResult Function(String topic, int numQuestions) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicRequest():
        return $default(_that.topic, _that.numQuestions);
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
    TResult? Function(String topic, int numQuestions)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicRequest() when $default != null:
        return $default(_that.topic, _that.numQuestions);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TopicRequest implements TopicRequest {
  const _TopicRequest({required this.topic, required this.numQuestions});

  @override
  final String topic;
  @override
  final int numQuestions;

  /// Create a copy of TopicRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TopicRequestCopyWith<_TopicRequest> get copyWith =>
      __$TopicRequestCopyWithImpl<_TopicRequest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopicRequest &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.numQuestions, numQuestions) ||
                other.numQuestions == numQuestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topic, numQuestions);

  @override
  String toString() {
    return 'TopicRequest(topic: $topic, numQuestions: $numQuestions)';
  }
}

/// @nodoc
abstract mixin class _$TopicRequestCopyWith<$Res>
    implements $TopicRequestCopyWith<$Res> {
  factory _$TopicRequestCopyWith(
          _TopicRequest value, $Res Function(_TopicRequest) _then) =
      __$TopicRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String topic, int numQuestions});
}

/// @nodoc
class __$TopicRequestCopyWithImpl<$Res>
    implements _$TopicRequestCopyWith<$Res> {
  __$TopicRequestCopyWithImpl(this._self, this._then);

  final _TopicRequest _self;
  final $Res Function(_TopicRequest) _then;

  /// Create a copy of TopicRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topic = null,
    Object? numQuestions = null,
  }) {
    return _then(_TopicRequest(
      topic: null == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      numQuestions: null == numQuestions
          ? _self.numQuestions
          : numQuestions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
