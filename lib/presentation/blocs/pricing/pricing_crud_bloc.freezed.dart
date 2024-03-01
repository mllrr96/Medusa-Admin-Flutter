// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_crud_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PricingCrudEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCreatePriceListReq userCreatePriceListReq)
        create,
    required TResult Function(
            String id, UserUpdatePriceListReq userUpdatePriceListReq)
        update,
    required TResult Function(
            String id, UserUpdatePricesReq userUpdatePricesReq)
        updatePrices,
    required TResult Function(String id) load,
    required TResult Function(String id) loadProducts,
    required TResult Function(String id) delete,
    required TResult Function(String id, String productId) deleteProduct,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult? Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult? Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult? Function(String id)? load,
    TResult? Function(String id)? loadProducts,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String productId)? deleteProduct,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult Function(String id)? load,
    TResult Function(String id)? loadProducts,
    TResult Function(String id)? delete,
    TResult Function(String id, String productId)? deleteProduct,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_UpdatePrices value) updatePrices,
    required TResult Function(_Load value) load,
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_LoadAll value) loadAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_UpdatePrices value)? updatePrices,
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_LoadAll value)? loadAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_UpdatePrices value)? updatePrices,
    TResult Function(_Load value)? load,
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_LoadAll value)? loadAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingCrudEventCopyWith<$Res> {
  factory $PricingCrudEventCopyWith(
          PricingCrudEvent value, $Res Function(PricingCrudEvent) then) =
      _$PricingCrudEventCopyWithImpl<$Res, PricingCrudEvent>;
}

/// @nodoc
class _$PricingCrudEventCopyWithImpl<$Res, $Val extends PricingCrudEvent>
    implements $PricingCrudEventCopyWith<$Res> {
  _$PricingCrudEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCreatePriceListReq userCreatePriceListReq});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$PricingCrudEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCreatePriceListReq = null,
  }) {
    return _then(_$CreateImpl(
      null == userCreatePriceListReq
          ? _value.userCreatePriceListReq
          : userCreatePriceListReq // ignore: cast_nullable_to_non_nullable
              as UserCreatePriceListReq,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(this.userCreatePriceListReq);

  @override
  final UserCreatePriceListReq userCreatePriceListReq;

  @override
  String toString() {
    return 'PricingCrudEvent.create(userCreatePriceListReq: $userCreatePriceListReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.userCreatePriceListReq, userCreatePriceListReq) ||
                other.userCreatePriceListReq == userCreatePriceListReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCreatePriceListReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCreatePriceListReq userCreatePriceListReq)
        create,
    required TResult Function(
            String id, UserUpdatePriceListReq userUpdatePriceListReq)
        update,
    required TResult Function(
            String id, UserUpdatePricesReq userUpdatePricesReq)
        updatePrices,
    required TResult Function(String id) load,
    required TResult Function(String id) loadProducts,
    required TResult Function(String id) delete,
    required TResult Function(String id, String productId) deleteProduct,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
  }) {
    return create(userCreatePriceListReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult? Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult? Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult? Function(String id)? load,
    TResult? Function(String id)? loadProducts,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String productId)? deleteProduct,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
  }) {
    return create?.call(userCreatePriceListReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult Function(String id)? load,
    TResult Function(String id)? loadProducts,
    TResult Function(String id)? delete,
    TResult Function(String id, String productId)? deleteProduct,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(userCreatePriceListReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_UpdatePrices value) updatePrices,
    required TResult Function(_Load value) load,
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_LoadAll value) loadAll,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_UpdatePrices value)? updatePrices,
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_LoadAll value)? loadAll,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_UpdatePrices value)? updatePrices,
    TResult Function(_Load value)? load,
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_LoadAll value)? loadAll,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements PricingCrudEvent {
  const factory _Create(final UserCreatePriceListReq userCreatePriceListReq) =
      _$CreateImpl;

  UserCreatePriceListReq get userCreatePriceListReq;
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
  $Res call({String id, UserUpdatePriceListReq userUpdatePriceListReq});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$PricingCrudEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userUpdatePriceListReq = null,
  }) {
    return _then(_$UpdateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userUpdatePriceListReq
          ? _value.userUpdatePriceListReq
          : userUpdatePriceListReq // ignore: cast_nullable_to_non_nullable
              as UserUpdatePriceListReq,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.id, this.userUpdatePriceListReq);

  @override
  final String id;
  @override
  final UserUpdatePriceListReq userUpdatePriceListReq;

  @override
  String toString() {
    return 'PricingCrudEvent.update(id: $id, userUpdatePriceListReq: $userUpdatePriceListReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userUpdatePriceListReq, userUpdatePriceListReq) ||
                other.userUpdatePriceListReq == userUpdatePriceListReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userUpdatePriceListReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCreatePriceListReq userCreatePriceListReq)
        create,
    required TResult Function(
            String id, UserUpdatePriceListReq userUpdatePriceListReq)
        update,
    required TResult Function(
            String id, UserUpdatePricesReq userUpdatePricesReq)
        updatePrices,
    required TResult Function(String id) load,
    required TResult Function(String id) loadProducts,
    required TResult Function(String id) delete,
    required TResult Function(String id, String productId) deleteProduct,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
  }) {
    return update(id, userUpdatePriceListReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult? Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult? Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult? Function(String id)? load,
    TResult? Function(String id)? loadProducts,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String productId)? deleteProduct,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
  }) {
    return update?.call(id, userUpdatePriceListReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult Function(String id)? load,
    TResult Function(String id)? loadProducts,
    TResult Function(String id)? delete,
    TResult Function(String id, String productId)? deleteProduct,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, userUpdatePriceListReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_UpdatePrices value) updatePrices,
    required TResult Function(_Load value) load,
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_LoadAll value) loadAll,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_UpdatePrices value)? updatePrices,
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_LoadAll value)? loadAll,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_UpdatePrices value)? updatePrices,
    TResult Function(_Load value)? load,
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_LoadAll value)? loadAll,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements PricingCrudEvent {
  const factory _Update(final String id,
      final UserUpdatePriceListReq userUpdatePriceListReq) = _$UpdateImpl;

  String get id;
  UserUpdatePriceListReq get userUpdatePriceListReq;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePricesImplCopyWith<$Res> {
  factory _$$UpdatePricesImplCopyWith(
          _$UpdatePricesImpl value, $Res Function(_$UpdatePricesImpl) then) =
      __$$UpdatePricesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, UserUpdatePricesReq userUpdatePricesReq});
}

