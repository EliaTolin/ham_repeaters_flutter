// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marathon_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarathonState {
  List<TopicWithStats> get availableTopics;
  String? get selectedTopic;
  bool get isStarting;
  String? get errorMessage;

  /// Create a copy of MarathonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MarathonStateCopyWith<MarathonState> get copyWith =>
      _$MarathonStateCopyWithImpl<MarathonState>(
          this as MarathonState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarathonState &&
            const DeepCollectionEquality()
                .equals(other.availableTopics, availableTopics) &&
            (identical(other.selectedTopic, selectedTopic) ||
                other.selectedTopic == selectedTopic) &&
            (identical(other.isStarting, isStarting) ||
                other.isStarting == isStarting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(availableTopics),
      selectedTopic,
      isStarting,
      errorMessage);

  @override
  String toString() {
    return 'MarathonState(availableTopics: $availableTopics, selectedTopic: $selectedTopic, isStarting: $isStarting, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $MarathonStateCopyWith<$Res> {
  factory $MarathonStateCopyWith(
          MarathonState value, $Res Function(MarathonState) _then) =
      _$MarathonStateCopyWithImpl;
  @useResult
  $Res call(
      {List<TopicWithStats> availableTopics,
      String? selectedTopic,
      bool isStarting,
      String? errorMessage});
}

/// @nodoc
class _$MarathonStateCopyWithImpl<$Res>
    implements $MarathonStateCopyWith<$Res> {
  _$MarathonStateCopyWithImpl(this._self, this._then);

  final MarathonState _self;
  final $Res Function(MarathonState) _then;

  /// Create a copy of MarathonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableTopics = null,
    Object? selectedTopic = freezed,
    Object? isStarting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      availableTopics: null == availableTopics
          ? _self.availableTopics
          : availableTopics // ignore: cast_nullable_to_non_nullable
              as List<TopicWithStats>,
      selectedTopic: freezed == selectedTopic
          ? _self.selectedTopic
          : selectedTopic // ignore: cast_nullable_to_non_nullable
              as String?,
      isStarting: null == isStarting
          ? _self.isStarting
          : isStarting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MarathonState].
extension MarathonStatePatterns on MarathonState {
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
    TResult Function(_MarathonState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MarathonState() when $default != null:
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
    TResult Function(_MarathonState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarathonState():
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
    TResult? Function(_MarathonState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarathonState() when $default != null:
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
            String? selectedTopic, bool isStarting, String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MarathonState() when $default != null:
        return $default(_that.availableTopics, _that.selectedTopic,
            _that.isStarting, _that.errorMessage);
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
            String? selectedTopic, bool isStarting, String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarathonState():
        return $default(_that.availableTopics, _that.selectedTopic,
            _that.isStarting, _that.errorMessage);
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
            String? selectedTopic, bool isStarting, String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarathonState() when $default != null:
        return $default(_that.availableTopics, _that.selectedTopic,
            _that.isStarting, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MarathonState extends MarathonState {
  const _MarathonState(
      {required final List<TopicWithStats> availableTopics,
      this.selectedTopic,
      this.isStarting = false,
      this.errorMessage})
      : _availableTopics = availableTopics,
        super._();

  final List<TopicWithStats> _availableTopics;
  @override
  List<TopicWithStats> get availableTopics {
    if (_availableTopics is EqualUnmodifiableListView) return _availableTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableTopics);
  }

  @override
  final String? selectedTopic;
  @override
  @JsonKey()
  final bool isStarting;
  @override
  final String? errorMessage;

  /// Create a copy of MarathonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MarathonStateCopyWith<_MarathonState> get copyWith =>
      __$MarathonStateCopyWithImpl<_MarathonState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MarathonState &&
            const DeepCollectionEquality()
                .equals(other._availableTopics, _availableTopics) &&
            (identical(other.selectedTopic, selectedTopic) ||
                other.selectedTopic == selectedTopic) &&
            (identical(other.isStarting, isStarting) ||
                other.isStarting == isStarting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_availableTopics),
      selectedTopic,
      isStarting,
      errorMessage);

  @override
  String toString() {
    return 'MarathonState(availableTopics: $availableTopics, selectedTopic: $selectedTopic, isStarting: $isStarting, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$MarathonStateCopyWith<$Res>
    implements $MarathonStateCopyWith<$Res> {
  factory _$MarathonStateCopyWith(
          _MarathonState value, $Res Function(_MarathonState) _then) =
      __$MarathonStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<TopicWithStats> availableTopics,
      String? selectedTopic,
      bool isStarting,
      String? errorMessage});
}

/// @nodoc
class __$MarathonStateCopyWithImpl<$Res>
    implements _$MarathonStateCopyWith<$Res> {
  __$MarathonStateCopyWithImpl(this._self, this._then);

  final _MarathonState _self;
  final $Res Function(_MarathonState) _then;

  /// Create a copy of MarathonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? availableTopics = null,
    Object? selectedTopic = freezed,
    Object? isStarting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_MarathonState(
      availableTopics: null == availableTopics
          ? _self._availableTopics
          : availableTopics // ignore: cast_nullable_to_non_nullable
              as List<TopicWithStats>,
      selectedTopic: freezed == selectedTopic
          ? _self.selectedTopic
          : selectedTopic // ignore: cast_nullable_to_non_nullable
              as String?,
      isStarting: null == isStarting
          ? _self.isStarting
          : isStarting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
