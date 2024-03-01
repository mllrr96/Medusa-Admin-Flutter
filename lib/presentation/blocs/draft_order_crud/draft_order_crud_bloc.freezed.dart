// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_order_crud_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DraftOrderCrudEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)
        create,
    required TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)
        update,
    required TResult Function(String id) registerPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult? Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult? Function(String id)? registerPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult Function(String id)? registerPayment,
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
    required TResult Function(_RegisterPayment value) registerPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterPayment value)? registerPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterPayment value)? registerPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftOrderCrudEventCopyWith<$Res> {
  factory $DraftOrderCrudEventCopyWith(
          DraftOrderCrudEvent value, $Res Function(DraftOrderCrudEvent) then) =
      _$DraftOrderCrudEventCopyWithImpl<$Res, DraftOrderCrudEvent>;
}

/// @nodoc
class _$DraftOrderCrudEventCopyWithImpl<$Res, $Val extends DraftOrderCrudEvent>
    implements $DraftOrderCrudEventCopyWith<$Res> {
  _$DraftOrderCrudEventCopyWithImpl(this._value, this._then);

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
    extends _$DraftOrderCrudEventCopyWithImpl<$Res, _$LoadImpl>
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
    return 'DraftOrderCrudEvent.load(id: $id, queryParameters: $queryParameters)';
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
    required TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)
        create,
    required TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)
        update,
    required TResult Function(String id) registerPayment,
  }) {
    return load(id, queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult? Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult? Function(String id)? registerPayment,
  }) {
    return load?.call(id, queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult Function(String id)? registerPayment,
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
    required TResult Function(_RegisterPayment value) registerPayment,
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
    TResult? Function(_RegisterPayment value)? registerPayment,
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
    TResult Function(_RegisterPayment value)? registerPayment,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements DraftOrderCrudEvent {
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
    extends _$DraftOrderCrudEventCopyWithImpl<$Res, _$LoadAllImpl>
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
    return 'DraftOrderCrudEvent.loadAll(queryParameters: $queryParameters)';
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
    required TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)
        create,
    required TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)
        update,
    required TResult Function(String id) registerPayment,
  }) {
    return loadAll(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult? Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult? Function(String id)? registerPayment,
  }) {
    return loadAll?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult Function(String id)? registerPayment,
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
    required TResult Function(_RegisterPayment value) registerPayment,
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
    TResult? Function(_RegisterPayment value)? registerPayment,
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
    TResult Function(_RegisterPayment value)? registerPayment,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class _LoadAll implements DraftOrderCrudEvent {
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
    extends _$DraftOrderCrudEventCopyWithImpl<$Res, _$DeleteImpl>
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
    return 'DraftOrderCrudEvent.delete(id: $id)';
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
    required TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)
        create,
    required TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)
        update,
    required TResult Function(String id) registerPayment,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult? Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult? Function(String id)? registerPayment,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult Function(String id)? registerPayment,
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
    required TResult Function(_RegisterPayment value) registerPayment,
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
    TResult? Function(_RegisterPayment value)? registerPayment,
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
    TResult Function(_RegisterPayment value)? registerPayment,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements DraftOrderCrudEvent {
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
  $Res call({UserCreateDraftOrderReq userCreateDraftOrderReq});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$DraftOrderCrudEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCreateDraftOrderReq = null,
  }) {
    return _then(_$CreateImpl(
      null == userCreateDraftOrderReq
          ? _value.userCreateDraftOrderReq
          : userCreateDraftOrderReq // ignore: cast_nullable_to_non_nullable
              as UserCreateDraftOrderReq,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(this.userCreateDraftOrderReq);

  @override
  final UserCreateDraftOrderReq userCreateDraftOrderReq;

  @override
  String toString() {
    return 'DraftOrderCrudEvent.create(userCreateDraftOrderReq: $userCreateDraftOrderReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(
                    other.userCreateDraftOrderReq, userCreateDraftOrderReq) ||
                other.userCreateDraftOrderReq == userCreateDraftOrderReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCreateDraftOrderReq);

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
    required TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)
        create,
    required TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)
        update,
    required TResult Function(String id) registerPayment,
  }) {
    return create(userCreateDraftOrderReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult? Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult? Function(String id)? registerPayment,
  }) {
    return create?.call(userCreateDraftOrderReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult Function(String id)? registerPayment,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(userCreateDraftOrderReq);
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
    required TResult Function(_RegisterPayment value) registerPayment,
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
    TResult? Function(_RegisterPayment value)? registerPayment,
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
    TResult Function(_RegisterPayment value)? registerPayment,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements DraftOrderCrudEvent {
  const factory _Create(final UserCreateDraftOrderReq userCreateDraftOrderReq) =
      _$CreateImpl;

  UserCreateDraftOrderReq get userCreateDraftOrderReq;
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
  $Res call({String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$DraftOrderCrudEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userUpdateDraftOrderReq = null,
  }) {
    return _then(_$UpdateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userUpdateDraftOrderReq
          ? _value.userUpdateDraftOrderReq
          : userUpdateDraftOrderReq // ignore: cast_nullable_to_non_nullable
              as UserUpdateDraftOrderReq,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.id, this.userUpdateDraftOrderReq);

  @override
  final String id;
  @override
  final UserUpdateDraftOrderReq userUpdateDraftOrderReq;

  @override
  String toString() {
    return 'DraftOrderCrudEvent.update(id: $id, userUpdateDraftOrderReq: $userUpdateDraftOrderReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(
                    other.userUpdateDraftOrderReq, userUpdateDraftOrderReq) ||
                other.userUpdateDraftOrderReq == userUpdateDraftOrderReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userUpdateDraftOrderReq);

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
    required TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)
        create,
    required TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)
        update,
    required TResult Function(String id) registerPayment,
  }) {
    return update(id, userUpdateDraftOrderReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult? Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult? Function(String id)? registerPayment,
  }) {
    return update?.call(id, userUpdateDraftOrderReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult Function(String id)? registerPayment,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, userUpdateDraftOrderReq);
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
    required TResult Function(_RegisterPayment value) registerPayment,
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
    TResult? Function(_RegisterPayment value)? registerPayment,
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
    TResult Function(_RegisterPayment value)? registerPayment,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements DraftOrderCrudEvent {
  const factory _Update(final String id,
      final UserUpdateDraftOrderReq userUpdateDraftOrderReq) = _$UpdateImpl;

  String get id;
  UserUpdateDraftOrderReq get userUpdateDraftOrderReq;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterPaymentImplCopyWith<$Res> {
  factory _$$RegisterPaymentImplCopyWith(_$RegisterPaymentImpl value,
          $Res Function(_$RegisterPaymentImpl) then) =
      __$$RegisterPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RegisterPaymentImplCopyWithImpl<$Res>
    extends _$DraftOrderCrudEventCopyWithImpl<$Res, _$RegisterPaymentImpl>
    implements _$$RegisterPaymentImplCopyWith<$Res> {
  __$$RegisterPaymentImplCopyWithImpl(
      _$RegisterPaymentImpl _value, $Res Function(_$RegisterPaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RegisterPaymentImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterPaymentImpl implements _RegisterPayment {
  const _$RegisterPaymentImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'DraftOrderCrudEvent.registerPayment(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPaymentImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPaymentImplCopyWith<_$RegisterPaymentImpl> get copyWith =>
      __$$RegisterPaymentImplCopyWithImpl<_$RegisterPaymentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)
        create,
    required TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)
        update,
    required TResult Function(String id) registerPayment,
  }) {
    return registerPayment(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult? Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult? Function(String id)? registerPayment,
  }) {
    return registerPayment?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(UserCreateDraftOrderReq userCreateDraftOrderReq)? create,
    TResult Function(
            String id, UserUpdateDraftOrderReq userUpdateDraftOrderReq)?
        update,
    TResult Function(String id)? registerPayment,
    required TResult orElse(),
  }) {
    if (registerPayment != null) {
      return registerPayment(id);
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
    required TResult Function(_RegisterPayment value) registerPayment,
  }) {
    return registerPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterPayment value)? registerPayment,
  }) {
    return registerPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterPayment value)? registerPayment,
    required TResult orElse(),
  }) {
    if (registerPayment != null) {
      return registerPayment(this);
    }
    return orElse();
  }
}