/// @nodoc
class __$$UpdatePricesImplCopyWithImpl<$Res>
    extends _$PricingCrudEventCopyWithImpl<$Res, _$UpdatePricesImpl>
    implements _$$UpdatePricesImplCopyWith<$Res> {
  __$$UpdatePricesImplCopyWithImpl(
      _$UpdatePricesImpl _value, $Res Function(_$UpdatePricesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userUpdatePricesReq = null,
  }) {
    return _then(_$UpdatePricesImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userUpdatePricesReq
          ? _value.userUpdatePricesReq
          : userUpdatePricesReq // ignore: cast_nullable_to_non_nullable
              as UserUpdatePricesReq,
    ));
  }
}

/// @nodoc

class _$UpdatePricesImpl implements _UpdatePrices {
  const _$UpdatePricesImpl(this.id, this.userUpdatePricesReq);

  @override
  final String id;
  @override
  final UserUpdatePricesReq userUpdatePricesReq;

  @override
  String toString() {
    return 'PricingCrudEvent.updatePrices(id: $id, userUpdatePricesReq: $userUpdatePricesReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePricesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userUpdatePricesReq, userUpdatePricesReq) ||
                other.userUpdatePricesReq == userUpdatePricesReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userUpdatePricesReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePricesImplCopyWith<_$UpdatePricesImpl> get copyWith =>
      __$$UpdatePricesImplCopyWithImpl<_$UpdatePricesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCreatePriceListReq userCreatePriceListReq)
        create,
    required TResult Function(
            String id, UserUpdatePriceListReq userUpdatePriceListReq)
        update,
    required TResult Function(
            String id, UserUpdatePricesReq userUpdatePricesReq)
        updatePrices,
    required TResult Function(String id) load,
    required TResult Function(String id) loadProducts,
    required TResult Function(String id) delete,
    required TResult Function(String id, String productId) deleteProduct,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
  }) {
    return updatePrices(id, userUpdatePricesReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult? Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult? Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult? Function(String id)? load,
    TResult? Function(String id)? loadProducts,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String productId)? deleteProduct,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
  }) {
    return updatePrices?.call(id, userUpdatePricesReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult Function(String id)? load,
    TResult Function(String id)? loadProducts,
    TResult Function(String id)? delete,
    TResult Function(String id, String productId)? deleteProduct,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    required TResult orElse(),
  }) {
    if (updatePrices != null) {
      return updatePrices(id, userUpdatePricesReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_UpdatePrices value) updatePrices,
    required TResult Function(_Load value) load,
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_LoadAll value) loadAll,
  }) {
    return updatePrices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_UpdatePrices value)? updatePrices,
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_LoadAll value)? loadAll,
  }) {
    return updatePrices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_UpdatePrices value)? updatePrices,
    TResult Function(_Load value)? load,
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_LoadAll value)? loadAll,
    required TResult orElse(),
  }) {
    if (updatePrices != null) {
      return updatePrices(this);
    }
    return orElse();
  }
}

