// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_channel_crud_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesChannelCrudEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            UserSalesChannelCreateReq userSalesChannelCreateReq)
        create,
    required TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id, List<String> productIds)
        deleteProducts,
    required TResult Function(String id, List<String> productIds) addProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult? Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id, List<String> productIds)? deleteProducts,
    TResult? Function(String id, List<String> productIds)? addProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id, List<String> productIds)? deleteProducts,
    TResult Function(String id, List<String> productIds)? addProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProducts value) deleteProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProducts value)? deleteProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProducts value)? deleteProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesChannelCrudEventCopyWith<$Res> {
  factory $SalesChannelCrudEventCopyWith(SalesChannelCrudEvent value,
          $Res Function(SalesChannelCrudEvent) then) =
      _$SalesChannelCrudEventCopyWithImpl<$Res, SalesChannelCrudEvent>;
}

/// @nodoc
class _$SalesChannelCrudEventCopyWithImpl<$Res,
        $Val extends SalesChannelCrudEvent>
    implements $SalesChannelCrudEventCopyWith<$Res> {
  _$SalesChannelCrudEventCopyWithImpl(this._value, this._then);

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
  $Res call({String id});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$SalesChannelCrudEventCopyWithImpl<$Res, _$LoadImpl>
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
    return 'SalesChannelCrudEvent.load(id: $id)';
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
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            UserSalesChannelCreateReq userSalesChannelCreateReq)
        create,
    required TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id, List<String> productIds)
        deleteProducts,
    required TResult Function(String id, List<String> productIds) addProducts,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult? Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id, List<String> productIds)? deleteProducts,
    TResult? Function(String id, List<String> productIds)? addProducts,
  }) {
    return load?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id, List<String> productIds)? deleteProducts,
    TResult Function(String id, List<String> productIds)? addProducts,
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
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProducts value) deleteProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProducts value)? deleteProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProducts value)? deleteProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements SalesChannelCrudEvent {
  const factory _Load(final String id) = _$LoadImpl;

  String get id;
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
    extends _$SalesChannelCrudEventCopyWithImpl<$Res, _$LoadAllImpl>
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
    return 'SalesChannelCrudEvent.loadAll(queryParameters: $queryParameters)';
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
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            UserSalesChannelCreateReq userSalesChannelCreateReq)
        create,
    required TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id, List<String> productIds)
        deleteProducts,
    required TResult Function(String id, List<String> productIds) addProducts,
  }) {
    return loadAll(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult? Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id, List<String> productIds)? deleteProducts,
    TResult? Function(String id, List<String> productIds)? addProducts,
  }) {
    return loadAll?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id, List<String> productIds)? deleteProducts,
    TResult Function(String id, List<String> productIds)? addProducts,
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
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProducts value) deleteProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return loadAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProducts value)? deleteProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return loadAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProducts value)? deleteProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class _LoadAll implements SalesChannelCrudEvent {
  const factory _LoadAll({final Map<String, dynamic>? queryParameters}) =
      _$LoadAllImpl;

  Map<String, dynamic>? get queryParameters;
  @JsonKey(ignore: true)
  _$$LoadAllImplCopyWith<_$LoadAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserSalesChannelCreateReq userSalesChannelCreateReq});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$SalesChannelCrudEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSalesChannelCreateReq = null,
  }) {
    return _then(_$CreateImpl(
      null == userSalesChannelCreateReq
          ? _value.userSalesChannelCreateReq
          : userSalesChannelCreateReq // ignore: cast_nullable_to_non_nullable
              as UserSalesChannelCreateReq,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(this.userSalesChannelCreateReq);

  @override
  final UserSalesChannelCreateReq userSalesChannelCreateReq;

  @override
  String toString() {
    return 'SalesChannelCrudEvent.create(userSalesChannelCreateReq: $userSalesChannelCreateReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.userSalesChannelCreateReq,
                    userSalesChannelCreateReq) ||
                other.userSalesChannelCreateReq == userSalesChannelCreateReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userSalesChannelCreateReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            UserSalesChannelCreateReq userSalesChannelCreateReq)
        create,
    required TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id, List<String> productIds)
        deleteProducts,
    required TResult Function(String id, List<String> productIds) addProducts,
  }) {
    return create(userSalesChannelCreateReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult? Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id, List<String> productIds)? deleteProducts,
    TResult? Function(String id, List<String> productIds)? addProducts,
  }) {
    return create?.call(userSalesChannelCreateReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id, List<String> productIds)? deleteProducts,
    TResult Function(String id, List<String> productIds)? addProducts,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(userSalesChannelCreateReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProducts value) deleteProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProducts value)? deleteProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProducts value)? deleteProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements SalesChannelCrudEvent {
  const factory _Create(
      final UserSalesChannelCreateReq userSalesChannelCreateReq) = _$CreateImpl;

  UserSalesChannelCreateReq get userSalesChannelCreateReq;
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
  $Res call({String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$SalesChannelCrudEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userSalesChannelUpdateReq = null,
  }) {
    return _then(_$UpdateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userSalesChannelUpdateReq
          ? _value.userSalesChannelUpdateReq
          : userSalesChannelUpdateReq // ignore: cast_nullable_to_non_nullable
              as UserSalesChannelUpdateReq,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.id, this.userSalesChannelUpdateReq);

  @override
  final String id;
  @override
  final UserSalesChannelUpdateReq userSalesChannelUpdateReq;

  @override
  String toString() {
    return 'SalesChannelCrudEvent.update(id: $id, userSalesChannelUpdateReq: $userSalesChannelUpdateReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userSalesChannelUpdateReq,
                    userSalesChannelUpdateReq) ||
                other.userSalesChannelUpdateReq == userSalesChannelUpdateReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userSalesChannelUpdateReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            UserSalesChannelCreateReq userSalesChannelCreateReq)
        create,
    required TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id, List<String> productIds)
        deleteProducts,
    required TResult Function(String id, List<String> productIds) addProducts,
  }) {
    return update(id, userSalesChannelUpdateReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult? Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id, List<String> productIds)? deleteProducts,
    TResult? Function(String id, List<String> productIds)? addProducts,
  }) {
    return update?.call(id, userSalesChannelUpdateReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id, List<String> productIds)? deleteProducts,
    TResult Function(String id, List<String> productIds)? addProducts,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, userSalesChannelUpdateReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProducts value) deleteProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProducts value)? deleteProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProducts value)? deleteProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements SalesChannelCrudEvent {
  const factory _Update(final String id,
      final UserSalesChannelUpdateReq userSalesChannelUpdateReq) = _$UpdateImpl;

  String get id;
  UserSalesChannelUpdateReq get userSalesChannelUpdateReq;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
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
    extends _$SalesChannelCrudEventCopyWithImpl<$Res, _$DeleteImpl>
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
    return 'SalesChannelCrudEvent.delete(id: $id)';
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
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            UserSalesChannelCreateReq userSalesChannelCreateReq)
        create,
    required TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id, List<String> productIds)
        deleteProducts,
    required TResult Function(String id, List<String> productIds) addProducts,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult? Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id, List<String> productIds)? deleteProducts,
    TResult? Function(String id, List<String> productIds)? addProducts,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id, List<String> productIds)? deleteProducts,
    TResult Function(String id, List<String> productIds)? addProducts,
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
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProducts value) deleteProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProducts value)? deleteProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProducts value)? deleteProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements SalesChannelCrudEvent {
  const factory _Delete(final String id) = _$DeleteImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteProductsImplCopyWith<$Res> {
  factory _$$DeleteProductsImplCopyWith(_$DeleteProductsImpl value,
          $Res Function(_$DeleteProductsImpl) then) =
      __$$DeleteProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, List<String> productIds});
}

