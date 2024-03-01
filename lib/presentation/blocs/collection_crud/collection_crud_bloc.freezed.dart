// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_crud_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CollectionCrudEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(UserCreateCollectionReq userCreateCollectionReq)
        create,
    required TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)
        update,
    required TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)
        removeProducts,
    required TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)
        addProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult? Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult? Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult? Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_RemoveProducts value) removeProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_RemoveProducts value)? removeProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_RemoveProducts value)? removeProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionCrudEventCopyWith<$Res> {
  factory $CollectionCrudEventCopyWith(
          CollectionCrudEvent value, $Res Function(CollectionCrudEvent) then) =
      _$CollectionCrudEventCopyWithImpl<$Res, CollectionCrudEvent>;
}

/// @nodoc
class _$CollectionCrudEventCopyWithImpl<$Res, $Val extends CollectionCrudEvent>
    implements $CollectionCrudEventCopyWith<$Res> {
  _$CollectionCrudEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, Map<String, dynamic>? queryParameters});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$CollectionCrudEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? queryParameters = freezed,
  }) {
    return _then(_$LoadImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      queryParameters: freezed == queryParameters
          ? _value._queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl(this.id, {final Map<String, dynamic>? queryParameters})
      : _queryParameters = queryParameters;

  @override
  final String id;
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
    return 'CollectionCrudEvent.load(id: $id, queryParameters: $queryParameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._queryParameters, _queryParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_queryParameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(UserCreateCollectionReq userCreateCollectionReq)
        create,
    required TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)
        update,
    required TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)
        removeProducts,
    required TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)
        addProducts,
  }) {
    return load(id, queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult? Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult? Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult? Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
  }) {
    return load?.call(id, queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(id, queryParameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_RemoveProducts value) removeProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_RemoveProducts value)? removeProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_RemoveProducts value)? removeProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements CollectionCrudEvent {
  const factory _Load(final String id,
      {final Map<String, dynamic>? queryParameters}) = _$LoadImpl;

  String get id;
  Map<String, dynamic>? get queryParameters;
  @JsonKey(ignore: true)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadAllImplCopyWith<$Res> {
  factory _$$LoadAllImplCopyWith(
          _$LoadAllImpl value, $Res Function(_$LoadAllImpl) then) =
      __$$LoadAllImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic>? queryParameters});
}