abstract class _UpdatePrices implements PricingCrudEvent {
  const factory _UpdatePrices(
          final String id, final UserUpdatePricesReq userUpdatePricesReq) =
      _$UpdatePricesImpl;

  String get id;
  UserUpdatePricesReq get userUpdatePricesReq;
  @JsonKey(ignore: true)
  _$$UpdatePricesImplCopyWith<_$UpdatePricesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$PricingCrudEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'PricingCrudEvent.load(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCreatePriceListReq userCreatePriceListReq)
        create,
    required TResult Function(
            String id, UserUpdatePriceListReq userUpdatePriceListReq)
        update,
    required TResult Function(
            String id, UserUpdatePricesReq userUpdatePricesReq)
        updatePrices,
    required TResult Function(String id) load,
    required TResult Function(String id) loadProducts,
    required TResult Function(String id) delete,
    required TResult Function(String id, String productId) deleteProduct,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult? Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult? Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult? Function(String id)? load,
    TResult? Function(String id)? loadProducts,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String productId)? deleteProduct,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
  }) {
    return load?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult Function(String id)? load,
    TResult Function(String id)? loadProducts,
    TResult Function(String id)? delete,
    TResult Function(String id, String productId)? deleteProduct,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_UpdatePrices value) updatePrices,
    required TResult Function(_Load value) load,
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_LoadAll value) loadAll,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_UpdatePrices value)? updatePrices,
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_LoadAll value)? loadAll,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_UpdatePrices value)? updatePrices,
    TResult Function(_Load value)? load,
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_LoadAll value)? loadAll,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements PricingCrudEvent {
  const factory _Load(final String id) = _$LoadImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadProductsImplCopyWith<$Res> {
  factory _$$LoadProductsImplCopyWith(
          _$LoadProductsImpl value, $Res Function(_$LoadProductsImpl) then) =
      __$$LoadProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$LoadProductsImplCopyWithImpl<$Res>
    extends _$PricingCrudEventCopyWithImpl<$Res, _$LoadProductsImpl>
    implements _$$LoadProductsImplCopyWith<$Res> {
  __$$LoadProductsImplCopyWithImpl(
      _$LoadProductsImpl _value, $Res Function(_$LoadProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadProductsImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadProductsImpl implements _LoadProducts {
  const _$LoadProductsImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'PricingCrudEvent.loadProducts(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProductsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProductsImplCopyWith<_$LoadProductsImpl> get copyWith =>
      __$$LoadProductsImplCopyWithImpl<_$LoadProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCreatePriceListReq userCreatePriceListReq)
        create,
    required TResult Function(
            String id, UserUpdatePriceListReq userUpdatePriceListReq)
        update,
    required TResult Function(
            String id, UserUpdatePricesReq userUpdatePricesReq)
        updatePrices,
    required TResult Function(String id) load,
    required TResult Function(String id) loadProducts,
    required TResult Function(String id) delete,
    required TResult Function(String id, String productId) deleteProduct,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
  }) {
    return loadProducts(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult? Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult? Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult? Function(String id)? load,
    TResult? Function(String id)? loadProducts,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String productId)? deleteProduct,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
  }) {
    return loadProducts?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult Function(String id)? load,
    TResult Function(String id)? loadProducts,
    TResult Function(String id)? delete,
    TResult Function(String id, String productId)? deleteProduct,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_UpdatePrices value) updatePrices,
    required TResult Function(_Load value) load,
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_LoadAll value) loadAll,
  }) {
    return loadProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_UpdatePrices value)? updatePrices,
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_LoadAll value)? loadAll,
  }) {
    return loadProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_UpdatePrices value)? updatePrices,
    TResult Function(_Load value)? load,
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_LoadAll value)? loadAll,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(this);
    }
    return orElse();
  }
}

