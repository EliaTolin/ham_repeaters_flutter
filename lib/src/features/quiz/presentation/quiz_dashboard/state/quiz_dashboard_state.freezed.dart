// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizDashboardState {
  String? get errorMessage;

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuizDashboardStateCopyWith<QuizDashboardState> get copyWith =>
      _$QuizDashboardStateCopyWithImpl<QuizDashboardState>(
          this as QuizDashboardState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuizDashboardState &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'QuizDashboardState(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $QuizDashboardStateCopyWith<$Res> {
  factory $QuizDashboardStateCopyWith(
          QuizDashboardState value, $Res Function(QuizDashboardState) _then) =
      _$QuizDashboardStateCopyWithImpl;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class _$QuizDashboardStateCopyWithImpl<$Res>
    implements $QuizDashboardStateCopyWith<$Res> {
  _$QuizDashboardStateCopyWithImpl(this._self, this._then);

  final QuizDashboardState _self;
  final $Res Function(QuizDashboardState) _then;

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuizDashboardState].
extension QuizDashboardStatePatterns on QuizDashboardState {
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
    TResult Function(_QuizDashboardState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState() when $default != null:
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
    TResult Function(_QuizDashboardState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState():
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
    TResult? Function(_QuizDashboardState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState() when $default != null:
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
    TResult Function(String? errorMessage)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState() when $default != null:
        return $default(_that.errorMessage);
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
    TResult Function(String? errorMessage) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState():
        return $default(_that.errorMessage);
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
    TResult? Function(String? errorMessage)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuizDashboardState() when $default != null:
        return $default(_that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _QuizDashboardState implements QuizDashboardState {
  const _QuizDashboardState({this.errorMessage});

  @override
  final String? errorMessage;

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuizDashboardStateCopyWith<_QuizDashboardState> get copyWith =>
      __$QuizDashboardStateCopyWithImpl<_QuizDashboardState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuizDashboardState &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'QuizDashboardState(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$QuizDashboardStateCopyWith<$Res>
    implements $QuizDashboardStateCopyWith<$Res> {
  factory _$QuizDashboardStateCopyWith(
          _QuizDashboardState value, $Res Function(_QuizDashboardState) _then) =
      __$QuizDashboardStateCopyWithImpl;
  @override
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$QuizDashboardStateCopyWithImpl<$Res>
    implements _$QuizDashboardStateCopyWith<$Res> {
  __$QuizDashboardStateCopyWithImpl(this._self, this._then);

  final _QuizDashboardState _self;
  final $Res Function(_QuizDashboardState) _then;

  /// Create a copy of QuizDashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_QuizDashboardState(
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
