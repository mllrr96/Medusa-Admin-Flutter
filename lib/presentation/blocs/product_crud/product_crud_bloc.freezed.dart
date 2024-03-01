// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_crud_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductCrudEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) loadWithVariants,
    required TResult Function(String id) delete,
    required TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)
        update,
    required TResult Function(UserPostProductReq userPostProductReq) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? loadWithVariants,
    TResult? Function(String id)? delete,
    TResult? Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult? Function(UserPostProductReq userPostProductReq)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? loadWithVariants,
    TResult Function(String id)? delete,
    TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult Function(UserPostProductReq userPostProductReq)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_LoadWithVariants value) loadWithVariants,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_LoadWithVariants value)? loadWithVariants,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_LoadWithVariants value)? loadWithVariants,
    TResult Function(_Delete value)? delete,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCrudEventCopyWith<$Res> {
  factory $ProductCrudEventCopyWith(
          ProductCrudEvent value, $Res Function(ProductCrudEvent) then) =
      _$ProductCrudEventCopyWithImpl<$Res, ProductCrudEvent>;
}

/// @nodoc
class _$ProductCrudEventCopyWithImpl<$Res, $Val extends ProductCrudEvent>
    implements $ProductCrudEventCopyWith<$Res> {
  _$ProductCrudEventCopyWithImpl(this._value, this._then);

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
    extends _$ProductCrudEventCopyWithImpl<$Res, _$LoadImpl>
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
    return 'ProductCrudEvent.load(id: $id)';
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
    required TResult Function(String id) loadWithVariants,
    required TResult Function(String id) delete,
    required TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)
        update,
    required TResult Function(UserPostProductReq userPostProductReq) create,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? loadWithVariants,
    TResult? Function(String id)? delete,
    TResult? Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult? Function(UserPostProductReq userPostProductReq)? create,
  }) {
    return load?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? loadWithVariants,
    TResult Function(String id)? delete,
    TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult Function(UserPostProductReq userPostProductReq)? create,
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
    required TResult Function(_LoadWithVariants value) loadWithVariants,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_LoadWithVariants value)? loadWithVariants,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_LoadWithVariants value)? loadWithVariants,
    TResult Function(_Delete value)? delete,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements ProductCrudEvent {
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
    extends _$ProductCrudEventCopyWithImpl<$Res, _$LoadAllImpl>
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
    return 'ProductCrudEvent.loadAll(queryParameters: $queryParameters)';
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
    required TResult Function(String id) loadWithVariants,
    required TResult Function(String id) delete,
    required TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)
        update,
    required TResult Function(UserPostProductReq userPostProductReq) create,
  }) {
    return loadAll(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? loadWithVariants,
    TResult? Function(String id)? delete,
    TResult? Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult? Function(UserPostProductReq userPostProductReq)? create,
  }) {
    return loadAll?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? loadWithVariants,
    TResult Function(String id)? delete,
    TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult Function(UserPostProductReq userPostProductReq)? create,
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
    required TResult Function(_LoadWithVariants value) loadWithVariants,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
  }) {
    return loadAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_LoadWithVariants value)? loadWithVariants,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
  }) {
    return loadAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_LoadWithVariants value)? loadWithVariants,
    TResult Function(_Delete value)? delete,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class _LoadAll implements ProductCrudEvent {
  const factory _LoadAll({final Map<String, dynamic>? queryParameters}) =
      _$LoadAllImpl;

  Map<String, dynamic>? get queryParameters;
  @JsonKey(ignore: true)
  _$$LoadAllImplCopyWith<_$LoadAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadWithVariantsImplCopyWith<$Res> {
  factory _$$LoadWithVariantsImplCopyWith(_$LoadWithVariantsImpl value,
          $Res Function(_$LoadWithVariantsImpl) then) =
      __$$LoadWithVariantsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$LoadWithVariantsImplCopyWithImpl<$Res>
    extends _$ProductCrudEventCopyWithImpl<$Res, _$LoadWithVariantsImpl>
    implements _$$LoadWithVariantsImplCopyWith<$Res> {
  __$$LoadWithVariantsImplCopyWithImpl(_$LoadWithVariantsImpl _value,
      $Res Function(_$LoadWithVariantsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadWithVariantsImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadWithVariantsImpl implements _LoadWithVariants {
  const _$LoadWithVariantsImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ProductCrudEvent.loadWithVariants(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadWithVariantsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadWithVariantsImplCopyWith<_$LoadWithVariantsImpl> get copyWith =>
      __$$LoadWithVariantsImplCopyWithImpl<_$LoadWithVariantsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) loadWithVariants,
    required TResult Function(String id) delete,
    required TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)
        update,
    required TResult Function(UserPostProductReq userPostProductReq) create,
  }) {
    return loadWithVariants(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? loadWithVariants,
    TResult? Function(String id)? delete,
    TResult? Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult? Function(UserPostProductReq userPostProductReq)? create,
  }) {
    return loadWithVariants?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? loadWithVariants,
    TResult Function(String id)? delete,
    TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult Function(UserPostProductReq userPostProductReq)? create,
    required TResult orElse(),
  }) {
    if (loadWithVariants != null) {
      return loadWithVariants(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_LoadWithVariants value) loadWithVariants,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
  }) {
    return loadWithVariants(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_LoadWithVariants value)? loadWithVariants,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
  }) {
    return loadWithVariants?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_LoadWithVariants value)? loadWithVariants,
    TResult Function(_Delete value)? delete,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    required TResult orElse(),
  }) {
    if (loadWithVariants != null) {
      return loadWithVariants(this);
    }
    return orElse();
  }
}