abstract class _LoadProducts implements PricingCrudEvent {
  const factory _LoadProducts(final String id) = _$LoadProductsImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$LoadProductsImplCopyWith<_$LoadProductsImpl> get copyWith =>
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
    extends _$PricingCrudEventCopyWithImpl<$Res, _$DeleteImpl>
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
    return 'PricingCrudEvent.delete(id: $id)';
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
    required TResult Function(UserCreatePriceListReq userCreatePriceListReq)
        create,
    required TResult Function(
            String id, UserUpdatePriceListReq userUpdatePriceListReq)
        update,
    required TResult Function(
            String id, UserUpdatePricesReq userUpdatePricesReq)
        updatePrices,
    required TResult Function(String id) load,
    required TResult Function(String id) loadProducts,
    required TResult Function(String id) delete,
    required TResult Function(String id, String productId) deleteProduct,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult? Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult? Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult? Function(String id)? load,
    TResult? Function(String id)? loadProducts,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String productId)? deleteProduct,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult Function(String id)? load,
    TResult Function(String id)? loadProducts,
    TResult Function(String id)? delete,
    TResult Function(String id, String productId)? deleteProduct,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
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
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_UpdatePrices value) updatePrices,
    required TResult Function(_Load value) load,
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_LoadAll value) loadAll,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_UpdatePrices value)? updatePrices,
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_LoadAll value)? loadAll,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_UpdatePrices value)? updatePrices,
    TResult Function(_Load value)? load,
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_LoadAll value)? loadAll,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements PricingCrudEvent {
  const factory _Delete(final String id) = _$DeleteImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteProductImplCopyWith<$Res> {
  factory _$$DeleteProductImplCopyWith(
          _$DeleteProductImpl value, $Res Function(_$DeleteProductImpl) then) =
      __$$DeleteProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, String productId});
}

/// @nodoc
class __$$DeleteProductImplCopyWithImpl<$Res>
    extends _$PricingCrudEventCopyWithImpl<$Res, _$DeleteProductImpl>
    implements _$$DeleteProductImplCopyWith<$Res> {
  __$$DeleteProductImplCopyWithImpl(
      _$DeleteProductImpl _value, $Res Function(_$DeleteProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
  }) {
    return _then(_$DeleteProductImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteProductImpl implements _DeleteProduct {
  const _$DeleteProductImpl(this.id, this.productId);

  @override
  final String id;
  @override
  final String productId;

  @override
  String toString() {
    return 'PricingCrudEvent.deleteProduct(id: $id, productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteProductImplCopyWith<_$DeleteProductImpl> get copyWith =>
      __$$DeleteProductImplCopyWithImpl<_$DeleteProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserCreatePriceListReq userCreatePriceListReq)
        create,
    required TResult Function(
            String id, UserUpdatePriceListReq userUpdatePriceListReq)
        update,
    required TResult Function(
            String id, UserUpdatePricesReq userUpdatePricesReq)
        updatePrices,
    required TResult Function(String id) load,
    required TResult Function(String id) loadProducts,
    required TResult Function(String id) delete,
    required TResult Function(String id, String productId) deleteProduct,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
  }) {
    return deleteProduct(id, productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult? Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult? Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult? Function(String id)? load,
    TResult? Function(String id)? loadProducts,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String productId)? deleteProduct,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
  }) {
    return deleteProduct?.call(id, productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult Function(String id)? load,
    TResult Function(String id)? loadProducts,
    TResult Function(String id)? delete,
    TResult Function(String id, String productId)? deleteProduct,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(id, productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_UpdatePrices value) updatePrices,
    required TResult Function(_Load value) load,
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_LoadAll value) loadAll,
  }) {
    return deleteProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_UpdatePrices value)? updatePrices,
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_LoadAll value)? loadAll,
  }) {
    return deleteProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_UpdatePrices value)? updatePrices,
    TResult Function(_Load value)? load,
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_LoadAll value)? loadAll,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(this);
    }
    return orElse();
  }
}

