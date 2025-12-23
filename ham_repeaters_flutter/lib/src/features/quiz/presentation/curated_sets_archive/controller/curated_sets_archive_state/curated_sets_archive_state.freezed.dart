// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curated_sets_archive_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CuratedSetArchiveItem {
  CuratedSet get curatedSet;
  bool get isCompleted;

  /// Create a copy of CuratedSetArchiveItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CuratedSetArchiveItemCopyWith<CuratedSetArchiveItem> get copyWith =>
      _$CuratedSetArchiveItemCopyWithImpl<CuratedSetArchiveItem>(
          this as CuratedSetArchiveItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CuratedSetArchiveItem &&
            (identical(other.curatedSet, curatedSet) ||
                other.curatedSet == curatedSet) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, curatedSet, isCompleted);

  @override
  String toString() {
    return 'CuratedSetArchiveItem(curatedSet: $curatedSet, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class $CuratedSetArchiveItemCopyWith<$Res> {
  factory $CuratedSetArchiveItemCopyWith(CuratedSetArchiveItem value,
          $Res Function(CuratedSetArchiveItem) _then) =
      _$CuratedSetArchiveItemCopyWithImpl;
  @useResult
  $Res call({CuratedSet curatedSet, bool isCompleted});

  $CuratedSetCopyWith<$Res> get curatedSet;
}