/// @nodoc
class __$$LoadAllImplCopyWithImpl<$Res>
    extends _$CollectionCrudEventCopyWithImpl<$Res, _$LoadAllImpl>
    implements _$$LoadAllImplCopyWith<$Res> {
  __$$LoadAllImplCopyWithImpl(
      _$LoadAllImpl _value, $Res Function(_$LoadAllImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryParameters = freezed,
  }) {
    return _then(_$LoadAllImpl(
      queryParameters: freezed == queryParameters
          ? _value._queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$LoadAllImpl implements _LoadAll {
  const _$LoadAllImpl({final Map<String, dynamic>? queryParameters})
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
    return 'CollectionCrudEvent.loadAll(queryParameters: $queryParameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAllImpl &&
            const DeepCollectionEquality()
                .equals(other._queryParameters, _queryParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_queryParameters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAllImplCopyWith<_$LoadAllImpl> get copyWith =>
      __$$LoadAllImplCopyWithImpl<_$LoadAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(UserCreateCollectionReq userCreateCollectionReq)
        create,
    required TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)
        update,
    required TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)
        removeProducts,
    required TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)
        addProducts,
  }) {
    return loadAll(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult? Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult? Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult? Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
  }) {
    return loadAll?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(queryParameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_RemoveProducts value) removeProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return loadAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_RemoveProducts value)? removeProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return loadAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_RemoveProducts value)? removeProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class _LoadAll implements CollectionCrudEvent {
  const factory _LoadAll({final Map<String, dynamic>? queryParameters}) =
      _$LoadAllImpl;

  Map<String, dynamic>? get queryParameters;
  @JsonKey(ignore: true)
  _$$LoadAllImplCopyWith<_$LoadAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$CollectionCrudEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'CollectionCrudEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(UserCreateCollectionReq userCreateCollectionReq)
        create,
    required TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)
        update,
    required TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)
        removeProducts,
    required TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)
        addProducts,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult? Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult? Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult? Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_RemoveProducts value) removeProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_RemoveProducts value)? removeProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_RemoveProducts value)? removeProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements CollectionCrudEvent {
  const factory _Delete(final String id) = _$DeleteImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCreateCollectionReq userCreateCollectionReq});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$CollectionCrudEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCreateCollectionReq = null,
  }) {
    return _then(_$CreateImpl(
      null == userCreateCollectionReq
          ? _value.userCreateCollectionReq
          : userCreateCollectionReq // ignore: cast_nullable_to_non_nullable
              as UserCreateCollectionReq,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(this.userCreateCollectionReq);

  @override
  final UserCreateCollectionReq userCreateCollectionReq;

  @override
  String toString() {
    return 'CollectionCrudEvent.create(userCreateCollectionReq: $userCreateCollectionReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(
                    other.userCreateCollectionReq, userCreateCollectionReq) ||
                other.userCreateCollectionReq == userCreateCollectionReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCreateCollectionReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(UserCreateCollectionReq userCreateCollectionReq)
        create,
    required TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)
        update,
    required TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)
        removeProducts,
    required TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)
        addProducts,
  }) {
    return create(userCreateCollectionReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult? Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult? Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult? Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
  }) {
    return create?.call(userCreateCollectionReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(userCreateCollectionReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_RemoveProducts value) removeProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_RemoveProducts value)? removeProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_RemoveProducts value)? removeProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements CollectionCrudEvent {
  const factory _Create(final UserCreateCollectionReq userCreateCollectionReq) =
      _$CreateImpl;

  UserCreateCollectionReq get userCreateCollectionReq;
  @JsonKey(ignore: true)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, UserCreateCollectionReq userCreateCollectionReq});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$CollectionCrudEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userCreateCollectionReq = null,
  }) {
    return _then(_$UpdateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userCreateCollectionReq
          ? _value.userCreateCollectionReq
          : userCreateCollectionReq // ignore: cast_nullable_to_non_nullable
              as UserCreateCollectionReq,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.id, this.userCreateCollectionReq);

  @override
  final String id;
  @override
  final UserCreateCollectionReq userCreateCollectionReq;

  @override
  String toString() {
    return 'CollectionCrudEvent.update(id: $id, userCreateCollectionReq: $userCreateCollectionReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(
                    other.userCreateCollectionReq, userCreateCollectionReq) ||
                other.userCreateCollectionReq == userCreateCollectionReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userCreateCollectionReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(UserCreateCollectionReq userCreateCollectionReq)
        create,
    required TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)
        update,
    required TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)
        removeProducts,
    required TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)
        addProducts,
  }) {
    return update(id, userCreateCollectionReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult? Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult? Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult? Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
  }) {
    return update?.call(id, userCreateCollectionReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, userCreateCollectionReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_RemoveProducts value) removeProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_RemoveProducts value)? removeProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_RemoveProducts value)? removeProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements CollectionCrudEvent {
  const factory _Update(final String id,
      final UserCreateCollectionReq userCreateCollectionReq) = _$UpdateImpl;

  String get id;
  UserCreateCollectionReq get userCreateCollectionReq;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveProductsImplCopyWith<$Res> {
  factory _$$RemoveProductsImplCopyWith(_$RemoveProductsImpl value,
          $Res Function(_$RemoveProductsImpl) then) =
      __$$RemoveProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCollectionRemoveProductsReq userCollectionRemoveProductsReq});
}