abstract class _DeleteProduct implements PricingCrudEvent {
  const factory _DeleteProduct(final String id, final String productId) =
      _$DeleteProductImpl;

  String get id;
  String get productId;
  @JsonKey(ignore: true)
  _$$DeleteProductImplCopyWith<_$DeleteProductImpl> get copyWith =>
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
    extends _$PricingCrudEventCopyWithImpl<$Res, _$LoadAllImpl>
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
    return 'PricingCrudEvent.loadAll(queryParameters: $queryParameters)';
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
    required TResult Function(UserCreatePriceListReq userCreatePriceListReq)
        create,
    required TResult Function(
            String id, UserUpdatePriceListReq userUpdatePriceListReq)
        update,
    required TResult Function(
            String id, UserUpdatePricesReq userUpdatePricesReq)
        updatePrices,
    required TResult Function(String id) load,
    required TResult Function(String id) loadProducts,
    required TResult Function(String id) delete,
    required TResult Function(String id, String productId) deleteProduct,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
  }) {
    return loadAll(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult? Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult? Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult? Function(String id)? load,
    TResult? Function(String id)? loadProducts,
    TResult? Function(String id)? delete,
    TResult? Function(String id, String productId)? deleteProduct,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
  }) {
    return loadAll?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserCreatePriceListReq userCreatePriceListReq)? create,
    TResult Function(String id, UserUpdatePriceListReq userUpdatePriceListReq)?
        update,
    TResult Function(String id, UserUpdatePricesReq userUpdatePricesReq)?
        updatePrices,
    TResult Function(String id)? load,
    TResult Function(String id)? loadProducts,
    TResult Function(String id)? delete,
    TResult Function(String id, String productId)? deleteProduct,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
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
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_UpdatePrices value) updatePrices,
    required TResult Function(_Load value) load,
    required TResult Function(_LoadProducts value) loadProducts,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_LoadAll value) loadAll,
  }) {
    return loadAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_UpdatePrices value)? updatePrices,
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadProducts value)? loadProducts,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_LoadAll value)? loadAll,
  }) {
    return loadAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_UpdatePrices value)? updatePrices,
    TResult Function(_Load value)? load,
    TResult Function(_LoadProducts value)? loadProducts,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_LoadAll value)? loadAll,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class _LoadAll implements PricingCrudEvent {
  const factory _LoadAll({final Map<String, dynamic>? queryParameters}) =
      _$LoadAllImpl;

  Map<String, dynamic>? get queryParameters;
  @JsonKey(ignore: true)
  _$$LoadAllImplCopyWith<_$LoadAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PricingCrudState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function(PriceList priceList) pricingList,
    required TResult Function(List<PriceList> priceLists, int count)
        pricingLists,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function(PriceList priceList)? pricingList,
    TResult? Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function(PriceList priceList)? pricingList,
    TResult Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_PricingList value) pricingList,
    required TResult Function(_PricingLists value) pricingLists,
    required TResult Function(_Products value) products,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_PricingList value)? pricingList,
    TResult? Function(_PricingLists value)? pricingLists,
    TResult? Function(_Products value)? products,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_PricingList value)? pricingList,
    TResult Function(_PricingLists value)? pricingLists,
    TResult Function(_Products value)? products,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingCrudStateCopyWith<$Res> {
  factory $PricingCrudStateCopyWith(
          PricingCrudState value, $Res Function(PricingCrudState) then) =
      _$PricingCrudStateCopyWithImpl<$Res, PricingCrudState>;
}