/// @nodoc
class __$$DeleteProductsImplCopyWithImpl<$Res>
    extends _$SalesChannelCrudEventCopyWithImpl<$Res, _$DeleteProductsImpl>
    implements _$$DeleteProductsImplCopyWith<$Res> {
  __$$DeleteProductsImplCopyWithImpl(
      _$DeleteProductsImpl _value, $Res Function(_$DeleteProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productIds = null,
  }) {
    return _then(_$DeleteProductsImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == productIds
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$DeleteProductsImpl implements _DeleteProducts {
  const _$DeleteProductsImpl(this.id, final List<String> productIds)
      : _productIds = productIds;

  @override
  final String id;
  final List<String> _productIds;
  @override
  List<String> get productIds {
    if (_productIds is EqualUnmodifiableListView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productIds);
  }

  @override
  String toString() {
    return 'SalesChannelCrudEvent.deleteProducts(id: $id, productIds: $productIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteProductsImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_productIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteProductsImplCopyWith<_$DeleteProductsImpl> get copyWith =>
      __$$DeleteProductsImplCopyWithImpl<_$DeleteProductsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            UserSalesChannelCreateReq userSalesChannelCreateReq)
        create,
    required TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id, List<String> productIds)
        deleteProducts,
    required TResult Function(String id, List<String> productIds) addProducts,
  }) {
    return deleteProducts(id, productIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult? Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id, List<String> productIds)? deleteProducts,
    TResult? Function(String id, List<String> productIds)? addProducts,
  }) {
    return deleteProducts?.call(id, productIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id, List<String> productIds)? deleteProducts,
    TResult Function(String id, List<String> productIds)? addProducts,
    required TResult orElse(),
  }) {
    if (deleteProducts != null) {
      return deleteProducts(id, productIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProducts value) deleteProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return deleteProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProducts value)? deleteProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return deleteProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProducts value)? deleteProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (deleteProducts != null) {
      return deleteProducts(this);
    }
    return orElse();
  }
}