abstract class _LoadWithVariants implements ProductCrudEvent {
  const factory _LoadWithVariants(final String id) = _$LoadWithVariantsImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$LoadWithVariantsImplCopyWith<_$LoadWithVariantsImpl> get copyWith =>
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
    extends _$ProductCrudEventCopyWithImpl<$Res, _$DeleteImpl>
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
    return 'ProductCrudEvent.delete(id: $id)';
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
    required TResult Function(String id) loadWithVariants,
    required TResult Function(String id) delete,
    required TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)
        update,
    required TResult Function(UserPostProductReq userPostProductReq) create,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? loadWithVariants,
    TResult? Function(String id)? delete,
    TResult? Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult? Function(UserPostProductReq userPostProductReq)? create,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? loadWithVariants,
    TResult Function(String id)? delete,
    TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult Function(UserPostProductReq userPostProductReq)? create,
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
    required TResult Function(_LoadWithVariants value) loadWithVariants,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_LoadWithVariants value)? loadWithVariants,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_LoadWithVariants value)? loadWithVariants,
    TResult Function(_Delete value)? delete,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements ProductCrudEvent {
  const factory _Delete(final String id) = _$DeleteImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, UserPostUpdateProductReq userPostUpdateProductReq});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$ProductCrudEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userPostUpdateProductReq = null,
  }) {
    return _then(_$UpdateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userPostUpdateProductReq
          ? _value.userPostUpdateProductReq
          : userPostUpdateProductReq // ignore: cast_nullable_to_non_nullable
              as UserPostUpdateProductReq,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.id, this.userPostUpdateProductReq);

  @override
  final String id;
  @override
  final UserPostUpdateProductReq userPostUpdateProductReq;

  @override
  String toString() {
    return 'ProductCrudEvent.update(id: $id, userPostUpdateProductReq: $userPostUpdateProductReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(
                    other.userPostUpdateProductReq, userPostUpdateProductReq) ||
                other.userPostUpdateProductReq == userPostUpdateProductReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userPostUpdateProductReq);

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
    required TResult Function(String id) loadWithVariants,
    required TResult Function(String id) delete,
    required TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)
        update,
    required TResult Function(UserPostProductReq userPostProductReq) create,
  }) {
    return update(id, userPostUpdateProductReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? loadWithVariants,
    TResult? Function(String id)? delete,
    TResult? Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult? Function(UserPostProductReq userPostProductReq)? create,
  }) {
    return update?.call(id, userPostUpdateProductReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? loadWithVariants,
    TResult Function(String id)? delete,
    TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult Function(UserPostProductReq userPostProductReq)? create,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, userPostUpdateProductReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_LoadWithVariants value) loadWithVariants,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_LoadWithVariants value)? loadWithVariants,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_LoadWithVariants value)? loadWithVariants,
    TResult Function(_Delete value)? delete,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements ProductCrudEvent {
  const factory _Update(final String id,
      final UserPostUpdateProductReq userPostUpdateProductReq) = _$UpdateImpl;

  String get id;
  UserPostUpdateProductReq get userPostUpdateProductReq;
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
  $Res call({UserPostProductReq userPostProductReq});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$ProductCrudEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPostProductReq = null,
  }) {
    return _then(_$CreateImpl(
      null == userPostProductReq
          ? _value.userPostProductReq
          : userPostProductReq // ignore: cast_nullable_to_non_nullable
              as UserPostProductReq,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(this.userPostProductReq);

  @override
  final UserPostProductReq userPostProductReq;

  @override
  String toString() {
    return 'ProductCrudEvent.create(userPostProductReq: $userPostProductReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.userPostProductReq, userPostProductReq) ||
                other.userPostProductReq == userPostProductReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userPostProductReq);

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
    required TResult Function(String id) loadWithVariants,
    required TResult Function(String id) delete,
    required TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)
        update,
    required TResult Function(UserPostProductReq userPostProductReq) create,
  }) {
    return create(userPostProductReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? loadWithVariants,
    TResult? Function(String id)? delete,
    TResult? Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult? Function(UserPostProductReq userPostProductReq)? create,
  }) {
    return create?.call(userPostProductReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? loadWithVariants,
    TResult Function(String id)? delete,
    TResult Function(
            String id, UserPostUpdateProductReq userPostUpdateProductReq)?
        update,
    TResult Function(UserPostProductReq userPostProductReq)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(userPostProductReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_LoadWithVariants value) loadWithVariants,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Update value) update,
    required TResult Function(_Create value) create,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_LoadWithVariants value)? loadWithVariants,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_LoadWithVariants value)? loadWithVariants,
    TResult Function(_Delete value)? delete,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements ProductCrudEvent {
  const factory _Create(final UserPostProductReq userPostProductReq) =
      _$CreateImpl;

  UserPostProductReq get userPostProductReq;
  @JsonKey(ignore: true)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductCrudState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? id) loading,
    required TResult Function(Product product) product,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Product product) updated,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(Product product)? product,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Product product)? updated,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(Product product)? product,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Product product)? updated,
    TResult Function()? deleted,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Product value) product,
    required TResult Function(_Products value) products,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Product value)? product,
    TResult? Function(_Products value)? products,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Product value)? product,
    TResult Function(_Products value)? products,
    TResult Function(_Updated value)? updated,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCrudStateCopyWith<$Res> {
  factory $ProductCrudStateCopyWith(
          ProductCrudState value, $Res Function(ProductCrudState) then) =
      _$ProductCrudStateCopyWithImpl<$Res, ProductCrudState>;
}

