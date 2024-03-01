// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_card_crud_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GiftCardCrudEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            String id, UserUpdateGiftCardReq userUpdateGiftCardReq)
        update,
    required TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)
        create,
    required TResult Function(String id) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult? Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult? Function(String id)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult Function(String id)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardCrudEventCopyWith<$Res> {
  factory $GiftCardCrudEventCopyWith(
          GiftCardCrudEvent value, $Res Function(GiftCardCrudEvent) then) =
      _$GiftCardCrudEventCopyWithImpl<$Res, GiftCardCrudEvent>;
}

/// @nodoc
class _$GiftCardCrudEventCopyWithImpl<$Res, $Val extends GiftCardCrudEvent>
    implements $GiftCardCrudEventCopyWith<$Res> {
  _$GiftCardCrudEventCopyWithImpl(this._value, this._then);

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
    extends _$GiftCardCrudEventCopyWithImpl<$Res, _$LoadImpl>
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
    return 'GiftCardCrudEvent.load(id: $id)';
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
            String id, UserUpdateGiftCardReq userUpdateGiftCardReq)
        update,
    required TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)
        create,
    required TResult Function(String id) delete,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult? Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult? Function(String id)? delete,
  }) {
    return load?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult Function(String id)? delete,
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
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements GiftCardCrudEvent {
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
    extends _$GiftCardCrudEventCopyWithImpl<$Res, _$LoadAllImpl>
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
    return 'GiftCardCrudEvent.loadAll(queryParameters: $queryParameters)';
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
            String id, UserUpdateGiftCardReq userUpdateGiftCardReq)
        update,
    required TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)
        create,
    required TResult Function(String id) delete,
  }) {
    return loadAll(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult? Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult? Function(String id)? delete,
  }) {
    return loadAll?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult Function(String id)? delete,
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
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) {
    return loadAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) {
    return loadAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class _LoadAll implements GiftCardCrudEvent {
  const factory _LoadAll({final Map<String, dynamic>? queryParameters}) =
      _$LoadAllImpl;

  Map<String, dynamic>? get queryParameters;
  @JsonKey(ignore: true)
  _$$LoadAllImplCopyWith<_$LoadAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, UserUpdateGiftCardReq userUpdateGiftCardReq});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$GiftCardCrudEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userUpdateGiftCardReq = null,
  }) {
    return _then(_$UpdateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userUpdateGiftCardReq
          ? _value.userUpdateGiftCardReq
          : userUpdateGiftCardReq // ignore: cast_nullable_to_non_nullable
              as UserUpdateGiftCardReq,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.id, this.userUpdateGiftCardReq);

  @override
  final String id;
  @override
  final UserUpdateGiftCardReq userUpdateGiftCardReq;

  @override
  String toString() {
    return 'GiftCardCrudEvent.update(id: $id, userUpdateGiftCardReq: $userUpdateGiftCardReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userUpdateGiftCardReq, userUpdateGiftCardReq) ||
                other.userUpdateGiftCardReq == userUpdateGiftCardReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userUpdateGiftCardReq);

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
            String id, UserUpdateGiftCardReq userUpdateGiftCardReq)
        update,
    required TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)
        create,
    required TResult Function(String id) delete,
  }) {
    return update(id, userUpdateGiftCardReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult? Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult? Function(String id)? delete,
  }) {
    return update?.call(id, userUpdateGiftCardReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult Function(String id)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, userUpdateGiftCardReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements GiftCardCrudEvent {
  const factory _Update(
          final String id, final UserUpdateGiftCardReq userUpdateGiftCardReq) =
      _$UpdateImpl;

  String get id;
  UserUpdateGiftCardReq get userUpdateGiftCardReq;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCreateGiftCardReq userCreateGiftCardReq});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$GiftCardCrudEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCreateGiftCardReq = null,
  }) {
    return _then(_$CreateImpl(
      null == userCreateGiftCardReq
          ? _value.userCreateGiftCardReq
          : userCreateGiftCardReq // ignore: cast_nullable_to_non_nullable
              as UserCreateGiftCardReq,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(this.userCreateGiftCardReq);

  @override
  final UserCreateGiftCardReq userCreateGiftCardReq;

  @override
  String toString() {
    return 'GiftCardCrudEvent.create(userCreateGiftCardReq: $userCreateGiftCardReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.userCreateGiftCardReq, userCreateGiftCardReq) ||
                other.userCreateGiftCardReq == userCreateGiftCardReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCreateGiftCardReq);

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
            String id, UserUpdateGiftCardReq userUpdateGiftCardReq)
        update,
    required TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)
        create,
    required TResult Function(String id) delete,
  }) {
    return create(userCreateGiftCardReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult? Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult? Function(String id)? delete,
  }) {
    return create?.call(userCreateGiftCardReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult Function(String id)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(userCreateGiftCardReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements GiftCardCrudEvent {
  const factory _Create(final UserCreateGiftCardReq userCreateGiftCardReq) =
      _$CreateImpl;

  UserCreateGiftCardReq get userCreateGiftCardReq;
  @JsonKey(ignore: true)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
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
    extends _$GiftCardCrudEventCopyWithImpl<$Res, _$DeleteImpl>
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
    return 'GiftCardCrudEvent.delete(id: $id)';
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
            String id, UserUpdateGiftCardReq userUpdateGiftCardReq)
        update,
    required TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)
        create,
    required TResult Function(String id) delete,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult? Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult? Function(String id)? delete,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateGiftCardReq userUpdateGiftCardReq)?
        update,
    TResult Function(UserCreateGiftCardReq userCreateGiftCardReq)? create,
    TResult Function(String id)? delete,
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
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements GiftCardCrudEvent {
  const factory _Delete(final String id) = _$DeleteImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GiftCardCrudState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? id) loading,
    required TResult Function(GiftCard giftCard) giftCard,
    required TResult Function(List<GiftCard> giftCards, int count) giftCards,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(GiftCard giftCard)? giftCard,
    TResult? Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(GiftCard giftCard)? giftCard,
    TResult Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GiftCard value) giftCard,
    required TResult Function(_GiftCards value) giftCards,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_GiftCard value)? giftCard,
    TResult? Function(_GiftCards value)? giftCards,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GiftCard value)? giftCard,
    TResult Function(_GiftCards value)? giftCards,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardCrudStateCopyWith<$Res> {
  factory $GiftCardCrudStateCopyWith(
          GiftCardCrudState value, $Res Function(GiftCardCrudState) then) =
      _$GiftCardCrudStateCopyWithImpl<$Res, GiftCardCrudState>;
}