/// @nodoc
class _$PricingCrudStateCopyWithImpl<$Res, $Val extends PricingCrudState>
    implements $PricingCrudStateCopyWith<$Res> {
  _$PricingCrudStateCopyWithImpl(this._value, this._then);

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
    extends _$PricingCrudStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'PricingCrudState.initial()';
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
    required TResult Function() deleted,
    required TResult Function(PriceList priceList) pricingList,
    required TResult Function(List<PriceList> priceLists, int count)
        pricingLists,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function(PriceList priceList)? pricingList,
    TResult? Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function(PriceList priceList)? pricingList,
    TResult Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult Function(List<Product> products, int count)? products,
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
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_PricingList value) pricingList,
    required TResult Function(_PricingLists value) pricingLists,
    required TResult Function(_Products value) products,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_PricingList value)? pricingList,
    TResult? Function(_PricingLists value)? pricingLists,
    TResult? Function(_Products value)? products,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_PricingList value)? pricingList,
    TResult Function(_PricingLists value)? pricingLists,
    TResult Function(_Products value)? products,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PricingCrudState {
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
    extends _$PricingCrudStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'PricingCrudState.loading()';
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
    required TResult Function() deleted,
    required TResult Function(PriceList priceList) pricingList,
    required TResult Function(List<PriceList> priceLists, int count)
        pricingLists,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function(PriceList priceList)? pricingList,
    TResult? Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function(PriceList priceList)? pricingList,
    TResult Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult Function(List<Product> products, int count)? products,
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
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_PricingList value) pricingList,
    required TResult Function(_PricingLists value) pricingLists,
    required TResult Function(_Products value) products,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_PricingList value)? pricingList,
    TResult? Function(_PricingLists value)? pricingLists,
    TResult? Function(_Products value)? products,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_PricingList value)? pricingList,
    TResult Function(_PricingLists value)? pricingLists,
    TResult Function(_Products value)? products,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PricingCrudState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$DeletedImplCopyWith<$Res> {
  factory _$$DeletedImplCopyWith(
          _$DeletedImpl value, $Res Function(_$DeletedImpl) then) =
      __$$DeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletedImplCopyWithImpl<$Res>
    extends _$PricingCrudStateCopyWithImpl<$Res, _$DeletedImpl>
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
    return 'PricingCrudState.deleted()';
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
    required TResult Function() deleted,
    required TResult Function(PriceList priceList) pricingList,
    required TResult Function(List<PriceList> priceLists, int count)
        pricingLists,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Failure failure) error,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function(PriceList priceList)? pricingList,
    TResult? Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Failure failure)? error,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function(PriceList priceList)? pricingList,
    TResult Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Failure failure)? error,
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
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_PricingList value) pricingList,
    required TResult Function(_PricingLists value) pricingLists,
    required TResult Function(_Products value) products,
    required TResult Function(_Error value) error,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_PricingList value)? pricingList,
    TResult? Function(_PricingLists value)? pricingLists,
    TResult? Function(_Products value)? products,
    TResult? Function(_Error value)? error,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_PricingList value)? pricingList,
    TResult Function(_PricingLists value)? pricingLists,
    TResult Function(_Products value)? products,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements PricingCrudState {
  const factory _Deleted() = _$DeletedImpl;
}

/// @nodoc
abstract class _$$PricingListImplCopyWith<$Res> {
  factory _$$PricingListImplCopyWith(
          _$PricingListImpl value, $Res Function(_$PricingListImpl) then) =
      __$$PricingListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceList priceList});
}