/// @nodoc
class __$$RemoveProductsImplCopyWithImpl<$Res>
    extends _$CollectionCrudEventCopyWithImpl<$Res, _$RemoveProductsImpl>
    implements _$$RemoveProductsImplCopyWith<$Res> {
  __$$RemoveProductsImplCopyWithImpl(
      _$RemoveProductsImpl _value, $Res Function(_$RemoveProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCollectionRemoveProductsReq = null,
  }) {
    return _then(_$RemoveProductsImpl(
      null == userCollectionRemoveProductsReq
          ? _value.userCollectionRemoveProductsReq
          : userCollectionRemoveProductsReq // ignore: cast_nullable_to_non_nullable
              as UserCollectionRemoveProductsReq,
    ));
  }
}

/// @nodoc

class _$RemoveProductsImpl implements _RemoveProducts {
  const _$RemoveProductsImpl(this.userCollectionRemoveProductsReq);

  @override
  final UserCollectionRemoveProductsReq userCollectionRemoveProductsReq;

  @override
  String toString() {
    return 'CollectionCrudEvent.removeProducts(userCollectionRemoveProductsReq: $userCollectionRemoveProductsReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveProductsImpl &&
            (identical(other.userCollectionRemoveProductsReq,
                    userCollectionRemoveProductsReq) ||
                other.userCollectionRemoveProductsReq ==
                    userCollectionRemoveProductsReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCollectionRemoveProductsReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveProductsImplCopyWith<_$RemoveProductsImpl> get copyWith =>
      __$$RemoveProductsImplCopyWithImpl<_$RemoveProductsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(UserCreateCollectionReq userCreateCollectionReq)
        create,
    required TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)
        update,
    required TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)
        removeProducts,
    required TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)
        addProducts,
  }) {
    return removeProducts(userCollectionRemoveProductsReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult? Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult? Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult? Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
  }) {
    return removeProducts?.call(userCollectionRemoveProductsReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
    required TResult orElse(),
  }) {
    if (removeProducts != null) {
      return removeProducts(userCollectionRemoveProductsReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_RemoveProducts value) removeProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return removeProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_RemoveProducts value)? removeProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return removeProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_RemoveProducts value)? removeProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (removeProducts != null) {
      return removeProducts(this);
    }
    return orElse();
  }
}

abstract class _RemoveProducts implements CollectionCrudEvent {
  const factory _RemoveProducts(
      final UserCollectionRemoveProductsReq
          userCollectionRemoveProductsReq) = _$RemoveProductsImpl;

  UserCollectionRemoveProductsReq get userCollectionRemoveProductsReq;
  @JsonKey(ignore: true)
  _$$RemoveProductsImplCopyWith<_$RemoveProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddProductsImplCopyWith<$Res> {
  factory _$$AddProductsImplCopyWith(
          _$AddProductsImpl value, $Res Function(_$AddProductsImpl) then) =
      __$$AddProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCollectionUpdateProductsReq userCollectionUpdateProductsReq});
}

/// @nodoc
class __$$AddProductsImplCopyWithImpl<$Res>
    extends _$CollectionCrudEventCopyWithImpl<$Res, _$AddProductsImpl>
    implements _$$AddProductsImplCopyWith<$Res> {
  __$$AddProductsImplCopyWithImpl(
      _$AddProductsImpl _value, $Res Function(_$AddProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCollectionUpdateProductsReq = null,
  }) {
    return _then(_$AddProductsImpl(
      null == userCollectionUpdateProductsReq
          ? _value.userCollectionUpdateProductsReq
          : userCollectionUpdateProductsReq // ignore: cast_nullable_to_non_nullable
              as UserCollectionUpdateProductsReq,
    ));
  }
}

/// @nodoc

class _$AddProductsImpl implements _AddProducts {
  const _$AddProductsImpl(this.userCollectionUpdateProductsReq);

  @override
  final UserCollectionUpdateProductsReq userCollectionUpdateProductsReq;