abstract class _RegisterPayment implements DraftOrderCrudEvent {
  const factory _RegisterPayment(final String id) = _$RegisterPaymentImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$RegisterPaymentImplCopyWith<_$RegisterPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DraftOrderCrudState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paymentRegistered,
    required TResult Function(DraftOrder draftOrder) draftOrder,
    required TResult Function(List<DraftOrder> draftOrders, int count)
        draftOrders,
    required TResult Function(Failure error) error,
    required TResult Function() deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? paymentRegistered,
    TResult? Function(DraftOrder draftOrder)? draftOrder,
    TResult? Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult? Function(Failure error)? error,
    TResult? Function()? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paymentRegistered,
    TResult Function(DraftOrder draftOrder)? draftOrder,
    TResult Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult Function(Failure error)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PaymentRegistered value) paymentRegistered,
    required TResult Function(_DraftOrder value) draftOrder,
    required TResult Function(_DraftOrders value) draftOrders,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PaymentRegistered value)? paymentRegistered,
    TResult? Function(_DraftOrder value)? draftOrder,
    TResult? Function(_DraftOrders value)? draftOrders,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PaymentRegistered value)? paymentRegistered,
    TResult Function(_DraftOrder value)? draftOrder,
    TResult Function(_DraftOrders value)? draftOrders,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftOrderCrudStateCopyWith<$Res> {
  factory $DraftOrderCrudStateCopyWith(
          DraftOrderCrudState value, $Res Function(DraftOrderCrudState) then) =
      _$DraftOrderCrudStateCopyWithImpl<$Res, DraftOrderCrudState>;
}