abstract class _DeleteProducts implements SalesChannelCrudEvent {
  const factory _DeleteProducts(
      final String id, final List<String> productIds) = _$DeleteProductsImpl;

  String get id;
  List<String> get productIds;
  @JsonKey(ignore: true)
  _$$DeleteProductsImplCopyWith<_$DeleteProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddProductsImplCopyWith<$Res> {
  factory _$$AddProductsImplCopyWith(
          _$AddProductsImpl value, $Res Function(_$AddProductsImpl) then) =
      __$$AddProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, List<String> productIds});
}

/// @nodoc
class __$$AddProductsImplCopyWithImpl<$Res>
    extends _$SalesChannelCrudEventCopyWithImpl<$Res, _$AddProductsImpl>
    implements _$$AddProductsImplCopyWith<$Res> {
  __$$AddProductsImplCopyWithImpl(
      _$AddProductsImpl _value, $Res Function(_$AddProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productIds = null,
  }) {
    return _then(_$AddProductsImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == productIds
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AddProductsImpl implements _AddProducts {
  const _$AddProductsImpl(this.id, final List<String> productIds)
      : _productIds = productIds;

  @override
  final String id;
  final List<String> _productIds;
  @override
  List<String> get productIds {
    if (_productIds is EqualUnmodifiableListView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productIds);
  }

  @override
  String toString() {
    return 'SalesChannelCrudEvent.addProducts(id: $id, productIds: $productIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductsImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_productIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductsImplCopyWith<_$AddProductsImpl> get copyWith =>
      __$$AddProductsImplCopyWithImpl<_$AddProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            UserSalesChannelCreateReq userSalesChannelCreateReq)
        create,
    required TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id, List<String> productIds)
        deleteProducts,
    required TResult Function(String id, List<String> productIds) addProducts,
  }) {
    return addProducts(id, productIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult? Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id, List<String> productIds)? deleteProducts,
    TResult? Function(String id, List<String> productIds)? addProducts,
  }) {
    return addProducts?.call(id, productIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(UserSalesChannelCreateReq userSalesChannelCreateReq)?
        create,
    TResult Function(
            String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id, List<String> productIds)? deleteProducts,
    TResult Function(String id, List<String> productIds)? addProducts,
    required TResult orElse(),
  }) {
    if (addProducts != null) {
      return addProducts(id, productIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteProducts value) deleteProducts,
    required TResult Function(_AddProducts value) addProducts,
  }) {
    return addProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteProducts value)? deleteProducts,
    TResult? Function(_AddProducts value)? addProducts,
  }) {
    return addProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteProducts value)? deleteProducts,
    TResult Function(_AddProducts value)? addProducts,
    required TResult orElse(),
  }) {
    if (addProducts != null) {
      return addProducts(this);
    }
    return orElse();
  }
}

abstract class _AddProducts implements SalesChannelCrudEvent {
  const factory _AddProducts(final String id, final List<String> productIds) =
      _$AddProductsImpl;

  String get id;
  List<String> get productIds;
  @JsonKey(ignore: true)
  _$$AddProductsImplCopyWith<_$AddProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesChannelCrudState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SalesChannel salesChannel) salesChannel,
    required TResult Function(List<SalesChannel> salesChannels, int count)
        salesChannels,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SalesChannel salesChannel)? salesChannel,
    TResult? Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SalesChannel salesChannel)? salesChannel,
    TResult Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SalesChannel value) salesChannel,
    required TResult Function(_SalesChannels value) salesChannels,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesChannel value)? salesChannel,
    TResult? Function(_SalesChannels value)? salesChannels,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesChannel value)? salesChannel,
    TResult Function(_SalesChannels value)? salesChannels,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesChannelCrudStateCopyWith<$Res> {
  factory $SalesChannelCrudStateCopyWith(SalesChannelCrudState value,
          $Res Function(SalesChannelCrudState) then) =
      _$SalesChannelCrudStateCopyWithImpl<$Res, SalesChannelCrudState>;
}