/// @nodoc
class _$CuratedSetArchiveItemCopyWithImpl<$Res>
    implements $CuratedSetArchiveItemCopyWith<$Res> {
  _$CuratedSetArchiveItemCopyWithImpl(this._self, this._then);

  final CuratedSetArchiveItem _self;
  final $Res Function(CuratedSetArchiveItem) _then;

  /// Create a copy of CuratedSetArchiveItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curatedSet = null,
    Object? isCompleted = null,
  }) {
    return _then(_self.copyWith(
      curatedSet: null == curatedSet
          ? _self.curatedSet
          : curatedSet // ignore: cast_nullable_to_non_nullable
              as CuratedSet,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of CuratedSetArchiveItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CuratedSetCopyWith<$Res> get curatedSet {
    return $CuratedSetCopyWith<$Res>(_self.curatedSet, (value) {
      return _then(_self.copyWith(curatedSet: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CuratedSetArchiveItem].
extension CuratedSetArchiveItemPatterns on CuratedSetArchiveItem {
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
    TResult Function(_CuratedSetArchiveItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CuratedSetArchiveItem() when $default != null:
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
    TResult Function(_CuratedSetArchiveItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetArchiveItem():
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
    TResult? Function(_CuratedSetArchiveItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetArchiveItem() when $default != null:
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
    TResult Function(CuratedSet curatedSet, bool isCompleted)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CuratedSetArchiveItem() when $default != null:
        return $default(_that.curatedSet, _that.isCompleted);
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
    TResult Function(CuratedSet curatedSet, bool isCompleted) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetArchiveItem():
        return $default(_that.curatedSet, _that.isCompleted);
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
    TResult? Function(CuratedSet curatedSet, bool isCompleted)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetArchiveItem() when $default != null:
        return $default(_that.curatedSet, _that.isCompleted);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CuratedSetArchiveItem implements CuratedSetArchiveItem {
  const _CuratedSetArchiveItem(
      {required this.curatedSet, required this.isCompleted});

  @override
  final CuratedSet curatedSet;
  @override
  final bool isCompleted;

  /// Create a copy of CuratedSetArchiveItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CuratedSetArchiveItemCopyWith<_CuratedSetArchiveItem> get copyWith =>
      __$CuratedSetArchiveItemCopyWithImpl<_CuratedSetArchiveItem>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CuratedSetArchiveItem &&
            (identical(other.curatedSet, curatedSet) ||
                other.curatedSet == curatedSet) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, curatedSet, isCompleted);

  @override
  String toString() {
    return 'CuratedSetArchiveItem(curatedSet: $curatedSet, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class _$CuratedSetArchiveItemCopyWith<$Res>
    implements $CuratedSetArchiveItemCopyWith<$Res> {
  factory _$CuratedSetArchiveItemCopyWith(_CuratedSetArchiveItem value,
          $Res Function(_CuratedSetArchiveItem) _then) =
      __$CuratedSetArchiveItemCopyWithImpl;
  @override
  @useResult
  $Res call({CuratedSet curatedSet, bool isCompleted});

  @override
  $CuratedSetCopyWith<$Res> get curatedSet;
}

/// @nodoc
class __$CuratedSetArchiveItemCopyWithImpl<$Res>
    implements _$CuratedSetArchiveItemCopyWith<$Res> {
  __$CuratedSetArchiveItemCopyWithImpl(this._self, this._then);

  final _CuratedSetArchiveItem _self;
  final $Res Function(_CuratedSetArchiveItem) _then;

  /// Create a copy of CuratedSetArchiveItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? curatedSet = null,
    Object? isCompleted = null,
  }) {
    return _then(_CuratedSetArchiveItem(
      curatedSet: null == curatedSet
          ? _self.curatedSet
          : curatedSet // ignore: cast_nullable_to_non_nullable
              as CuratedSet,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of CuratedSetArchiveItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CuratedSetCopyWith<$Res> get curatedSet {
    return $CuratedSetCopyWith<$Res>(_self.curatedSet, (value) {
      return _then(_self.copyWith(curatedSet: value));
    });
  }
}

/// @nodoc
mixin _$CuratedSetsArchiveState {
  List<CuratedSetArchiveItem> get items;
  String? get errorMessage;

  /// Create a copy of CuratedSetsArchiveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CuratedSetsArchiveStateCopyWith<CuratedSetsArchiveState> get copyWith =>
      _$CuratedSetsArchiveStateCopyWithImpl<CuratedSetsArchiveState>(
          this as CuratedSetsArchiveState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CuratedSetsArchiveState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(items), errorMessage);

  @override
  String toString() {
    return 'CuratedSetsArchiveState(items: $items, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $CuratedSetsArchiveStateCopyWith<$Res> {
  factory $CuratedSetsArchiveStateCopyWith(CuratedSetsArchiveState value,
          $Res Function(CuratedSetsArchiveState) _then) =
      _$CuratedSetsArchiveStateCopyWithImpl;
  @useResult
  $Res call({List<CuratedSetArchiveItem> items, String? errorMessage});
}

/// @nodoc
class _$CuratedSetsArchiveStateCopyWithImpl<$Res>
    implements $CuratedSetsArchiveStateCopyWith<$Res> {
  _$CuratedSetsArchiveStateCopyWithImpl(this._self, this._then);

  final CuratedSetsArchiveState _self;
  final $Res Function(CuratedSetsArchiveState) _then;

  /// Create a copy of CuratedSetsArchiveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CuratedSetArchiveItem>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CuratedSetsArchiveState].
extension CuratedSetsArchiveStatePatterns on CuratedSetsArchiveState {
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
    TResult Function(_CuratedSetsArchiveState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CuratedSetsArchiveState() when $default != null:
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
    TResult Function(_CuratedSetsArchiveState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetsArchiveState():
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
    TResult? Function(_CuratedSetsArchiveState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetsArchiveState() when $default != null:
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
    TResult Function(List<CuratedSetArchiveItem> items, String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CuratedSetsArchiveState() when $default != null:
        return $default(_that.items, _that.errorMessage);
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
    TResult Function(List<CuratedSetArchiveItem> items, String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetsArchiveState():
        return $default(_that.items, _that.errorMessage);
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
    TResult? Function(List<CuratedSetArchiveItem> items, String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CuratedSetsArchiveState() when $default != null:
        return $default(_that.items, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CuratedSetsArchiveState implements CuratedSetsArchiveState {
  const _CuratedSetsArchiveState(
      {final List<CuratedSetArchiveItem> items =
          const <CuratedSetArchiveItem>[],
      this.errorMessage})
      : _items = items;

  final List<CuratedSetArchiveItem> _items;
  @override
  @JsonKey()
  List<CuratedSetArchiveItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? errorMessage;

  /// Create a copy of CuratedSetsArchiveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CuratedSetsArchiveStateCopyWith<_CuratedSetsArchiveState> get copyWith =>
      __$CuratedSetsArchiveStateCopyWithImpl<_CuratedSetsArchiveState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CuratedSetsArchiveState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), errorMessage);

  @override
  String toString() {
    return 'CuratedSetsArchiveState(items: $items, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$CuratedSetsArchiveStateCopyWith<$Res>
    implements $CuratedSetsArchiveStateCopyWith<$Res> {
  factory _$CuratedSetsArchiveStateCopyWith(_CuratedSetsArchiveState value,
          $Res Function(_CuratedSetsArchiveState) _then) =
      __$CuratedSetsArchiveStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<CuratedSetArchiveItem> items, String? errorMessage});
}

/// @nodoc
class __$CuratedSetsArchiveStateCopyWithImpl<$Res>
    implements _$CuratedSetsArchiveStateCopyWith<$Res> {
  __$CuratedSetsArchiveStateCopyWithImpl(this._self, this._then);

  final _CuratedSetsArchiveState _self;
  final $Res Function(_CuratedSetsArchiveState) _then;

  /// Create a copy of CuratedSetsArchiveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_CuratedSetsArchiveState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CuratedSetArchiveItem>,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