/// @nodoc
class _$GiftCardCrudStateCopyWithImpl<$Res, $Val extends GiftCardCrudState>
    implements $GiftCardCrudStateCopyWith<$Res> {
  _$GiftCardCrudStateCopyWithImpl(this._value, this._then);

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
    extends _$GiftCardCrudStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'GiftCardCrudState.initial()';
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
    required TResult Function(String? id) loading,
    required TResult Function(GiftCard giftCard) giftCard,
    required TResult Function(List<GiftCard> giftCards, int count) giftCards,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(GiftCard giftCard)? giftCard,
    TResult? Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(GiftCard giftCard)? giftCard,
    TResult Function(List<GiftCard> giftCards, int count)? giftCards,
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
    required TResult Function(_GiftCard value) giftCard,
    required TResult Function(_GiftCards value) giftCards,
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
    TResult? Function(_GiftCard value)? giftCard,
    TResult? Function(_GiftCards value)? giftCards,
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
    TResult Function(_GiftCard value)? giftCard,
    TResult Function(_GiftCards value)? giftCards,
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

abstract class _Initial implements GiftCardCrudState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GiftCardCrudStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$LoadingImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({this.id});

  @override
  final String? id;

  @override
  String toString() {
    return 'GiftCardCrudState.loading(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? id) loading,
    required TResult Function(GiftCard giftCard) giftCard,
    required TResult Function(List<GiftCard> giftCards, int count) giftCards,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return loading(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(GiftCard giftCard)? giftCard,
    TResult? Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return loading?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(GiftCard giftCard)? giftCard,
    TResult Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GiftCard value) giftCard,
    required TResult Function(_GiftCards value) giftCards,
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
    TResult? Function(_GiftCard value)? giftCard,
    TResult? Function(_GiftCards value)? giftCards,
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
    TResult Function(_GiftCard value)? giftCard,
    TResult Function(_GiftCards value)? giftCards,
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

abstract class _Loading implements GiftCardCrudState {
  const factory _Loading({final String? id}) = _$LoadingImpl;

  String? get id;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GiftCardImplCopyWith<$Res> {
  factory _$$GiftCardImplCopyWith(
          _$GiftCardImpl value, $Res Function(_$GiftCardImpl) then) =
      __$$GiftCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GiftCard giftCard});
}

/// @nodoc
class __$$GiftCardImplCopyWithImpl<$Res>
    extends _$GiftCardCrudStateCopyWithImpl<$Res, _$GiftCardImpl>
    implements _$$GiftCardImplCopyWith<$Res> {
  __$$GiftCardImplCopyWithImpl(
      _$GiftCardImpl _value, $Res Function(_$GiftCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftCard = null,
  }) {
    return _then(_$GiftCardImpl(
      null == giftCard
          ? _value.giftCard
          : giftCard // ignore: cast_nullable_to_non_nullable
              as GiftCard,
    ));
  }
}

/// @nodoc

class _$GiftCardImpl implements _GiftCard {
  const _$GiftCardImpl(this.giftCard);

  @override
  final GiftCard giftCard;

  @override
  String toString() {
    return 'GiftCardCrudState.giftCard(giftCard: $giftCard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCardImpl &&
            (identical(other.giftCard, giftCard) ||
                other.giftCard == giftCard));
  }

  @override
  int get hashCode => Object.hash(runtimeType, giftCard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftCardImplCopyWith<_$GiftCardImpl> get copyWith =>
      __$$GiftCardImplCopyWithImpl<_$GiftCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? id) loading,
    required TResult Function(GiftCard giftCard) giftCard,
    required TResult Function(List<GiftCard> giftCards, int count) giftCards,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return giftCard(this.giftCard);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(GiftCard giftCard)? giftCard,
    TResult? Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return giftCard?.call(this.giftCard);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(GiftCard giftCard)? giftCard,
    TResult Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (giftCard != null) {
      return giftCard(this.giftCard);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GiftCard value) giftCard,
    required TResult Function(_GiftCards value) giftCards,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return giftCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_GiftCard value)? giftCard,
    TResult? Function(_GiftCards value)? giftCards,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return giftCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GiftCard value)? giftCard,
    TResult Function(_GiftCards value)? giftCards,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (giftCard != null) {
      return giftCard(this);
    }
    return orElse();
  }
}