/// @nodoc
class _$SalesChannelCrudStateCopyWithImpl<$Res,
        $Val extends SalesChannelCrudState>
    implements $SalesChannelCrudStateCopyWith<$Res> {
  _$SalesChannelCrudStateCopyWithImpl(this._value, this._then);

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
    extends _$SalesChannelCrudStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'SalesChannelCrudState.initial()';
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
    required TResult Function(SalesChannel salesChannel) salesChannel,
    required TResult Function(List<SalesChannel> salesChannels, int count)
        salesChannels,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SalesChannel salesChannel)? salesChannel,
    TResult? Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SalesChannel salesChannel)? salesChannel,
    TResult Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
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
    required TResult Function(_SalesChannel value) salesChannel,
    required TResult Function(_SalesChannels value) salesChannels,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesChannel value)? salesChannel,
    TResult? Function(_SalesChannels value)? salesChannels,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesChannel value)? salesChannel,
    TResult Function(_SalesChannels value)? salesChannels,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SalesChannelCrudState {
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
    extends _$SalesChannelCrudStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'SalesChannelCrudState.loading()';
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
    required TResult Function(SalesChannel salesChannel) salesChannel,
    required TResult Function(List<SalesChannel> salesChannels, int count)
        salesChannels,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SalesChannel salesChannel)? salesChannel,
    TResult? Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SalesChannel salesChannel)? salesChannel,
    TResult Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
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
    required TResult Function(_SalesChannel value) salesChannel,
    required TResult Function(_SalesChannels value) salesChannels,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesChannel value)? salesChannel,
    TResult? Function(_SalesChannels value)? salesChannels,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesChannel value)? salesChannel,
    TResult Function(_SalesChannels value)? salesChannels,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SalesChannelCrudState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SalesChannelImplCopyWith<$Res> {
  factory _$$SalesChannelImplCopyWith(
          _$SalesChannelImpl value, $Res Function(_$SalesChannelImpl) then) =
      __$$SalesChannelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesChannel salesChannel});
}

/// @nodoc
class __$$SalesChannelImplCopyWithImpl<$Res>
    extends _$SalesChannelCrudStateCopyWithImpl<$Res, _$SalesChannelImpl>
    implements _$$SalesChannelImplCopyWith<$Res> {
  __$$SalesChannelImplCopyWithImpl(
      _$SalesChannelImpl _value, $Res Function(_$SalesChannelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesChannel = null,
  }) {
    return _then(_$SalesChannelImpl(
      null == salesChannel
          ? _value.salesChannel
          : salesChannel // ignore: cast_nullable_to_non_nullable
              as SalesChannel,
    ));
  }
}

/// @nodoc

class _$SalesChannelImpl implements _SalesChannel {
  const _$SalesChannelImpl(this.salesChannel);

  @override
  final SalesChannel salesChannel;

  @override
  String toString() {
    return 'SalesChannelCrudState.salesChannel(salesChannel: $salesChannel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesChannelImpl &&
            (identical(other.salesChannel, salesChannel) ||
                other.salesChannel == salesChannel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesChannel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesChannelImplCopyWith<_$SalesChannelImpl> get copyWith =>
      __$$SalesChannelImplCopyWithImpl<_$SalesChannelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SalesChannel salesChannel) salesChannel,
    required TResult Function(List<SalesChannel> salesChannels, int count)
        salesChannels,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return salesChannel(this.salesChannel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SalesChannel salesChannel)? salesChannel,
    TResult? Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return salesChannel?.call(this.salesChannel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SalesChannel salesChannel)? salesChannel,
    TResult Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (salesChannel != null) {
      return salesChannel(this.salesChannel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SalesChannel value) salesChannel,
    required TResult Function(_SalesChannels value) salesChannels,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return salesChannel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesChannel value)? salesChannel,
    TResult? Function(_SalesChannels value)? salesChannels,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return salesChannel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesChannel value)? salesChannel,
    TResult Function(_SalesChannels value)? salesChannels,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (salesChannel != null) {
      return salesChannel(this);
    }
    return orElse();
  }
}

abstract class _SalesChannel implements SalesChannelCrudState {
  const factory _SalesChannel(final SalesChannel salesChannel) =
      _$SalesChannelImpl;

  SalesChannel get salesChannel;
  @JsonKey(ignore: true)
  _$$SalesChannelImplCopyWith<_$SalesChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SalesChannelsImplCopyWith<$Res> {
  factory _$$SalesChannelsImplCopyWith(
          _$SalesChannelsImpl value, $Res Function(_$SalesChannelsImpl) then) =
      __$$SalesChannelsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SalesChannel> salesChannels, int count});
}