/// @nodoc
class _$DraftOrderCrudStateCopyWithImpl<$Res, $Val extends DraftOrderCrudState>
    implements $DraftOrderCrudStateCopyWith<$Res> {
  _$DraftOrderCrudStateCopyWithImpl(this._value, this._then);

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
    extends _$DraftOrderCrudStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'DraftOrderCrudState.initial()';
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
    required TResult Function() paymentRegistered,
    required TResult Function(DraftOrder draftOrder) draftOrder,
    required TResult Function(List<DraftOrder> draftOrders, int count)
        draftOrders,
    required TResult Function(Failure error) error,
    required TResult Function() deleted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? paymentRegistered,
    TResult? Function(DraftOrder draftOrder)? draftOrder,
    TResult? Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult? Function(Failure error)? error,
    TResult? Function()? deleted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paymentRegistered,
    TResult Function(DraftOrder draftOrder)? draftOrder,
    TResult Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult Function(Failure error)? error,
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
    required TResult Function(_PaymentRegistered value) paymentRegistered,
    required TResult Function(_DraftOrder value) draftOrder,
    required TResult Function(_DraftOrders value) draftOrders,
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
    TResult? Function(_PaymentRegistered value)? paymentRegistered,
    TResult? Function(_DraftOrder value)? draftOrder,
    TResult? Function(_DraftOrders value)? draftOrders,
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
    TResult Function(_PaymentRegistered value)? paymentRegistered,
    TResult Function(_DraftOrder value)? draftOrder,
    TResult Function(_DraftOrders value)? draftOrders,
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

abstract class _Initial implements DraftOrderCrudState {
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
    extends _$DraftOrderCrudStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'DraftOrderCrudState.loading()';
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
    required TResult Function() paymentRegistered,
    required TResult Function(DraftOrder draftOrder) draftOrder,
    required TResult Function(List<DraftOrder> draftOrders, int count)
        draftOrders,
    required TResult Function(Failure error) error,
    required TResult Function() deleted,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? paymentRegistered,
    TResult? Function(DraftOrder draftOrder)? draftOrder,
    TResult? Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult? Function(Failure error)? error,
    TResult? Function()? deleted,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paymentRegistered,
    TResult Function(DraftOrder draftOrder)? draftOrder,
    TResult Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult Function(Failure error)? error,
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
    required TResult Function(_PaymentRegistered value) paymentRegistered,
    required TResult Function(_DraftOrder value) draftOrder,
    required TResult Function(_DraftOrders value) draftOrders,
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
    TResult? Function(_PaymentRegistered value)? paymentRegistered,
    TResult? Function(_DraftOrder value)? draftOrder,
    TResult? Function(_DraftOrders value)? draftOrders,
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
    TResult Function(_PaymentRegistered value)? paymentRegistered,
    TResult Function(_DraftOrder value)? draftOrder,
    TResult Function(_DraftOrders value)? draftOrders,
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

abstract class _Loading implements DraftOrderCrudState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$PaymentRegisteredImplCopyWith<$Res> {
  factory _$$PaymentRegisteredImplCopyWith(_$PaymentRegisteredImpl value,
          $Res Function(_$PaymentRegisteredImpl) then) =
      __$$PaymentRegisteredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentRegisteredImplCopyWithImpl<$Res>
    extends _$DraftOrderCrudStateCopyWithImpl<$Res, _$PaymentRegisteredImpl>
    implements _$$PaymentRegisteredImplCopyWith<$Res> {
  __$$PaymentRegisteredImplCopyWithImpl(_$PaymentRegisteredImpl _value,
      $Res Function(_$PaymentRegisteredImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PaymentRegisteredImpl implements _PaymentRegistered {
  const _$PaymentRegisteredImpl();

  @override
  String toString() {
    return 'DraftOrderCrudState.paymentRegistered()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentRegisteredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paymentRegistered,
    required TResult Function(DraftOrder draftOrder) draftOrder,
    required TResult Function(List<DraftOrder> draftOrders, int count)
        draftOrders,
    required TResult Function(Failure error) error,
    required TResult Function() deleted,
  }) {
    return paymentRegistered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? paymentRegistered,
    TResult? Function(DraftOrder draftOrder)? draftOrder,
    TResult? Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult? Function(Failure error)? error,
    TResult? Function()? deleted,
  }) {
    return paymentRegistered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paymentRegistered,
    TResult Function(DraftOrder draftOrder)? draftOrder,
    TResult Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult Function(Failure error)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (paymentRegistered != null) {
      return paymentRegistered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PaymentRegistered value) paymentRegistered,
    required TResult Function(_DraftOrder value) draftOrder,
    required TResult Function(_DraftOrders value) draftOrders,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return paymentRegistered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PaymentRegistered value)? paymentRegistered,
    TResult? Function(_DraftOrder value)? draftOrder,
    TResult? Function(_DraftOrders value)? draftOrders,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return paymentRegistered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PaymentRegistered value)? paymentRegistered,
    TResult Function(_DraftOrder value)? draftOrder,
    TResult Function(_DraftOrders value)? draftOrders,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (paymentRegistered != null) {
      return paymentRegistered(this);
    }
    return orElse();
  }
}

abstract class _PaymentRegistered implements DraftOrderCrudState {
  const factory _PaymentRegistered() = _$PaymentRegisteredImpl;
}

/// @nodoc
abstract class _$$DraftOrderImplCopyWith<$Res> {
  factory _$$DraftOrderImplCopyWith(
          _$DraftOrderImpl value, $Res Function(_$DraftOrderImpl) then) =
      __$$DraftOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DraftOrder draftOrder});
}

