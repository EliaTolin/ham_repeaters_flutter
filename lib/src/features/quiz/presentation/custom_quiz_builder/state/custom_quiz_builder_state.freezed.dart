// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_quiz_builder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomQuizBuilderState {
  List<TopicWithStats> get availableTopics;
  Map<String, int> get selectedTopics; // topic name -> num questions
  String? get errorMessage;

  /// Create a copy of CustomQuizBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomQuizBuilderStateCopyWith<CustomQuizBuilderState> get copyWith =>
      _$CustomQuizBuilderStateCopyWithImpl<CustomQuizBuilderState>(
          this as CustomQuizBuilderState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomQuizBuilderState &&
            const DeepCollectionEquality()
                .equals(other.availableTopics, availableTopics) &&
            const DeepCollectionEquality()
                .equals(other.selectedTopics, selectedTopics) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(availableTopics),
      const DeepCollectionEquality().hash(selectedTopics),
      errorMessage);

  @override
  String toString() {
    return 'CustomQuizBuilderState(availableTopics: $availableTopics, selectedTopics: $selectedTopics, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $CustomQuizBuilderStateCopyWith<$Res> {
  factory $CustomQuizBuilderStateCopyWith(CustomQuizBuilderState value,
          $Res Function(CustomQuizBuilderState) _then) =
      _$CustomQuizBuilderStateCopyWithImpl;
  @useResult
  $Res call(
      {List<TopicWithStats> availableTopics,
      Map<String, int> selectedTopics,
      String? errorMessage});
}

/// @nodoc
class _$CustomQuizBuilderStateCopyWithImpl<$Res>
    implements $CustomQuizBuilderStateCopyWith<$Res> {
  _$CustomQuizBuilderStateCopyWithImpl(this._self, this._then);

  final CustomQuizBuilderState _self;
  final $Res Function(CustomQuizBuilderState) _then;

  /// Create a copy of CustomQuizBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableTopics = null,
    Object? selectedTopics = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      availableTopics: null == availableTopics
          ? _self.availableTopics
          : availableTopics // ignore: cast_nullable_to_non_nullable
              as List<TopicWithStats>,
      selectedTopics: null == selectedTopics
          ? _self.selectedTopics
          : selectedTopics // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomQuizBuilderState].
extension CustomQuizBuilderStatePatterns on CustomQuizBuilderState {
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
    TResult Function(_CustomQuizBuilderState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomQuizBuilderState() when $default != null:
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
    TResult Function(_CustomQuizBuilderState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomQuizBuilderState():
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
    TResult? Function(_CustomQuizBuilderState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomQuizBuilderState() when $default != null:
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
    TResult Function(List<TopicWithStats> availableTopics,
            Map<String, int> selectedTopics, String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomQuizBuilderState() when $default != null:
        return $default(
            _that.availableTopics, _that.selectedTopics, _that.errorMessage);
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
    TResult Function(List<TopicWithStats> availableTopics,
            Map<String, int> selectedTopics, String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomQuizBuilderState():
        return $default(
            _that.availableTopics, _that.selectedTopics, _that.errorMessage);
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
    TResult? Function(List<TopicWithStats> availableTopics,
            Map<String, int> selectedTopics, String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomQuizBuilderState() when $default != null:
        return $default(
            _that.availableTopics, _that.selectedTopics, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CustomQuizBuilderState extends CustomQuizBuilderState {
  const _CustomQuizBuilderState(
      {required final List<TopicWithStats> availableTopics,
      final Map<String, int> selectedTopics = const {},
      this.errorMessage})
      : _availableTopics = availableTopics,
        _selectedTopics = selectedTopics,
        super._();

  final List<TopicWithStats> _availableTopics;
  @override
  List<TopicWithStats> get availableTopics {
    if (_availableTopics is EqualUnmodifiableListView) return _availableTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableTopics);
  }

  final Map<String, int> _selectedTopics;
  @override
  @JsonKey()
  Map<String, int> get selectedTopics {
    if (_selectedTopics is EqualUnmodifiableMapView) return _selectedTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedTopics);
  }

// topic name -> num questions
  @override
  final String? errorMessage;

  /// Create a copy of CustomQuizBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomQuizBuilderStateCopyWith<_CustomQuizBuilderState> get copyWith =>
      __$CustomQuizBuilderStateCopyWithImpl<_CustomQuizBuilderState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomQuizBuilderState &&
            const DeepCollectionEquality()
                .equals(other._availableTopics, _availableTopics) &&
            const DeepCollectionEquality()
                .equals(other._selectedTopics, _selectedTopics) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_availableTopics),
      const DeepCollectionEquality().hash(_selectedTopics),
      errorMessage);

  @override
  String toString() {
    return 'CustomQuizBuilderState(availableTopics: $availableTopics, selectedTopics: $selectedTopics, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$CustomQuizBuilderStateCopyWith<$Res>
    implements $CustomQuizBuilderStateCopyWith<$Res> {
  factory _$CustomQuizBuilderStateCopyWith(_CustomQuizBuilderState value,
          $Res Function(_CustomQuizBuilderState) _then) =
      __$CustomQuizBuilderStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<TopicWithStats> availableTopics,
      Map<String, int> selectedTopics,
      String? errorMessage});
}

/// @nodoc
class __$CustomQuizBuilderStateCopyWithImpl<$Res>
    implements _$CustomQuizBuilderStateCopyWith<$Res> {
  __$CustomQuizBuilderStateCopyWithImpl(this._self, this._then);

  final _CustomQuizBuilderState _self;
  final $Res Function(_CustomQuizBuilderState) _then;

  /// Create a copy of CustomQuizBuilderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? availableTopics = null,
    Object? selectedTopics = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_CustomQuizBuilderState(
      availableTopics: null == availableTopics
          ? _self._availableTopics
          : availableTopics // ignore: cast_nullable_to_non_nullable
              as List<TopicWithStats>,
      selectedTopics: null == selectedTopics
          ? _self._selectedTopics
          : selectedTopics // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