abstract class _GiftCard implements GiftCardCrudState {
  const factory _GiftCard(final GiftCard giftCard) = _$GiftCardImpl;

  GiftCard get giftCard;
  @JsonKey(ignore: true)
  _$$GiftCardImplCopyWith<_$GiftCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GiftCardsImplCopyWith<$Res> {
  factory _$$GiftCardsImplCopyWith(
          _$GiftCardsImpl value, $Res Function(_$GiftCardsImpl) then) =
      __$$GiftCardsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GiftCard> giftCards, int count});
}

/// @nodoc
class __$$GiftCardsImplCopyWithImpl<$Res>
    extends _$GiftCardCrudStateCopyWithImpl<$Res, _$GiftCardsImpl>
    implements _$$GiftCardsImplCopyWith<$Res> {
  __$$GiftCardsImplCopyWithImpl(
      _$GiftCardsImpl _value, $Res Function(_$GiftCardsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftCards = null,
    Object? count = null,
  }) {
    return _then(_$GiftCardsImpl(
      null == giftCards
          ? _value._giftCards
          : giftCards // ignore: cast_nullable_to_non_nullable
              as List<GiftCard>,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GiftCardsImpl implements _GiftCards {
  const _$GiftCardsImpl(final List<GiftCard> giftCards, this.count)
      : _giftCards = giftCards;

  final List<GiftCard> _giftCards;
  @override
  List<GiftCard> get giftCards {
    if (_giftCards is EqualUnmodifiableListView) return _giftCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_giftCards);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'GiftCardCrudState.giftCards(giftCards: $giftCards, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftCardsImpl &&
            const DeepCollectionEquality()
                .equals(other._giftCards, _giftCards) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_giftCards), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftCardsImplCopyWith<_$GiftCardsImpl> get copyWith =>
      __$$GiftCardsImplCopyWithImpl<_$GiftCardsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? id) loading,
    required TResult Function(GiftCard giftCard) giftCard,
    required TResult Function(List<GiftCard> giftCards, int count) giftCards,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return giftCards(this.giftCards, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(GiftCard giftCard)? giftCard,
    TResult? Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return giftCards?.call(this.giftCards, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(GiftCard giftCard)? giftCard,
    TResult Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (giftCards != null) {
      return giftCards(this.giftCards, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_GiftCard value) giftCard,
    required TResult Function(_GiftCards value) giftCards,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return giftCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_GiftCard value)? giftCard,
    TResult? Function(_GiftCards value)? giftCards,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return giftCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_GiftCard value)? giftCard,
    TResult Function(_GiftCards value)? giftCards,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (giftCards != null) {
      return giftCards(this);
    }
    return orElse();
  }
}

abstract class _GiftCards implements GiftCardCrudState {
  const factory _GiftCards(final List<GiftCard> giftCards, final int count) =
      _$GiftCardsImpl;

  List<GiftCard> get giftCards;
  int get count;
  @JsonKey(ignore: true)
  _$$GiftCardsImplCopyWith<_$GiftCardsImpl> get copyWith =>
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
    extends _$GiftCardCrudStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'GiftCardCrudState.error(failure: $failure)';
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
    required TResult Function(String? id) loading,
    required TResult Function(GiftCard giftCard) giftCard,
    required TResult Function(List<GiftCard> giftCards, int count) giftCards,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(GiftCard giftCard)? giftCard,
    TResult? Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(GiftCard giftCard)? giftCard,
    TResult Function(List<GiftCard> giftCards, int count)? giftCards,
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
    required TResult Function(_GiftCard value) giftCard,
    required TResult Function(_GiftCards value) giftCards,
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
    TResult? Function(_GiftCard value)? giftCard,
    TResult? Function(_GiftCards value)? giftCards,
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
    TResult Function(_GiftCard value)? giftCard,
    TResult Function(_GiftCards value)? giftCards,
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

abstract class _Error implements GiftCardCrudState {
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
    extends _$GiftCardCrudStateCopyWithImpl<$Res, _$DeletedImpl>
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
    return 'GiftCardCrudState.deleted()';
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
    required TResult Function(String? id) loading,
    required TResult Function(GiftCard giftCard) giftCard,
    required TResult Function(List<GiftCard> giftCards, int count) giftCards,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(GiftCard giftCard)? giftCard,
    TResult? Function(List<GiftCard> giftCards, int count)? giftCards,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(GiftCard giftCard)? giftCard,
    TResult Function(List<GiftCard> giftCards, int count)? giftCards,
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
    required TResult Function(_GiftCard value) giftCard,
    required TResult Function(_GiftCards value) giftCards,
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
    TResult? Function(_GiftCard value)? giftCard,
    TResult? Function(_GiftCards value)? giftCards,
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
    TResult Function(_GiftCard value)? giftCard,
    TResult Function(_GiftCards value)? giftCards,
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

abstract class _Deleted implements GiftCardCrudState {
  const factory _Deleted() = _$DeletedImpl;
}
