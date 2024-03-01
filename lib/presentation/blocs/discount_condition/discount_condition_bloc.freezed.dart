// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_condition_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscountConditionEvent {
  Map<String, dynamic>? get queryParameters =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadProducts,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTypes,
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadCollections,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTags,
    required TResult Function(Map<String, dynamic>? queryParameters) loadGroups,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadGroups,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult Function(Map<String, dynamic>? queryParameters)? loadGroups,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_LoadTypes value) loadTypes,
    required TResult Function(_LoadCollections value) loadCollections,
    required TResult Function(_LoadTags value) loadTags,
    required TResult Function(_LoadGroups value) loadGroups,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_LoadTypes value)? loadTypes,
    TResult? Function(_LoadCollections value)? loadCollections,
    TResult? Function(_LoadTags value)? loadTags,
    TResult? Function(_LoadGroups value)? loadGroups,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_LoadTypes value)? loadTypes,
    TResult Function(_LoadCollections value)? loadCollections,
    TResult Function(_LoadTags value)? loadTags,
    TResult Function(_LoadGroups value)? loadGroups,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscountConditionEventCopyWith<DiscountConditionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountConditionEventCopyWith<$Res> {
  factory $DiscountConditionEventCopyWith(DiscountConditionEvent value,
          $Res Function(DiscountConditionEvent) then) =
      _$DiscountConditionEventCopyWithImpl<$Res, DiscountConditionEvent>;
  @useResult
  $Res call({Map<String, dynamic>? queryParameters});
}

/// @nodoc
class _$DiscountConditionEventCopyWithImpl<$Res,
        $Val extends DiscountConditionEvent>
    implements $DiscountConditionEventCopyWith<$Res> {
  _$DiscountConditionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryParameters = freezed,
  }) {
    return _then(_value.copyWith(
      queryParameters: freezed == queryParameters
          ? _value.queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadProductsImplCopyWith<$Res>
    implements $DiscountConditionEventCopyWith<$Res> {
  factory _$$LoadProductsImplCopyWith(
          _$LoadProductsImpl value, $Res Function(_$LoadProductsImpl) then) =
      __$$LoadProductsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? queryParameters});
}

/// @nodoc
class __$$LoadProductsImplCopyWithImpl<$Res>
    extends _$DiscountConditionEventCopyWithImpl<$Res, _$LoadProductsImpl>
    implements _$$LoadProductsImplCopyWith<$Res> {
  __$$LoadProductsImplCopyWithImpl(
      _$LoadProductsImpl _value, $Res Function(_$LoadProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryParameters = freezed,
  }) {
    return _then(_$LoadProductsImpl(
      queryParameters: freezed == queryParameters
          ? _value._queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$LoadProductsImpl implements _LoadProducts {
  const _$LoadProductsImpl({final Map<String, dynamic>? queryParameters})
      : _queryParameters = queryParameters;

  final Map<String, dynamic>? _queryParameters;
  @override
  Map<String, dynamic>? get queryParameters {
    final value = _queryParameters;
    if (value == null) return null;
    if (_queryParameters is EqualUnmodifiableMapView) return _queryParameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DiscountConditionEvent.loadProducts(queryParameters: $queryParameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProductsImpl &&
            const DeepCollectionEquality()
                .equals(other._queryParameters, _queryParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_queryParameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProductsImplCopyWith<_$LoadProductsImpl> get copyWith =>
      __$$LoadProductsImplCopyWithImpl<_$LoadProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadProducts,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTypes,
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadCollections,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTags,
    required TResult Function(Map<String, dynamic>? queryParameters) loadGroups,
  }) {
    return loadProducts(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadGroups,
  }) {
    return loadProducts?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult Function(Map<String, dynamic>? queryParameters)? loadGroups,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(queryParameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_LoadTypes value) loadTypes,
    required TResult Function(_LoadCollections value) loadCollections,
    required TResult Function(_LoadTags value) loadTags,
    required TResult Function(_LoadGroups value) loadGroups,
  }) {
    return loadProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_LoadTypes value)? loadTypes,
    TResult? Function(_LoadCollections value)? loadCollections,
    TResult? Function(_LoadTags value)? loadTags,
    TResult? Function(_LoadGroups value)? loadGroups,
  }) {
    return loadProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_LoadTypes value)? loadTypes,
    TResult Function(_LoadCollections value)? loadCollections,
    TResult Function(_LoadTags value)? loadTags,
    TResult Function(_LoadGroups value)? loadGroups,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(this);
    }
    return orElse();
  }
}

abstract class _LoadProducts implements DiscountConditionEvent {
  const factory _LoadProducts({final Map<String, dynamic>? queryParameters}) =
      _$LoadProductsImpl;

  @override
  Map<String, dynamic>? get queryParameters;
  @override
  @JsonKey(ignore: true)
  _$$LoadProductsImplCopyWith<_$LoadProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadTypesImplCopyWith<$Res>
    implements $DiscountConditionEventCopyWith<$Res> {
  factory _$$LoadTypesImplCopyWith(
          _$LoadTypesImpl value, $Res Function(_$LoadTypesImpl) then) =
      __$$LoadTypesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? queryParameters});
}