/// @nodoc
class _$ProductCrudStateCopyWithImpl<$Res, $Val extends ProductCrudState>
    implements $ProductCrudStateCopyWith<$Res> {
  _$ProductCrudStateCopyWithImpl(this._value, this._then);

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
    extends _$ProductCrudStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ProductCrudState.initial()';
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
    required TResult Function(Product product) product,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Product product) updated,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(Product product)? product,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Product product)? updated,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(Product product)? product,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Product product)? updated,
    TResult Function()? deleted,
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
    required TResult Function(_Product value) product,
    required TResult Function(_Products value) products,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Product value)? product,
    TResult? Function(_Products value)? products,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Product value)? product,
    TResult Function(_Products value)? products,
    TResult Function(_Updated value)? updated,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductCrudState {
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
    extends _$ProductCrudStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ProductCrudState.loading(id: $id)';
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
    required TResult Function(Product product) product,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Product product) updated,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return loading(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(Product product)? product,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Product product)? updated,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(Product product)? product,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Product product)? updated,
    TResult Function()? deleted,
    TResult Function(Failure failure)? error,
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
    required TResult Function(_Product value) product,
    required TResult Function(_Products value) products,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Product value)? product,
    TResult? Function(_Products value)? products,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Product value)? product,
    TResult Function(_Products value)? products,
    TResult Function(_Updated value)? updated,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProductCrudState {
  const factory _Loading({final String? id}) = _$LoadingImpl;

  String? get id;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCrudStateCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$ProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$ProductImpl implements _Product {
  const _$ProductImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'ProductCrudState.product(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? id) loading,
    required TResult Function(Product product) product,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Product product) updated,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return product(this.product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(Product product)? product,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Product product)? updated,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return product?.call(this.product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(Product product)? product,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Product product)? updated,
    TResult Function()? deleted,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(this.product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Product value) product,
    required TResult Function(_Products value) products,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return product(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Product value)? product,
    TResult? Function(_Products value)? products,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return product?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Product value)? product,
    TResult Function(_Products value)? products,
    TResult Function(_Updated value)? updated,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(this);
    }
    return orElse();
  }
}