  @override
  String toString() {
    return 'CollectionCrudEvent.addProducts(userCollectionUpdateProductsReq: $userCollectionUpdateProductsReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductsImpl &&
            (identical(other.userCollectionUpdateProductsReq,
                    userCollectionUpdateProductsReq) ||
                other.userCollectionUpdateProductsReq ==
                    userCollectionUpdateProductsReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCollectionUpdateProductsReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductsImplCopyWith<_$AddProductsImpl> get copyWith =>
      __$$AddProductsImplCopyWithImpl<_$AddProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(UserCreateCollectionReq userCreateCollectionReq)
        create,
    required TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)
        update,
    required TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)
        removeProducts,
    required TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)
        addProducts,
  }) {
    return addProducts(userCollectionUpdateProductsReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult? Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult? Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult? Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
  }) {
    return addProducts?.call(userCollectionUpdateProductsReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateCollectionReq userCreateCollectionReq)? create,
    TResult Function(
            String id, UserCreateCollectionReq userCreateCollectionReq)?
        update,
    TResult Function(
            UserCollectionRemoveProductsReq userCollectionRemoveProductsReq)?
        removeProducts,
    TResult Function(
            UserCollectionUpdateProductsReq userCollectionUpdateProductsReq)?
        addProducts,
    required TResult orElse(),
  }) {
    if (addProducts != null) {
      return addProducts(userCollectionUpdateProductsReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_RemoveProducts value) removeProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return addProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_RemoveProducts value)? removeProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return addProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_RemoveProducts value)? removeProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (addProducts != null) {
      return addProducts(this);
    }
    return orElse();
  }
}

abstract class _AddProducts implements CollectionCrudEvent {
  const factory _AddProducts(
      final UserCollectionUpdateProductsReq
          userCollectionUpdateProductsReq) = _$AddProductsImpl;

  UserCollectionUpdateProductsReq get userCollectionUpdateProductsReq;
  @JsonKey(ignore: true)
  _$$AddProductsImplCopyWith<_$AddProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CollectionCrudState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductCollection collection) collection,
    required TResult Function(List<ProductCollection> collections, int count)
        collections,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
    required TResult Function(List<String> ids) productsRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductCollection collection)? collection,
    TResult? Function(List<ProductCollection> collections, int count)?
        collections,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
    TResult? Function(List<String> ids)? productsRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductCollection collection)? collection,
    TResult Function(List<ProductCollection> collections, int count)?
        collections,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    TResult Function(List<String> ids)? productsRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Collection value) collection,
    required TResult Function(_Collections value) collections,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ProductsRemoved value) productsRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Collection value)? collection,
    TResult? Function(_Collections value)? collections,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ProductsRemoved value)? productsRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Collection value)? collection,
    TResult Function(_Collections value)? collections,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ProductsRemoved value)? productsRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionCrudStateCopyWith<$Res> {
  factory $CollectionCrudStateCopyWith(
          CollectionCrudState value, $Res Function(CollectionCrudState) then) =
      _$CollectionCrudStateCopyWithImpl<$Res, CollectionCrudState>;
}