/// @nodoc
class __$$DraftOrderImplCopyWithImpl<$Res>
    extends _$DraftOrderCrudStateCopyWithImpl<$Res, _$DraftOrderImpl>
    implements _$$DraftOrderImplCopyWith<$Res> {
  __$$DraftOrderImplCopyWithImpl(
      _$DraftOrderImpl _value, $Res Function(_$DraftOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftOrder = null,
  }) {
    return _then(_$DraftOrderImpl(
      null == draftOrder
          ? _value.draftOrder
          : draftOrder // ignore: cast_nullable_to_non_nullable
              as DraftOrder,
    ));
  }
}

/// @nodoc

class _$DraftOrderImpl implements _DraftOrder {
  const _$DraftOrderImpl(this.draftOrder);

  @override
  final DraftOrder draftOrder;

  @override
  String toString() {
    return 'DraftOrderCrudState.draftOrder(draftOrder: $draftOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftOrderImpl &&
            (identical(other.draftOrder, draftOrder) ||
                other.draftOrder == draftOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draftOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftOrderImplCopyWith<_$DraftOrderImpl> get copyWith =>
      __$$DraftOrderImplCopyWithImpl<_$DraftOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paymentRegistered,
    required TResult Function(DraftOrder draftOrder) draftOrder,
    required TResult Function(List<DraftOrder> draftOrders, int count)
        draftOrders,
    required TResult Function(Failure error) error,
    required TResult Function() deleted,
  }) {
    return draftOrder(this.draftOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? paymentRegistered,
    TResult? Function(DraftOrder draftOrder)? draftOrder,
    TResult? Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult? Function(Failure error)? error,
    TResult? Function()? deleted,
  }) {
    return draftOrder?.call(this.draftOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paymentRegistered,
    TResult Function(DraftOrder draftOrder)? draftOrder,
    TResult Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult Function(Failure error)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (draftOrder != null) {
      return draftOrder(this.draftOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PaymentRegistered value) paymentRegistered,
    required TResult Function(_DraftOrder value) draftOrder,
    required TResult Function(_DraftOrders value) draftOrders,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return draftOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PaymentRegistered value)? paymentRegistered,
    TResult? Function(_DraftOrder value)? draftOrder,
    TResult? Function(_DraftOrders value)? draftOrders,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return draftOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PaymentRegistered value)? paymentRegistered,
    TResult Function(_DraftOrder value)? draftOrder,
    TResult Function(_DraftOrders value)? draftOrders,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (draftOrder != null) {
      return draftOrder(this);
    }
    return orElse();
  }
}