/// @nodoc
class __$$LoadTypesImplCopyWithImpl<$Res>
    extends _$DiscountConditionEventCopyWithImpl<$Res, _$LoadTypesImpl>
    implements _$$LoadTypesImplCopyWith<$Res> {
  __$$LoadTypesImplCopyWithImpl(
      _$LoadTypesImpl _value, $Res Function(_$LoadTypesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryParameters = freezed,
  }) {
    return _then(_$LoadTypesImpl(
      queryParameters: freezed == queryParameters
          ? _value._queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$LoadTypesImpl implements _LoadTypes {
  const _$LoadTypesImpl({final Map<String, dynamic>? queryParameters})
      : _queryParameters = queryParameters;

  final Map<String, dynamic>? _queryParameters;
  @override
  Map<String, dynamic>? get queryParameters {
    final value = _queryParameters;
    if (value == null) return null;
    if (_queryParameters is EqualUnmodifiableMapView) return _queryParameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DiscountConditionEvent.loadTypes(queryParameters: $queryParameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTypesImpl &&
            const DeepCollectionEquality()
                .equals(other._queryParameters, _queryParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_queryParameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTypesImplCopyWith<_$LoadTypesImpl> get copyWith =>
      __$$LoadTypesImplCopyWithImpl<_$LoadTypesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadProducts,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTypes,
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadCollections,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTags,
    required TResult Function(Map<String, dynamic>? queryParameters) loadGroups,
  }) {
    return loadTypes(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadGroups,
  }) {
    return loadTypes?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult Function(Map<String, dynamic>? queryParameters)? loadGroups,
    required TResult orElse(),
  }) {
    if (loadTypes != null) {
      return loadTypes(queryParameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_LoadTypes value) loadTypes,
    required TResult Function(_LoadCollections value) loadCollections,
    required TResult Function(_LoadTags value) loadTags,
    required TResult Function(_LoadGroups value) loadGroups,
  }) {
    return loadTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_LoadTypes value)? loadTypes,
    TResult? Function(_LoadCollections value)? loadCollections,
    TResult? Function(_LoadTags value)? loadTags,
    TResult? Function(_LoadGroups value)? loadGroups,
  }) {
    return loadTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_LoadTypes value)? loadTypes,
    TResult Function(_LoadCollections value)? loadCollections,
    TResult Function(_LoadTags value)? loadTags,
    TResult Function(_LoadGroups value)? loadGroups,
    required TResult orElse(),
  }) {
    if (loadTypes != null) {
      return loadTypes(this);
    }
    return orElse();
  }
}

abstract class _LoadTypes implements DiscountConditionEvent {
  const factory _LoadTypes({final Map<String, dynamic>? queryParameters}) =
      _$LoadTypesImpl;