/// @nodoc
class _$CollectionCrudStateCopyWithImpl<$Res, $Val extends CollectionCrudState>
    implements $CollectionCrudStateCopyWith<$Res> {
  _$CollectionCrudStateCopyWithImpl(this._value, this._then);

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
    extends _$CollectionCrudStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CollectionCrudState.initial()';
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
    required TResult Function(ProductCollection collection) collection,
    required TResult Function(List<ProductCollection> collections, int count)
        collections,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
    required TResult Function(List<String> ids) productsRemoved,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductCollection collection)? collection,
    TResult? Function(List<ProductCollection> collections, int count)?
        collections,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
    TResult? Function(List<String> ids)? productsRemoved,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductCollection collection)? collection,
    TResult Function(List<ProductCollection> collections, int count)?
        collections,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    TResult Function(List<String> ids)? productsRemoved,
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
    required TResult Function(_Collection value) collection,
    required TResult Function(_Collections value) collections,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ProductsRemoved value) productsRemoved,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Collection value)? collection,
    TResult? Function(_Collections value)? collections,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ProductsRemoved value)? productsRemoved,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Collection value)? collection,
    TResult Function(_Collections value)? collections,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ProductsRemoved value)? productsRemoved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CollectionCrudState {
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
    extends _$CollectionCrudStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'CollectionCrudState.loading()';
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
    required TResult Function(ProductCollection collection) collection,
    required TResult Function(List<ProductCollection> collections, int count)
        collections,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
    required TResult Function(List<String> ids) productsRemoved,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductCollection collection)? collection,
    TResult? Function(List<ProductCollection> collections, int count)?
        collections,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
    TResult? Function(List<String> ids)? productsRemoved,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductCollection collection)? collection,
    TResult Function(List<ProductCollection> collections, int count)?
        collections,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    TResult Function(List<String> ids)? productsRemoved,
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
    required TResult Function(_Collection value) collection,
    required TResult Function(_Collections value) collections,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ProductsRemoved value) productsRemoved,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Collection value)? collection,
    TResult? Function(_Collections value)? collections,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ProductsRemoved value)? productsRemoved,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Collection value)? collection,
    TResult Function(_Collections value)? collections,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ProductsRemoved value)? productsRemoved,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CollectionCrudState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$CollectionImplCopyWith<$Res> {
  factory _$$CollectionImplCopyWith(
          _$CollectionImpl value, $Res Function(_$CollectionImpl) then) =
      __$$CollectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductCollection collection});
}

/// @nodoc
class __$$CollectionImplCopyWithImpl<$Res>
    extends _$CollectionCrudStateCopyWithImpl<$Res, _$CollectionImpl>
    implements _$$CollectionImplCopyWith<$Res> {
  __$$CollectionImplCopyWithImpl(
      _$CollectionImpl _value, $Res Function(_$CollectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
  }) {
    return _then(_$CollectionImpl(
      null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as ProductCollection,
    ));
  }
}

/// @nodoc

class _$CollectionImpl implements _Collection {
  const _$CollectionImpl(this.collection);

  @override
  final ProductCollection collection;

  @override
  String toString() {
    return 'CollectionCrudState.collection(collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionImplCopyWith<_$CollectionImpl> get copyWith =>
      __$$CollectionImplCopyWithImpl<_$CollectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductCollection collection) collection,
    required TResult Function(List<ProductCollection> collections, int count)
        collections,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
    required TResult Function(List<String> ids) productsRemoved,
  }) {
    return collection(this.collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductCollection collection)? collection,
    TResult? Function(List<ProductCollection> collections, int count)?
        collections,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
    TResult? Function(List<String> ids)? productsRemoved,
  }) {
    return collection?.call(this.collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductCollection collection)? collection,
    TResult Function(List<ProductCollection> collections, int count)?
        collections,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    TResult Function(List<String> ids)? productsRemoved,
    required TResult orElse(),
  }) {
    if (collection != null) {
      return collection(this.collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Collection value) collection,
    required TResult Function(_Collections value) collections,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ProductsRemoved value) productsRemoved,
  }) {
    return collection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Collection value)? collection,
    TResult? Function(_Collections value)? collections,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ProductsRemoved value)? productsRemoved,
  }) {
    return collection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Collection value)? collection,
    TResult Function(_Collections value)? collections,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ProductsRemoved value)? productsRemoved,
    required TResult orElse(),
  }) {
    if (collection != null) {
      return collection(this);
    }
    return orElse();
  }
}

abstract class _Collection implements CollectionCrudState {
  const factory _Collection(final ProductCollection collection) =
      _$CollectionImpl;

  ProductCollection get collection;
  @JsonKey(ignore: true)
  _$$CollectionImplCopyWith<_$CollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CollectionsImplCopyWith<$Res> {
  factory _$$CollectionsImplCopyWith(
          _$CollectionsImpl value, $Res Function(_$CollectionsImpl) then) =
      __$$CollectionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductCollection> collections, int count});
}