abstract class _Product implements ProductCrudState {
  const factory _Product(final Product product) = _$ProductImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
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
    extends _$ProductCrudStateCopyWithImpl<$Res, _$ProductsImpl>
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
    return 'ProductCrudState.products(products: $products, count: $count)';
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
    required TResult Function(String? id) loading,
    required TResult Function(Product product) product,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Product product) updated,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return products(this.products, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(Product product)? product,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Product product)? updated,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return products?.call(this.products, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(Product product)? product,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Product product)? updated,
    TResult Function()? deleted,
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
    required TResult Function(_Product value) product,
    required TResult Function(_Products value) products,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return products(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Product value)? product,
    TResult? Function(_Products value)? products,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return products?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Product value)? product,
    TResult Function(_Products value)? products,
    TResult Function(_Updated value)? updated,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (products != null) {
      return products(this);
    }
    return orElse();
  }
}

abstract class _Products implements ProductCrudState {
  const factory _Products(final List<Product> products, final int count) =
      _$ProductsImpl;

  List<Product> get products;
  int get count;
  @JsonKey(ignore: true)
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatedImplCopyWith<$Res> {
  factory _$$UpdatedImplCopyWith(
          _$UpdatedImpl value, $Res Function(_$UpdatedImpl) then) =
      __$$UpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$UpdatedImplCopyWithImpl<$Res>
    extends _$ProductCrudStateCopyWithImpl<$Res, _$UpdatedImpl>
    implements _$$UpdatedImplCopyWith<$Res> {
  __$$UpdatedImplCopyWithImpl(
      _$UpdatedImpl _value, $Res Function(_$UpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$UpdatedImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$UpdatedImpl implements _Updated {
  const _$UpdatedImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'ProductCrudState.updated(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedImplCopyWith<_$UpdatedImpl> get copyWith =>
      __$$UpdatedImplCopyWithImpl<_$UpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? id) loading,
    required TResult Function(Product product) product,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Product product) updated,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return updated(this.product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(Product product)? product,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Product product)? updated,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return updated?.call(this.product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(Product product)? product,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Product product)? updated,
    TResult Function()? deleted,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this.product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Product value) product,
    required TResult Function(_Products value) products,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Product value)? product,
    TResult? Function(_Products value)? products,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Product value)? product,
    TResult Function(_Products value)? products,
    TResult Function(_Updated value)? updated,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class _Updated implements ProductCrudState {
  const factory _Updated(final Product product) = _$UpdatedImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$UpdatedImplCopyWith<_$UpdatedImpl> get copyWith =>
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
    extends _$ProductCrudStateCopyWithImpl<$Res, _$DeletedImpl>
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
    return 'ProductCrudState.deleted()';
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
    required TResult Function(Product product) product,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Product product) updated,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(Product product)? product,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Product product)? updated,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(Product product)? product,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Product product)? updated,
    TResult Function()? deleted,
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
    required TResult Function(_Product value) product,
    required TResult Function(_Products value) products,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Product value)? product,
    TResult? Function(_Products value)? products,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Product value)? product,
    TResult Function(_Products value)? products,
    TResult Function(_Updated value)? updated,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements ProductCrudState {
  const factory _Deleted() = _$DeletedImpl;
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
    extends _$ProductCrudStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'ProductCrudState.error(failure: $failure)';
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
    required TResult Function(Product product) product,
    required TResult Function(List<Product> products, int count) products,
    required TResult Function(Product product) updated,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? id)? loading,
    TResult? Function(Product product)? product,
    TResult? Function(List<Product> products, int count)? products,
    TResult? Function(Product product)? updated,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? id)? loading,
    TResult Function(Product product)? product,
    TResult Function(List<Product> products, int count)? products,
    TResult Function(Product product)? updated,
    TResult Function()? deleted,
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
    required TResult Function(_Product value) product,
    required TResult Function(_Products value) products,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Product value)? product,
    TResult? Function(_Products value)? products,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Product value)? product,
    TResult Function(_Products value)? products,
    TResult Function(_Updated value)? updated,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ProductCrudState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