  @override
  Map<String, dynamic>? get queryParameters;
  @override
  @JsonKey(ignore: true)
  _$$LoadTypesImplCopyWith<_$LoadTypesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadCollectionsImplCopyWith<$Res>
    implements $DiscountConditionEventCopyWith<$Res> {
  factory _$$LoadCollectionsImplCopyWith(_$LoadCollectionsImpl value,
          $Res Function(_$LoadCollectionsImpl) then) =
      __$$LoadCollectionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? queryParameters});
}

/// @nodoc
class __$$LoadCollectionsImplCopyWithImpl<$Res>
    extends _$DiscountConditionEventCopyWithImpl<$Res, _$LoadCollectionsImpl>
    implements _$$LoadCollectionsImplCopyWith<$Res> {
  __$$LoadCollectionsImplCopyWithImpl(
      _$LoadCollectionsImpl _value, $Res Function(_$LoadCollectionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryParameters = freezed,
  }) {
    return _then(_$LoadCollectionsImpl(
      queryParameters: freezed == queryParameters
          ? _value._queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$LoadCollectionsImpl implements _LoadCollections {
  const _$LoadCollectionsImpl({final Map<String, dynamic>? queryParameters})
      : _queryParameters = queryParameters;

  final Map<String, dynamic>? _queryParameters;
  @override
  Map<String, dynamic>? get queryParameters {
    final value = _queryParameters;
    if (value == null) return null;
    if (_queryParameters is EqualUnmodifiableMapView) return _queryParameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DiscountConditionEvent.loadCollections(queryParameters: $queryParameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCollectionsImpl &&
            const DeepCollectionEquality()
                .equals(other._queryParameters, _queryParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_queryParameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCollectionsImplCopyWith<_$LoadCollectionsImpl> get copyWith =>
      __$$LoadCollectionsImplCopyWithImpl<_$LoadCollectionsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadProducts,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTypes,
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadCollections,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTags,
    required TResult Function(Map<String, dynamic>? queryParameters) loadGroups,
  }) {
    return loadCollections(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadGroups,
  }) {
    return loadCollections?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult Function(Map<String, dynamic>? queryParameters)? loadGroups,
    required TResult orElse(),
  }) {
    if (loadCollections != null) {
      return loadCollections(queryParameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_LoadTypes value) loadTypes,
    required TResult Function(_LoadCollections value) loadCollections,
    required TResult Function(_LoadTags value) loadTags,
    required TResult Function(_LoadGroups value) loadGroups,
  }) {
    return loadCollections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_LoadTypes value)? loadTypes,
    TResult? Function(_LoadCollections value)? loadCollections,
    TResult? Function(_LoadTags value)? loadTags,
    TResult? Function(_LoadGroups value)? loadGroups,
  }) {
    return loadCollections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_LoadTypes value)? loadTypes,
    TResult Function(_LoadCollections value)? loadCollections,
    TResult Function(_LoadTags value)? loadTags,
    TResult Function(_LoadGroups value)? loadGroups,
    required TResult orElse(),
  }) {
    if (loadCollections != null) {
      return loadCollections(this);
    }
    return orElse();
  }
}

abstract class _LoadCollections implements DiscountConditionEvent {
  const factory _LoadCollections(
      {final Map<String, dynamic>? queryParameters}) = _$LoadCollectionsImpl;

  @override
  Map<String, dynamic>? get queryParameters;
  @override
  @JsonKey(ignore: true)
  _$$LoadCollectionsImplCopyWith<_$LoadCollectionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadTagsImplCopyWith<$Res>
    implements $DiscountConditionEventCopyWith<$Res> {
  factory _$$LoadTagsImplCopyWith(
          _$LoadTagsImpl value, $Res Function(_$LoadTagsImpl) then) =
      __$$LoadTagsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? queryParameters});
}