/// @nodoc
class __$$CollectionsImplCopyWithImpl<$Res>
    extends _$CollectionCrudStateCopyWithImpl<$Res, _$CollectionsImpl>
    implements _$$CollectionsImplCopyWith<$Res> {
  __$$CollectionsImplCopyWithImpl(
      _$CollectionsImpl _value, $Res Function(_$CollectionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? count = null,
  }) {
    return _then(_$CollectionsImpl(
      null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<ProductCollection>,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CollectionsImpl implements _Collections {
  const _$CollectionsImpl(final List<ProductCollection> collections, this.count)
      : _collections = collections;

  final List<ProductCollection> _collections;
  @override
  List<ProductCollection> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'CollectionCrudState.collections(collections: $collections, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionsImpl &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_collections), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionsImplCopyWith<_$CollectionsImpl> get copyWith =>
      __$$CollectionsImplCopyWithImpl<_$CollectionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductCollection collection) collection,
    required TResult Function(List<ProductCollection> collections, int count)
        collections,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
    required TResult Function(List<String> ids) productsRemoved,
  }) {
    return collections(this.collections, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductCollection collection)? collection,
    TResult? Function(List<ProductCollection> collections, int count)?
        collections,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
    TResult? Function(List<String> ids)? productsRemoved,
  }) {
    return collections?.call(this.collections, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductCollection collection)? collection,
    TResult Function(List<ProductCollection> collections, int count)?
        collections,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    TResult Function(List<String> ids)? productsRemoved,
    required TResult orElse(),
  }) {
    if (collections != null) {
      return collections(this.collections, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Collection value) collection,
    required TResult Function(_Collections value) collections,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ProductsRemoved value) productsRemoved,
  }) {
    return collections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Collection value)? collection,
    TResult? Function(_Collections value)? collections,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ProductsRemoved value)? productsRemoved,
  }) {
    return collections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Collection value)? collection,
    TResult Function(_Collections value)? collections,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ProductsRemoved value)? productsRemoved,
    required TResult orElse(),
  }) {
    if (collections != null) {
      return collections(this);
    }
    return orElse();
  }
}

abstract class _Collections implements CollectionCrudState {
  const factory _Collections(
          final List<ProductCollection> collections, final int count) =
      _$CollectionsImpl;

  List<ProductCollection> get collections;
  int get count;
  @JsonKey(ignore: true)
  _$$CollectionsImplCopyWith<_$CollectionsImpl> get copyWith =>
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
    extends _$CollectionCrudStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'CollectionCrudState.error(failure: $failure)';
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
    required TResult Function(ProductCollection collection) collection,
    required TResult Function(List<ProductCollection> collections, int count)
        collections,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
    required TResult Function(List<String> ids) productsRemoved,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductCollection collection)? collection,
    TResult? Function(List<ProductCollection> collections, int count)?
        collections,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
    TResult? Function(List<String> ids)? productsRemoved,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductCollection collection)? collection,
    TResult Function(List<ProductCollection> collections, int count)?
        collections,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    TResult Function(List<String> ids)? productsRemoved,
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
    required TResult Function(_Collection value) collection,
    required TResult Function(_Collections value) collections,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ProductsRemoved value) productsRemoved,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Collection value)? collection,
    TResult? Function(_Collections value)? collections,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ProductsRemoved value)? productsRemoved,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Collection value)? collection,
    TResult Function(_Collections value)? collections,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ProductsRemoved value)? productsRemoved,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CollectionCrudState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletedImplCopyWith<$Res> {
  factory _$$DeletedImplCopyWith(
          _$DeletedImpl value, $Res Function(_$DeletedImpl) then) =
      __$$DeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletedImplCopyWithImpl<$Res>
    extends _$CollectionCrudStateCopyWithImpl<$Res, _$DeletedImpl>
    implements _$$DeletedImplCopyWith<$Res> {
  __$$DeletedImplCopyWithImpl(
      _$DeletedImpl _value, $Res Function(_$DeletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeletedImpl implements _Deleted {
  const _$DeletedImpl();

  @override
  String toString() {
    return 'CollectionCrudState.deleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductCollection collection) collection,
    required TResult Function(List<ProductCollection> collections, int count)
        collections,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
    required TResult Function(List<String> ids) productsRemoved,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductCollection collection)? collection,
    TResult? Function(List<ProductCollection> collections, int count)?
        collections,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
    TResult? Function(List<String> ids)? productsRemoved,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductCollection collection)? collection,
    TResult Function(List<ProductCollection> collections, int count)?
        collections,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    TResult Function(List<String> ids)? productsRemoved,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Collection value) collection,
    required TResult Function(_Collections value) collections,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ProductsRemoved value) productsRemoved,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Collection value)? collection,
    TResult? Function(_Collections value)? collections,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ProductsRemoved value)? productsRemoved,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Collection value)? collection,
    TResult Function(_Collections value)? collections,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ProductsRemoved value)? productsRemoved,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements CollectionCrudState {
  const factory _Deleted() = _$DeletedImpl;
}