abstract class _DraftOrder implements DraftOrderCrudState {
  const factory _DraftOrder(final DraftOrder draftOrder) = _$DraftOrderImpl;

  DraftOrder get draftOrder;
  @JsonKey(ignore: true)
  _$$DraftOrderImplCopyWith<_$DraftOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DraftOrdersImplCopyWith<$Res> {
  factory _$$DraftOrdersImplCopyWith(
          _$DraftOrdersImpl value, $Res Function(_$DraftOrdersImpl) then) =
      __$$DraftOrdersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DraftOrder> draftOrders, int count});
}

/// @nodoc
class __$$DraftOrdersImplCopyWithImpl<$Res>
    extends _$DraftOrderCrudStateCopyWithImpl<$Res, _$DraftOrdersImpl>
    implements _$$DraftOrdersImplCopyWith<$Res> {
  __$$DraftOrdersImplCopyWithImpl(
      _$DraftOrdersImpl _value, $Res Function(_$DraftOrdersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftOrders = null,
    Object? count = null,
  }) {
    return _then(_$DraftOrdersImpl(
      null == draftOrders
          ? _value._draftOrders
          : draftOrders // ignore: cast_nullable_to_non_nullable
              as List<DraftOrder>,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DraftOrdersImpl implements _DraftOrders {
  const _$DraftOrdersImpl(final List<DraftOrder> draftOrders, this.count)
      : _draftOrders = draftOrders;

  final List<DraftOrder> _draftOrders;
  @override
  List<DraftOrder> get draftOrders {
    if (_draftOrders is EqualUnmodifiableListView) return _draftOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_draftOrders);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'DraftOrderCrudState.draftOrders(draftOrders: $draftOrders, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftOrdersImpl &&
            const DeepCollectionEquality()
                .equals(other._draftOrders, _draftOrders) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_draftOrders), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftOrdersImplCopyWith<_$DraftOrdersImpl> get copyWith =>
      __$$DraftOrdersImplCopyWithImpl<_$DraftOrdersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() paymentRegistered,
    required TResult Function(DraftOrder draftOrder) draftOrder,
    required TResult Function(List<DraftOrder> draftOrders, int count)
        draftOrders,
    required TResult Function(Failure error) error,
    required TResult Function() deleted,
  }) {
    return draftOrders(this.draftOrders, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? paymentRegistered,
    TResult? Function(DraftOrder draftOrder)? draftOrder,
    TResult? Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult? Function(Failure error)? error,
    TResult? Function()? deleted,
  }) {
    return draftOrders?.call(this.draftOrders, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paymentRegistered,
    TResult Function(DraftOrder draftOrder)? draftOrder,
    TResult Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult Function(Failure error)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (draftOrders != null) {
      return draftOrders(this.draftOrders, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PaymentRegistered value) paymentRegistered,
    required TResult Function(_DraftOrder value) draftOrder,
    required TResult Function(_DraftOrders value) draftOrders,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return draftOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PaymentRegistered value)? paymentRegistered,
    TResult? Function(_DraftOrder value)? draftOrder,
    TResult? Function(_DraftOrders value)? draftOrders,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return draftOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PaymentRegistered value)? paymentRegistered,
    TResult Function(_DraftOrder value)? draftOrder,
    TResult Function(_DraftOrders value)? draftOrders,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (draftOrders != null) {
      return draftOrders(this);
    }
    return orElse();
  }
}

abstract class _DraftOrders implements DraftOrderCrudState {
  const factory _DraftOrders(
      final List<DraftOrder> draftOrders, final int count) = _$DraftOrdersImpl;

  List<DraftOrder> get draftOrders;
  int get count;
  @JsonKey(ignore: true)
  _$$DraftOrdersImplCopyWith<_$DraftOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DraftOrderCrudStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final Failure error;

  @override
  String toString() {
    return 'DraftOrderCrudState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

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
    required TResult Function() paymentRegistered,
    required TResult Function(DraftOrder draftOrder) draftOrder,
    required TResult Function(List<DraftOrder> draftOrders, int count)
        draftOrders,
    required TResult Function(Failure error) error,
    required TResult Function() deleted,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? paymentRegistered,
    TResult? Function(DraftOrder draftOrder)? draftOrder,
    TResult? Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult? Function(Failure error)? error,
    TResult? Function()? deleted,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paymentRegistered,
    TResult Function(DraftOrder draftOrder)? draftOrder,
    TResult Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult Function(Failure error)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PaymentRegistered value) paymentRegistered,
    required TResult Function(_DraftOrder value) draftOrder,
    required TResult Function(_DraftOrders value) draftOrders,
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
    TResult? Function(_PaymentRegistered value)? paymentRegistered,
    TResult? Function(_DraftOrder value)? draftOrder,
    TResult? Function(_DraftOrders value)? draftOrders,
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
    TResult Function(_PaymentRegistered value)? paymentRegistered,
    TResult Function(_DraftOrder value)? draftOrder,
    TResult Function(_DraftOrders value)? draftOrders,
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

abstract class _Error implements DraftOrderCrudState {
  const factory _Error(final Failure error) = _$ErrorImpl;

  Failure get error;
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
    extends _$DraftOrderCrudStateCopyWithImpl<$Res, _$DeletedImpl>
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
    return 'DraftOrderCrudState.deleted()';
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
    required TResult Function() paymentRegistered,
    required TResult Function(DraftOrder draftOrder) draftOrder,
    required TResult Function(List<DraftOrder> draftOrders, int count)
        draftOrders,
    required TResult Function(Failure error) error,
    required TResult Function() deleted,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? paymentRegistered,
    TResult? Function(DraftOrder draftOrder)? draftOrder,
    TResult? Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult? Function(Failure error)? error,
    TResult? Function()? deleted,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? paymentRegistered,
    TResult Function(DraftOrder draftOrder)? draftOrder,
    TResult Function(List<DraftOrder> draftOrders, int count)? draftOrders,
    TResult Function(Failure error)? error,
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
    required TResult Function(_PaymentRegistered value) paymentRegistered,
    required TResult Function(_DraftOrder value) draftOrder,
    required TResult Function(_DraftOrders value) draftOrders,
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
    TResult? Function(_PaymentRegistered value)? paymentRegistered,
    TResult? Function(_DraftOrder value)? draftOrder,
    TResult? Function(_DraftOrders value)? draftOrders,
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
    TResult Function(_PaymentRegistered value)? paymentRegistered,
    TResult Function(_DraftOrder value)? draftOrder,
    TResult Function(_DraftOrders value)? draftOrders,
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

abstract class _Deleted implements DraftOrderCrudState {
  const factory _Deleted() = _$DeletedImpl;
}
