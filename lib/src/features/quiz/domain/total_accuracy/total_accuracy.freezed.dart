// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'total_accuracy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TotalAccuracy {
  int get totalAnswers;
  int get correctAnswers;
  int get wrongAnswers;
  double get accuracyPercent;

  /// Create a copy of TotalAccuracy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TotalAccuracyCopyWith<TotalAccuracy> get copyWith =>
      _$TotalAccuracyCopyWithImpl<TotalAccuracy>(
          this as TotalAccuracy, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TotalAccuracy &&
            (identical(other.totalAnswers, totalAnswers) ||
                other.totalAnswers == totalAnswers) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.wrongAnswers, wrongAnswers) ||
                other.wrongAnswers == wrongAnswers) &&
            (identical(other.accuracyPercent, accuracyPercent) ||
                other.accuracyPercent == accuracyPercent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, totalAnswers, correctAnswers, wrongAnswers, accuracyPercent);

  @override
  String toString() {
    return 'TotalAccuracy(totalAnswers: $totalAnswers, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, accuracyPercent: $accuracyPercent)';
  }
}

/// @nodoc
abstract mixin class $TotalAccuracyCopyWith<$Res> {
  factory $TotalAccuracyCopyWith(
          TotalAccuracy value, $Res Function(TotalAccuracy) _then) =
      _$TotalAccuracyCopyWithImpl;
  @useResult
  $Res call(
      {int totalAnswers,
      int correctAnswers,
      int wrongAnswers,
      double accuracyPercent});
}

/// @nodoc
class _$TotalAccuracyCopyWithImpl<$Res>
    implements $TotalAccuracyCopyWith<$Res> {
  _$TotalAccuracyCopyWithImpl(this._self, this._then);

  final TotalAccuracy _self;
  final $Res Function(TotalAccuracy) _then;

  /// Create a copy of TotalAccuracy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAnswers = null,
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? accuracyPercent = null,
  }) {
    return _then(_self.copyWith(
      totalAnswers: null == totalAnswers
          ? _self.totalAnswers
          : totalAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _self.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      wrongAnswers: null == wrongAnswers
          ? _self.wrongAnswers
          : wrongAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      accuracyPercent: null == accuracyPercent
          ? _self.accuracyPercent
          : accuracyPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [TotalAccuracy].
extension TotalAccuracyPatterns on TotalAccuracy {
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
    TResult Function(_TotalAccuracy value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracy() when $default != null:
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
    TResult Function(_TotalAccuracy value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracy():
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
    TResult? Function(_TotalAccuracy value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracy() when $default != null:
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
    TResult Function(int totalAnswers, int correctAnswers, int wrongAnswers,
            double accuracyPercent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracy() when $default != null:
        return $default(_that.totalAnswers, _that.correctAnswers,
            _that.wrongAnswers, _that.accuracyPercent);
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
    TResult Function(int totalAnswers, int correctAnswers, int wrongAnswers,
            double accuracyPercent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracy():
        return $default(_that.totalAnswers, _that.correctAnswers,
            _that.wrongAnswers, _that.accuracyPercent);
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
    TResult? Function(int totalAnswers, int correctAnswers, int wrongAnswers,
            double accuracyPercent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracy() when $default != null:
        return $default(_that.totalAnswers, _that.correctAnswers,
            _that.wrongAnswers, _that.accuracyPercent);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TotalAccuracy implements TotalAccuracy {
  const _TotalAccuracy(
      {required this.totalAnswers,
      required this.correctAnswers,
      required this.wrongAnswers,
      required this.accuracyPercent});

  @override
  final int totalAnswers;
  @override
  final int correctAnswers;
  @override
  final int wrongAnswers;
  @override
  final double accuracyPercent;

  /// Create a copy of TotalAccuracy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TotalAccuracyCopyWith<_TotalAccuracy> get copyWith =>
      __$TotalAccuracyCopyWithImpl<_TotalAccuracy>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TotalAccuracy &&
            (identical(other.totalAnswers, totalAnswers) ||
                other.totalAnswers == totalAnswers) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.wrongAnswers, wrongAnswers) ||
                other.wrongAnswers == wrongAnswers) &&
            (identical(other.accuracyPercent, accuracyPercent) ||
                other.accuracyPercent == accuracyPercent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, totalAnswers, correctAnswers, wrongAnswers, accuracyPercent);

  @override
  String toString() {
    return 'TotalAccuracy(totalAnswers: $totalAnswers, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, accuracyPercent: $accuracyPercent)';
  }
}

/// @nodoc
abstract mixin class _$TotalAccuracyCopyWith<$Res>
    implements $TotalAccuracyCopyWith<$Res> {
  factory _$TotalAccuracyCopyWith(
          _TotalAccuracy value, $Res Function(_TotalAccuracy) _then) =
      __$TotalAccuracyCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalAnswers,
      int correctAnswers,
      int wrongAnswers,
      double accuracyPercent});
}

/// @nodoc
class __$TotalAccuracyCopyWithImpl<$Res>
    implements _$TotalAccuracyCopyWith<$Res> {
  __$TotalAccuracyCopyWithImpl(this._self, this._then);

  final _TotalAccuracy _self;
  final $Res Function(_TotalAccuracy) _then;

  /// Create a copy of TotalAccuracy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalAnswers = null,
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? accuracyPercent = null,
  }) {
    return _then(_TotalAccuracy(
      totalAnswers: null == totalAnswers
          ? _self.totalAnswers
          : totalAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      correctAnswers: null == correctAnswers
          ? _self.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      wrongAnswers: null == wrongAnswers
          ? _self.wrongAnswers
          : wrongAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      accuracyPercent: null == accuracyPercent
          ? _self.accuracyPercent
          : accuracyPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
