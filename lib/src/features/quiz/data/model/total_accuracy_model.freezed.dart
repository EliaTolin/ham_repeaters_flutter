// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'total_accuracy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TotalAccuracyModel {
  @JsonKey(name: 'total_answers')
  int get totalAnswers;
  @JsonKey(name: 'correct_answers')
  int get correctAnswers;
  @JsonKey(name: 'wrong_answers')
  int get wrongAnswers;
  @JsonKey(name: 'accuracy_percent')
  double get accuracyPercent;

  /// Create a copy of TotalAccuracyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TotalAccuracyModelCopyWith<TotalAccuracyModel> get copyWith =>
      _$TotalAccuracyModelCopyWithImpl<TotalAccuracyModel>(
          this as TotalAccuracyModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TotalAccuracyModel &&
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
    return 'TotalAccuracyModel(totalAnswers: $totalAnswers, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, accuracyPercent: $accuracyPercent)';
  }
}

/// @nodoc
abstract mixin class $TotalAccuracyModelCopyWith<$Res> {
  factory $TotalAccuracyModelCopyWith(
          TotalAccuracyModel value, $Res Function(TotalAccuracyModel) _then) =
      _$TotalAccuracyModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_answers') int totalAnswers,
      @JsonKey(name: 'correct_answers') int correctAnswers,
      @JsonKey(name: 'wrong_answers') int wrongAnswers,
      @JsonKey(name: 'accuracy_percent') double accuracyPercent});
}

/// @nodoc
class _$TotalAccuracyModelCopyWithImpl<$Res>
    implements $TotalAccuracyModelCopyWith<$Res> {
  _$TotalAccuracyModelCopyWithImpl(this._self, this._then);

  final TotalAccuracyModel _self;
  final $Res Function(TotalAccuracyModel) _then;

  /// Create a copy of TotalAccuracyModel
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

/// Adds pattern-matching-related methods to [TotalAccuracyModel].
extension TotalAccuracyModelPatterns on TotalAccuracyModel {
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
    TResult Function(_TotalAccuracyModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracyModel() when $default != null:
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
    TResult Function(_TotalAccuracyModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracyModel():
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
    TResult? Function(_TotalAccuracyModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracyModel() when $default != null:
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
            @JsonKey(name: 'total_answers') int totalAnswers,
            @JsonKey(name: 'correct_answers') int correctAnswers,
            @JsonKey(name: 'wrong_answers') int wrongAnswers,
            @JsonKey(name: 'accuracy_percent') double accuracyPercent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracyModel() when $default != null:
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
    TResult Function(
            @JsonKey(name: 'total_answers') int totalAnswers,
            @JsonKey(name: 'correct_answers') int correctAnswers,
            @JsonKey(name: 'wrong_answers') int wrongAnswers,
            @JsonKey(name: 'accuracy_percent') double accuracyPercent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracyModel():
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
    TResult? Function(
            @JsonKey(name: 'total_answers') int totalAnswers,
            @JsonKey(name: 'correct_answers') int correctAnswers,
            @JsonKey(name: 'wrong_answers') int wrongAnswers,
            @JsonKey(name: 'accuracy_percent') double accuracyPercent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TotalAccuracyModel() when $default != null:
        return $default(_that.totalAnswers, _that.correctAnswers,
            _that.wrongAnswers, _that.accuracyPercent);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TotalAccuracyModel implements TotalAccuracyModel {
  const _TotalAccuracyModel(
      {@JsonKey(name: 'total_answers') required this.totalAnswers,
      @JsonKey(name: 'correct_answers') required this.correctAnswers,
      @JsonKey(name: 'wrong_answers') required this.wrongAnswers,
      @JsonKey(name: 'accuracy_percent') required this.accuracyPercent});

  @override
  @JsonKey(name: 'total_answers')
  final int totalAnswers;
  @override
  @JsonKey(name: 'correct_answers')
  final int correctAnswers;
  @override
  @JsonKey(name: 'wrong_answers')
  final int wrongAnswers;
  @override
  @JsonKey(name: 'accuracy_percent')
  final double accuracyPercent;

  /// Create a copy of TotalAccuracyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TotalAccuracyModelCopyWith<_TotalAccuracyModel> get copyWith =>
      __$TotalAccuracyModelCopyWithImpl<_TotalAccuracyModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TotalAccuracyModel &&
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
    return 'TotalAccuracyModel(totalAnswers: $totalAnswers, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, accuracyPercent: $accuracyPercent)';
  }
}

/// @nodoc
abstract mixin class _$TotalAccuracyModelCopyWith<$Res>
    implements $TotalAccuracyModelCopyWith<$Res> {
  factory _$TotalAccuracyModelCopyWith(
          _TotalAccuracyModel value, $Res Function(_TotalAccuracyModel) _then) =
      __$TotalAccuracyModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_answers') int totalAnswers,
      @JsonKey(name: 'correct_answers') int correctAnswers,
      @JsonKey(name: 'wrong_answers') int wrongAnswers,
      @JsonKey(name: 'accuracy_percent') double accuracyPercent});
}

/// @nodoc
class __$TotalAccuracyModelCopyWithImpl<$Res>
    implements _$TotalAccuracyModelCopyWith<$Res> {
  __$TotalAccuracyModelCopyWithImpl(this._self, this._then);

  final _TotalAccuracyModel _self;
  final $Res Function(_TotalAccuracyModel) _then;

  /// Create a copy of TotalAccuracyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalAnswers = null,
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? accuracyPercent = null,
  }) {
    return _then(_TotalAccuracyModel(
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