/// @nodoc
class __$$LoadTagsImplCopyWithImpl<$Res>
    extends _$DiscountConditionEventCopyWithImpl<$Res, _$LoadTagsImpl>
    implements _$$LoadTagsImplCopyWith<$Res> {
  __$$LoadTagsImplCopyWithImpl(
      _$LoadTagsImpl _value, $Res Function(_$LoadTagsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryParameters = freezed,
  }) {
    return _then(_$LoadTagsImpl(
      queryParameters: freezed == queryParameters
          ? _value._queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$LoadTagsImpl implements _LoadTags {
  const _$LoadTagsImpl({final Map<String, dynamic>? queryParameters})
      : _queryParameters = queryParameters;

  final Map<String, dynamic>? _queryParameters;
  @override
  Map<String, dynamic>? get queryParameters {
    final value = _queryParameters;
    if (value == null) return null;
    if (_queryParameters is EqualUnmodifiableMapView) return _queryParameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DiscountConditionEvent.loadTags(queryParameters: $queryParameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTagsImpl &&
            const DeepCollectionEquality()
                .equals(other._queryParameters, _queryParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_queryParameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTagsImplCopyWith<_$LoadTagsImpl> get copyWith =>
      __$$LoadTagsImplCopyWithImpl<_$LoadTagsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadProducts,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTypes,
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadCollections,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTags,
    required TResult Function(Map<String, dynamic>? queryParameters) loadGroups,
  }) {
    return loadTags(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadGroups,
  }) {
    return loadTags?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult Function(Map<String, dynamic>? queryParameters)? loadGroups,
    required TResult orElse(),
  }) {
    if (loadTags != null) {
      return loadTags(queryParameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_LoadTypes value) loadTypes,
    required TResult Function(_LoadCollections value) loadCollections,
    required TResult Function(_LoadTags value) loadTags,
    required TResult Function(_LoadGroups value) loadGroups,
  }) {
    return loadTags(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_LoadTypes value)? loadTypes,
    TResult? Function(_LoadCollections value)? loadCollections,
    TResult? Function(_LoadTags value)? loadTags,
    TResult? Function(_LoadGroups value)? loadGroups,
  }) {
    return loadTags?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_LoadTypes value)? loadTypes,
    TResult Function(_LoadCollections value)? loadCollections,
    TResult Function(_LoadTags value)? loadTags,
    TResult Function(_LoadGroups value)? loadGroups,
    required TResult orElse(),
  }) {
    if (loadTags != null) {
      return loadTags(this);
    }
    return orElse();
  }
}

abstract class _LoadTags implements DiscountConditionEvent {
  const factory _LoadTags({final Map<String, dynamic>? queryParameters}) =
      _$LoadTagsImpl;

  @override
  Map<String, dynamic>? get queryParameters;
  @override
  @JsonKey(ignore: true)
  _$$LoadTagsImplCopyWith<_$LoadTagsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadGroupsImplCopyWith<$Res>
    implements $DiscountConditionEventCopyWith<$Res> {
  factory _$$LoadGroupsImplCopyWith(
          _$LoadGroupsImpl value, $Res Function(_$LoadGroupsImpl) then) =
      __$$LoadGroupsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? queryParameters});
}