/// @nodoc
class __$$SalesChannelsImplCopyWithImpl<$Res>
    extends _$SalesChannelCrudStateCopyWithImpl<$Res, _$SalesChannelsImpl>
    implements _$$SalesChannelsImplCopyWith<$Res> {
  __$$SalesChannelsImplCopyWithImpl(
      _$SalesChannelsImpl _value, $Res Function(_$SalesChannelsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesChannels = null,
    Object? count = null,
  }) {
    return _then(_$SalesChannelsImpl(
      null == salesChannels
          ? _value._salesChannels
          : salesChannels // ignore: cast_nullable_to_non_nullable
              as List<SalesChannel>,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SalesChannelsImpl implements _SalesChannels {
  const _$SalesChannelsImpl(final List<SalesChannel> salesChannels, this.count)
      : _salesChannels = salesChannels;

  final List<SalesChannel> _salesChannels;
  @override
  List<SalesChannel> get salesChannels {
    if (_salesChannels is EqualUnmodifiableListView) return _salesChannels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesChannels);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'SalesChannelCrudState.salesChannels(salesChannels: $salesChannels, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesChannelsImpl &&
            const DeepCollectionEquality()
                .equals(other._salesChannels, _salesChannels) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_salesChannels), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesChannelsImplCopyWith<_$SalesChannelsImpl> get copyWith =>
      __$$SalesChannelsImplCopyWithImpl<_$SalesChannelsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SalesChannel salesChannel) salesChannel,
    required TResult Function(List<SalesChannel> salesChannels, int count)
        salesChannels,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return salesChannels(this.salesChannels, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SalesChannel salesChannel)? salesChannel,
    TResult? Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return salesChannels?.call(this.salesChannels, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SalesChannel salesChannel)? salesChannel,
    TResult Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (salesChannels != null) {
      return salesChannels(this.salesChannels, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SalesChannel value) salesChannel,
    required TResult Function(_SalesChannels value) salesChannels,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return salesChannels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesChannel value)? salesChannel,
    TResult? Function(_SalesChannels value)? salesChannels,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return salesChannels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesChannel value)? salesChannel,
    TResult Function(_SalesChannels value)? salesChannels,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (salesChannels != null) {
      return salesChannels(this);
    }
    return orElse();
  }
}

abstract class _SalesChannels implements SalesChannelCrudState {
  const factory _SalesChannels(
          final List<SalesChannel> salesChannels, final int count) =
      _$SalesChannelsImpl;

  List<SalesChannel> get salesChannels;
  int get count;
  @JsonKey(ignore: true)
  _$$SalesChannelsImplCopyWith<_$SalesChannelsImpl> get copyWith =>
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
    extends _$SalesChannelCrudStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'SalesChannelCrudState.error(failure: $failure)';
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
    required TResult Function(SalesChannel salesChannel) salesChannel,
    required TResult Function(List<SalesChannel> salesChannels, int count)
        salesChannels,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SalesChannel salesChannel)? salesChannel,
    TResult? Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SalesChannel salesChannel)? salesChannel,
    TResult Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
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
    required TResult Function(_SalesChannel value) salesChannel,
    required TResult Function(_SalesChannels value) salesChannels,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesChannel value)? salesChannel,
    TResult? Function(_SalesChannels value)? salesChannels,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesChannel value)? salesChannel,
    TResult Function(_SalesChannels value)? salesChannels,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SalesChannelCrudState {
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
    extends _$SalesChannelCrudStateCopyWithImpl<$Res, _$DeletedImpl>
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
    return 'SalesChannelCrudState.deleted()';
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
    required TResult Function(SalesChannel salesChannel) salesChannel,
    required TResult Function(List<SalesChannel> salesChannels, int count)
        salesChannels,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SalesChannel salesChannel)? salesChannel,
    TResult? Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SalesChannel salesChannel)? salesChannel,
    TResult Function(List<SalesChannel> salesChannels, int count)?
        salesChannels,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
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
    required TResult Function(_SalesChannel value) salesChannel,
    required TResult Function(_SalesChannels value) salesChannels,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesChannel value)? salesChannel,
    TResult? Function(_SalesChannels value)? salesChannels,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesChannel value)? salesChannel,
    TResult Function(_SalesChannels value)? salesChannels,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements SalesChannelCrudState {
  const factory _Deleted() = _$DeletedImpl;
}