/// @nodoc
class __$$PricingListImplCopyWithImpl<$Res>
    extends _$PricingCrudStateCopyWithImpl<$Res, _$PricingListImpl>
    implements _$$PricingListImplCopyWith<$Res> {
  __$$PricingListImplCopyWithImpl(
      _$PricingListImpl _value, $Res Function(_$PricingListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceList = null,
  }) {
    return _then(_$PricingListImpl(
      null == priceList
          ? _value.priceList
          : priceList // ignore: cast_nullable_to_non_nullable
              as PriceList,
    ));
  }
}

/// @nodoc

class _$PricingListImpl implements _PricingList {
  const _$PricingListImpl(this.priceList);

  @override
  final PriceList priceList;

  @override
  String toString() {
    return 'PricingCrudState.pricingList(priceList: $priceList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingListImpl &&
            (identical(other.priceList, priceList) ||
                other.priceList == priceList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, priceList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingListImplCopyWith<_$PricingListImpl> get copyWith =>
      __$$PricingListImplCopyWithImpl<_$PricingListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function(PriceList priceList) pricingList,
    required TResult Function(List<PriceList> priceLists, int count)
        pricingLists,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Failure failure) error,
  }) {
    return pricingList(priceList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function(PriceList priceList)? pricingList,
    TResult? Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Failure failure)? error,
  }) {
    return pricingList?.call(priceList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function(PriceList priceList)? pricingList,
    TResult Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (pricingList != null) {
      return pricingList(priceList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_PricingList value) pricingList,
    required TResult Function(_PricingLists value) pricingLists,
    required TResult Function(_Products value) products,
    required TResult Function(_Error value) error,
  }) {
    return pricingList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_PricingList value)? pricingList,
    TResult? Function(_PricingLists value)? pricingLists,
    TResult? Function(_Products value)? products,
    TResult? Function(_Error value)? error,
  }) {
    return pricingList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_PricingList value)? pricingList,
    TResult Function(_PricingLists value)? pricingLists,
    TResult Function(_Products value)? products,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (pricingList != null) {
      return pricingList(this);
    }
    return orElse();
  }
}

abstract class _PricingList implements PricingCrudState {
  const factory _PricingList(final PriceList priceList) = _$PricingListImpl;

  PriceList get priceList;
  @JsonKey(ignore: true)
  _$$PricingListImplCopyWith<_$PricingListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PricingListsImplCopyWith<$Res> {
  factory _$$PricingListsImplCopyWith(
          _$PricingListsImpl value, $Res Function(_$PricingListsImpl) then) =
      __$$PricingListsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PriceList> priceLists, int count});
}

/// @nodoc
class __$$PricingListsImplCopyWithImpl<$Res>
    extends _$PricingCrudStateCopyWithImpl<$Res, _$PricingListsImpl>
    implements _$$PricingListsImplCopyWith<$Res> {
  __$$PricingListsImplCopyWithImpl(
      _$PricingListsImpl _value, $Res Function(_$PricingListsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceLists = null,
    Object? count = null,
  }) {
    return _then(_$PricingListsImpl(
      null == priceLists
          ? _value._priceLists
          : priceLists // ignore: cast_nullable_to_non_nullable
              as List<PriceList>,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PricingListsImpl implements _PricingLists {
  const _$PricingListsImpl(final List<PriceList> priceLists, this.count)
      : _priceLists = priceLists;

  final List<PriceList> _priceLists;
  @override
  List<PriceList> get priceLists {
    if (_priceLists is EqualUnmodifiableListView) return _priceLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceLists);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'PricingCrudState.pricingLists(priceLists: $priceLists, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingListsImpl &&
            const DeepCollectionEquality()
                .equals(other._priceLists, _priceLists) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_priceLists), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingListsImplCopyWith<_$PricingListsImpl> get copyWith =>
      __$$PricingListsImplCopyWithImpl<_$PricingListsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function(PriceList priceList) pricingList,
    required TResult Function(List<PriceList> priceLists, int count)
        pricingLists,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Failure failure) error,
  }) {
    return pricingLists(priceLists, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function(PriceList priceList)? pricingList,
    TResult? Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Failure failure)? error,
  }) {
    return pricingLists?.call(priceLists, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function(PriceList priceList)? pricingList,
    TResult Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (pricingLists != null) {
      return pricingLists(priceLists, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_PricingList value) pricingList,
    required TResult Function(_PricingLists value) pricingLists,
    required TResult Function(_Products value) products,
    required TResult Function(_Error value) error,
  }) {
    return pricingLists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_PricingList value)? pricingList,
    TResult? Function(_PricingLists value)? pricingLists,
    TResult? Function(_Products value)? products,
    TResult? Function(_Error value)? error,
  }) {
    return pricingLists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_PricingList value)? pricingList,
    TResult Function(_PricingLists value)? pricingLists,
    TResult Function(_Products value)? products,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (pricingLists != null) {
      return pricingLists(this);
    }
    return orElse();
  }
}