/// @nodoc
class __$$LoadGroupsImplCopyWithImpl<$Res>
    extends _$DiscountConditionEventCopyWithImpl<$Res, _$LoadGroupsImpl>
    implements _$$LoadGroupsImplCopyWith<$Res> {
  __$$LoadGroupsImplCopyWithImpl(
      _$LoadGroupsImpl _value, $Res Function(_$LoadGroupsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryParameters = freezed,
  }) {
    return _then(_$LoadGroupsImpl(
      queryParameters: freezed == queryParameters
          ? _value._queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$LoadGroupsImpl implements _LoadGroups {
  const _$LoadGroupsImpl({final Map<String, dynamic>? queryParameters})
      : _queryParameters = queryParameters;

  final Map<String, dynamic>? _queryParameters;
  @override
  Map<String, dynamic>? get queryParameters {
    final value = _queryParameters;
    if (value == null) return null;
    if (_queryParameters is EqualUnmodifiableMapView) return _queryParameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DiscountConditionEvent.loadGroups(queryParameters: $queryParameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadGroupsImpl &&
            const DeepCollectionEquality()
                .equals(other._queryParameters, _queryParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_queryParameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadGroupsImplCopyWith<_$LoadGroupsImpl> get copyWith =>
      __$$LoadGroupsImplCopyWithImpl<_$LoadGroupsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadProducts,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTypes,
    required TResult Function(Map<String, dynamic>? queryParameters)
        loadCollections,
    required TResult Function(Map<String, dynamic>? queryParameters) loadTags,
    required TResult Function(Map<String, dynamic>? queryParameters) loadGroups,
  }) {
    return loadGroups(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadGroups,
  }) {
    return loadGroups?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic>? queryParameters)? loadProducts,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTypes,
    TResult Function(Map<String, dynamic>? queryParameters)? loadCollections,
    TResult Function(Map<String, dynamic>? queryParameters)? loadTags,
    TResult Function(Map<String, dynamic>? queryParameters)? loadGroups,
    required TResult orElse(),
  }) {
    if (loadGroups != null) {
      return loadGroups(queryParameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_LoadTypes value) loadTypes,
    required TResult Function(_LoadCollections value) loadCollections,
    required TResult Function(_LoadTags value) loadTags,
    required TResult Function(_LoadGroups value) loadGroups,
  }) {
    return loadGroups(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_LoadTypes value)? loadTypes,
    TResult? Function(_LoadCollections value)? loadCollections,
    TResult? Function(_LoadTags value)? loadTags,
    TResult? Function(_LoadGroups value)? loadGroups,
  }) {
    return loadGroups?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_LoadTypes value)? loadTypes,
    TResult Function(_LoadCollections value)? loadCollections,
    TResult Function(_LoadTags value)? loadTags,
    TResult Function(_LoadGroups value)? loadGroups,
    required TResult orElse(),
  }) {
    if (loadGroups != null) {
      return loadGroups(this);
    }
    return orElse();
  }
}

abstract class _LoadGroups implements DiscountConditionEvent {
  const factory _LoadGroups({final Map<String, dynamic>? queryParameters}) =
      _$LoadGroupsImpl;

  @override
  Map<String, dynamic>? get queryParameters;
  @override
  @JsonKey(ignore: true)
  _$$LoadGroupsImplCopyWith<_$LoadGroupsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiscountConditionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Object> items, int count) loaded,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Object> items, int count)? loaded,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Object> items, int count)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountConditionStateCopyWith<$Res> {
  factory $DiscountConditionStateCopyWith(DiscountConditionState value,
          $Res Function(DiscountConditionState) then) =
      _$DiscountConditionStateCopyWithImpl<$Res, DiscountConditionState>;
}

/// @nodoc
class _$DiscountConditionStateCopyWithImpl<$Res,
        $Val extends DiscountConditionState>
    implements $DiscountConditionStateCopyWith<$Res> {
  _$DiscountConditionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DiscountConditionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DiscountConditionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Object> items, int count) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Object> items, int count)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Object> items, int count)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DiscountConditionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$DiscountConditionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'DiscountConditionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Object> items, int count) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Object> items, int count)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Object> items, int count)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements DiscountConditionState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Object> items, int count});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$DiscountConditionStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? count = null,
  }) {
    return _then(_$LoadedImpl(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Object>,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<Object> items, this.count) : _items = items;

  final List<Object> _items;
  @override
  List<Object> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'DiscountConditionState.loaded(items: $items, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Object> items, int count) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return loaded(items, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Object> items, int count)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return loaded?.call(items, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Object> items, int count)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements DiscountConditionState {
  const factory _Loaded(final List<Object> items, final int count) =
      _$LoadedImpl;

  List<Object> get items;
  int get count;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DiscountConditionStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'DiscountConditionState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Object> items, int count) loaded,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Object> items, int count)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Object> items, int count)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements DiscountConditionState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
