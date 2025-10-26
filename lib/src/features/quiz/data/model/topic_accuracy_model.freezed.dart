// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_accuracy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopicAccuracyModel {
  String get topicName;
  String get label;
  @JsonKey(name: 'total_answers')
  int get totalAnswers;
  @JsonKey(name: 'correct_answers')
  int get correctAnswers;
  @JsonKey(name: 'wrong_answers')
  int get wrongAnswers;
  @JsonKey(name: 'accuracy_percent')
  double get accuracyPercent;

  /// Create a copy of TopicAccuracyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TopicAccuracyModelCopyWith<TopicAccuracyModel> get copyWith =>
      _$TopicAccuracyModelCopyWithImpl<TopicAccuracyModel>(
          this as TopicAccuracyModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TopicAccuracyModel &&
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
    return 'TopicAccuracyModel(topicName: $topicName, label: $label, totalAnswers: $totalAnswers, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, accuracyPercent: $accuracyPercent)';
  }
}

/// @nodoc
abstract mixin class $TopicAccuracyModelCopyWith<$Res> {
  factory $TopicAccuracyModelCopyWith(
          TopicAccuracyModel value, $Res Function(TopicAccuracyModel) _then) =
      _$TopicAccuracyModelCopyWithImpl;
  @useResult
  $Res call(
      {String topicName,
      String label,
      @JsonKey(name: 'total_answers') int totalAnswers,
      @JsonKey(name: 'correct_answers') int correctAnswers,
      @JsonKey(name: 'wrong_answers') int wrongAnswers,
      @JsonKey(name: 'accuracy_percent') double accuracyPercent});
}

/// @nodoc
class _$TopicAccuracyModelCopyWithImpl<$Res>
    implements $TopicAccuracyModelCopyWith<$Res> {
  _$TopicAccuracyModelCopyWithImpl(this._self, this._then);

  final TopicAccuracyModel _self;
  final $Res Function(TopicAccuracyModel) _then;

  /// Create a copy of TopicAccuracyModel
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

/// Adds pattern-matching-related methods to [TopicAccuracyModel].
extension TopicAccuracyModelPatterns on TopicAccuracyModel {
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
    TResult Function(_TopicAccuracyModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracyModel() when $default != null:
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
    TResult Function(_TopicAccuracyModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracyModel():
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
    TResult? Function(_TopicAccuracyModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracyModel() when $default != null:
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
            String topicName,
            String label,
            @JsonKey(name: 'total_answers') int totalAnswers,
            @JsonKey(name: 'correct_answers') int correctAnswers,
            @JsonKey(name: 'wrong_answers') int wrongAnswers,
            @JsonKey(name: 'accuracy_percent') double accuracyPercent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracyModel() when $default != null:
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
    TResult Function(
            String topicName,
            String label,
            @JsonKey(name: 'total_answers') int totalAnswers,
            @JsonKey(name: 'correct_answers') int correctAnswers,
            @JsonKey(name: 'wrong_answers') int wrongAnswers,
            @JsonKey(name: 'accuracy_percent') double accuracyPercent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracyModel():
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
    TResult? Function(
            String topicName,
            String label,
            @JsonKey(name: 'total_answers') int totalAnswers,
            @JsonKey(name: 'correct_answers') int correctAnswers,
            @JsonKey(name: 'wrong_answers') int wrongAnswers,
            @JsonKey(name: 'accuracy_percent') double accuracyPercent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TopicAccuracyModel() when $default != null:
        return $default(_that.topicName, _that.label, _that.totalAnswers,
            _that.correctAnswers, _that.wrongAnswers, _that.accuracyPercent);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TopicAccuracyModel implements TopicAccuracyModel {
  const _TopicAccuracyModel(
      {required this.topicName,
      required this.label,
      @JsonKey(name: 'total_answers') required this.totalAnswers,
      @JsonKey(name: 'correct_answers') required this.correctAnswers,
      @JsonKey(name: 'wrong_answers') required this.wrongAnswers,
      @JsonKey(name: 'accuracy_percent') required this.accuracyPercent});

  @override
  final String topicName;
  @override
  final String label;
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

  /// Create a copy of TopicAccuracyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TopicAccuracyModelCopyWith<_TopicAccuracyModel> get copyWith =>
      __$TopicAccuracyModelCopyWithImpl<_TopicAccuracyModel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TopicAccuracyModel &&
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
    return 'TopicAccuracyModel(topicName: $topicName, label: $label, totalAnswers: $totalAnswers, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, accuracyPercent: $accuracyPercent)';
  }
}

/// @nodoc
abstract mixin class _$TopicAccuracyModelCopyWith<$Res>
    implements $TopicAccuracyModelCopyWith<$Res> {
  factory _$TopicAccuracyModelCopyWith(
          _TopicAccuracyModel value, $Res Function(_TopicAccuracyModel) _then) =
      __$TopicAccuracyModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String topicName,
      String label,
      @JsonKey(name: 'total_answers') int totalAnswers,
      @JsonKey(name: 'correct_answers') int correctAnswers,
      @JsonKey(name: 'wrong_answers') int wrongAnswers,
      @JsonKey(name: 'accuracy_percent') double accuracyPercent});
}

/// @nodoc
class __$TopicAccuracyModelCopyWithImpl<$Res>
    implements _$TopicAccuracyModelCopyWith<$Res> {
  __$TopicAccuracyModelCopyWithImpl(this._self, this._then);

  final _TopicAccuracyModel _self;
  final $Res Function(_TopicAccuracyModel) _then;

  /// Create a copy of TopicAccuracyModel
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
    return _then(_TopicAccuracyModel(
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