abstract class _PricingLists implements PricingCrudState {
  const factory _PricingLists(
      final List<PriceList> priceLists, final int count) = _$PricingListsImpl;

  List<PriceList> get priceLists;
  int get count;
  @JsonKey(ignore: true)
  _$$PricingListsImplCopyWith<_$PricingListsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductsImplCopyWith<$Res> {
  factory _$$ProductsImplCopyWith(
          _$ProductsImpl value, $Res Function(_$ProductsImpl) then) =
      __$$ProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products, int count});
}

/// @nodoc
class __$$ProductsImplCopyWithImpl<$Res>
    extends _$PricingCrudStateCopyWithImpl<$Res, _$ProductsImpl>
    implements _$$ProductsImplCopyWith<$Res> {
  __$$ProductsImplCopyWithImpl(
      _$ProductsImpl _value, $Res Function(_$ProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? count = null,
  }) {
    return _then(_$ProductsImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProductsImpl implements _Products {
  const _$ProductsImpl(final List<Product> products, this.count)
      : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'PricingCrudState.products(products: $products, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_products), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
      __$$ProductsImplCopyWithImpl<_$ProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function(PriceList priceList) pricingList,
    required TResult Function(List<PriceList> priceLists, int count)
        pricingLists,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Failure failure) error,
  }) {
    return products(this.products, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function(PriceList priceList)? pricingList,
    TResult? Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Failure failure)? error,
  }) {
    return products?.call(this.products, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function(PriceList priceList)? pricingList,
    TResult Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (products != null) {
      return products(this.products, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_PricingList value) pricingList,
    required TResult Function(_PricingLists value) pricingLists,
    required TResult Function(_Products value) products,
    required TResult Function(_Error value) error,
  }) {
    return products(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_PricingList value)? pricingList,
    TResult? Function(_PricingLists value)? pricingLists,
    TResult? Function(_Products value)? products,
    TResult? Function(_Error value)? error,
  }) {
    return products?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_PricingList value)? pricingList,
    TResult Function(_PricingLists value)? pricingLists,
    TResult Function(_Products value)? products,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (products != null) {
      return products(this);
    }
    return orElse();
  }
}

abstract class _Products implements PricingCrudState {
  const factory _Products(final List<Product> products, final int count) =
      _$ProductsImpl;

  List<Product> get products;
  int get count;
  @JsonKey(ignore: true)
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
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
    extends _$PricingCrudStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'PricingCrudState.error(failure: $failure)';
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
    required TResult Function() deleted,
    required TResult Function(PriceList priceList) pricingList,
    required TResult Function(List<PriceList> priceLists, int count)
        pricingLists,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? deleted,
    TResult? Function(PriceList priceList)? pricingList,
    TResult? Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function(PriceList priceList)? pricingList,
    TResult Function(List<PriceList> priceLists, int count)? pricingLists,
    TResult Function(List<Product> products, int count)? products,
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
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_PricingList value) pricingList,
    required TResult Function(_PricingLists value) pricingLists,
    required TResult Function(_Products value) products,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_PricingList value)? pricingList,
    TResult? Function(_PricingLists value)? pricingLists,
    TResult? Function(_Products value)? products,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_PricingList value)? pricingList,
    TResult Function(_PricingLists value)? pricingLists,
    TResult Function(_Products value)? products,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PricingCrudState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
