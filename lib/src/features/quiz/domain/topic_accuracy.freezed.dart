// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_accuracy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopicAccuracy {
  String get topicName;
  String get label;
  int get totalAnswers;
  int get correctAnswers;
  int get wrongAnswers;
  double get accuracyPercent;

  /// Create a copy of TopicAccuracy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TopicAccuracyCopyWith<TopicAccuracy> get copyWith =>
      _$TopicAccuracyCopyWithImpl<TopicAccuracy>(
          this as TopicAccuracy, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TopicAccuracy &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.label, label) || other.label == label) &&
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
  int get hashCode => Object.hash(runtimeType, topicName, label, totalAnswers,
      correctAnswers, wrongAnswers, accuracyPercent);

  @override
  String toString() {
    return 'TopicAccuracy(topicName: $topicName, label: $label, totalAnswers: $totalAnswers, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, accuracyPercent: $accuracyPercent)';
  }
}

/// @nodoc
abstract mixin class $TopicAccuracyCopyWith<$Res> {
  factory $TopicAccuracyCopyWith(
          TopicAccuracy value, $Res Function(TopicAccuracy) _then) =
      _$TopicAccuracyCopyWithImpl;
  @useResult
  $Res call(
      {String topicName,
      String label,
      int totalAnswers,
      int correctAnswers,
      int wrongAnswers,
      double accuracyPercent});
}

/// @nodoc
class _$TopicAccuracyCopyWithImpl<$Res>
    implements $TopicAccuracyCopyWith<$Res> {
  _$TopicAccuracyCopyWithImpl(this._self, this._then);

  final TopicAccuracy _self;
  final $Res Function(TopicAccuracy) _then;

  /// Create a copy of TopicAccuracy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topicName = null,
    Object? label = null,
    Object? totalAnswers = null,
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? accuracyPercent = null,
  }) {
    return _then(_self.copyWith(
      topicName: null == topicName
          ? _self.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
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

/// Adds pattern-matching-related methods to [TopicAccuracy].
extension TopicAccuracyPatterns on TopicAccuracy {
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
    TResult Function(_TopicAccuracy value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracy() when $default != null:
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
    TResult Function(_TopicAccuracy value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracy():
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
    TResult? Function(_TopicAccuracy value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracy() when $default != null:
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
    TResult Function(String topicName, String label, int totalAnswers,
            int correctAnswers, int wrongAnswers, double accuracyPercent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracy() when $default != null:
        return $default(_that.topicName, _that.label, _that.totalAnswers,
            _that.correctAnswers, _that.wrongAnswers, _that.accuracyPercent);
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
    TResult Function(String topicName, String label, int totalAnswers,
            int correctAnswers, int wrongAnswers, double accuracyPercent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracy():
        return $default(_that.topicName, _that.label, _that.totalAnswers,
            _that.correctAnswers, _that.wrongAnswers, _that.accuracyPercent);
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
    TResult? Function(String topicName, String label, int totalAnswers,
            int correctAnswers, int wrongAnswers, double accuracyPercent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracy() when $default != null:
        return $default(_that.topicName, _that.label, _that.totalAnswers,
            _that.correctAnswers, _that.wrongAnswers, _that.accuracyPercent);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TopicAccuracy implements TopicAccuracy {
  const _TopicAccuracy(
      {required this.topicName,
      required this.label,
      required this.totalAnswers,
      required this.correctAnswers,
      required this.wrongAnswers,
      required this.accuracyPercent});

  @override
  final String topicName;
  @override
  final String label;
  @override
  final int totalAnswers;
  @override
  final int correctAnswers;
  @override
  final int wrongAnswers;
  @override
  final double accuracyPercent;

  /// Create a copy of TopicAccuracy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TopicAccuracyCopyWith<_TopicAccuracy> get copyWith =>
      __$TopicAccuracyCopyWithImpl<_TopicAccuracy>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopicAccuracy &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.label, label) || other.label == label) &&
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
  int get hashCode => Object.hash(runtimeType, topicName, label, totalAnswers,
      correctAnswers, wrongAnswers, accuracyPercent);

  @override
  String toString() {
    return 'TopicAccuracy(topicName: $topicName, label: $label, totalAnswers: $totalAnswers, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, accuracyPercent: $accuracyPercent)';
  }
}

/// @nodoc
abstract mixin class _$TopicAccuracyCopyWith<$Res>
    implements $TopicAccuracyCopyWith<$Res> {
  factory _$TopicAccuracyCopyWith(
          _TopicAccuracy value, $Res Function(_TopicAccuracy) _then) =
      __$TopicAccuracyCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String topicName,
      String label,
      int totalAnswers,
      int correctAnswers,
      int wrongAnswers,
      double accuracyPercent});
}

/// @nodoc
class __$TopicAccuracyCopyWithImpl<$Res>
    implements _$TopicAccuracyCopyWith<$Res> {
  __$TopicAccuracyCopyWithImpl(this._self, this._then);

  final _TopicAccuracy _self;
  final $Res Function(_TopicAccuracy) _then;

  /// Create a copy of TopicAccuracy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? topicName = null,
    Object? label = null,
    Object? totalAnswers = null,
    Object? correctAnswers = null,
    Object? wrongAnswers = null,
    Object? accuracyPercent = null,
  }) {
    return _then(_TopicAccuracy(
      topicName: null == topicName
          ? _self.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
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