/// @nodoc
abstract class _$$ProductsRemovedImplCopyWith<$Res> {
  factory _$$ProductsRemovedImplCopyWith(_$ProductsRemovedImpl value,
          $Res Function(_$ProductsRemovedImpl) then) =
      __$$ProductsRemovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> ids});
}

/// @nodoc
class __$$ProductsRemovedImplCopyWithImpl<$Res>
    extends _$CollectionCrudStateCopyWithImpl<$Res, _$ProductsRemovedImpl>
    implements _$$ProductsRemovedImplCopyWith<$Res> {
  __$$ProductsRemovedImplCopyWithImpl(
      _$ProductsRemovedImpl _value, $Res Function(_$ProductsRemovedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
  }) {
    return _then(_$ProductsRemovedImpl(
      null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ProductsRemovedImpl implements _ProductsRemoved {
  const _$ProductsRemovedImpl(final List<String> ids) : _ids = ids;

  final List<String> _ids;
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString() {
    return 'CollectionCrudState.productsRemoved(ids: $ids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsRemovedImpl &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsRemovedImplCopyWith<_$ProductsRemovedImpl> get copyWith =>
      __$$ProductsRemovedImplCopyWithImpl<_$ProductsRemovedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductCollection collection) collection,
    required TResult Function(List<ProductCollection> collections, int count)
        collections,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
    required TResult Function(List<String> ids) productsRemoved,
  }) {
    return productsRemoved(ids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductCollection collection)? collection,
    TResult? Function(List<ProductCollection> collections, int count)?
        collections,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
    TResult? Function(List<String> ids)? productsRemoved,
  }) {
    return productsRemoved?.call(ids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductCollection collection)? collection,
    TResult Function(List<ProductCollection> collections, int count)?
        collections,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    TResult Function(List<String> ids)? productsRemoved,
    required TResult orElse(),
  }) {
    if (productsRemoved != null) {
      return productsRemoved(ids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Collection value) collection,
    required TResult Function(_Collections value) collections,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ProductsRemoved value) productsRemoved,
  }) {
    return productsRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Collection value)? collection,
    TResult? Function(_Collections value)? collections,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ProductsRemoved value)? productsRemoved,
  }) {
    return productsRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Collection value)? collection,
    TResult Function(_Collections value)? collections,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ProductsRemoved value)? productsRemoved,
    required TResult orElse(),
  }) {
    if (productsRemoved != null) {
      return productsRemoved(this);
    }
    return orElse();
  }
}

abstract class _ProductsRemoved implements CollectionCrudState {
  const factory _ProductsRemoved(final List<String> ids) =
      _$ProductsRemovedImpl;

  List<String> get ids;
  @JsonKey(ignore: true)
  _$$ProductsRemovedImplCopyWith<_$ProductsRemovedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
