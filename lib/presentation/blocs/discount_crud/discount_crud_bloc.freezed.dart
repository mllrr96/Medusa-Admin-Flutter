// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_crud_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscountCrudEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            String id, UserUpdateDiscountReq userUpdateDiscountReq)
        update,
    required TResult Function(UserCreateDiscountReq userCreateDiscountReq)
        create,
    required TResult Function(String discountId) delete,
    required TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)
        addCondition,
    required TResult Function(String discountId, String conditionId)
        removeCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        addItemsToCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        removeItemsFromCondition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult? Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult? Function(String discountId)? delete,
    TResult? Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult? Function(String discountId, String conditionId)? removeCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult Function(String discountId)? delete,
    TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult Function(String discountId, String conditionId)? removeCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
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
    required TResult Function(_AddCondition value) addCondition,
    required TResult Function(_RemoveCondition value) removeCondition,
    required TResult Function(_AddItemsToCondition value) addItemsToCondition,
    required TResult Function(_RemoveItemsFromCondition value)
        removeItemsFromCondition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddCondition value)? addCondition,
    TResult? Function(_RemoveCondition value)? removeCondition,
    TResult? Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult? Function(_RemoveItemsFromCondition value)?
        removeItemsFromCondition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddCondition value)? addCondition,
    TResult Function(_RemoveCondition value)? removeCondition,
    TResult Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult Function(_RemoveItemsFromCondition value)? removeItemsFromCondition,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountCrudEventCopyWith<$Res> {
  factory $DiscountCrudEventCopyWith(
          DiscountCrudEvent value, $Res Function(DiscountCrudEvent) then) =
      _$DiscountCrudEventCopyWithImpl<$Res, DiscountCrudEvent>;
}

/// @nodoc
class _$DiscountCrudEventCopyWithImpl<$Res, $Val extends DiscountCrudEvent>
    implements $DiscountCrudEventCopyWith<$Res> {
  _$DiscountCrudEventCopyWithImpl(this._value, this._then);

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
    extends _$DiscountCrudEventCopyWithImpl<$Res, _$LoadImpl>
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
    return 'DiscountCrudEvent.load(id: $id)';
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
            String id, UserUpdateDiscountReq userUpdateDiscountReq)
        update,
    required TResult Function(UserCreateDiscountReq userCreateDiscountReq)
        create,
    required TResult Function(String discountId) delete,
    required TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)
        addCondition,
    required TResult Function(String discountId, String conditionId)
        removeCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        addItemsToCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        removeItemsFromCondition,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult? Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult? Function(String discountId)? delete,
    TResult? Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult? Function(String discountId, String conditionId)? removeCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
  }) {
    return load?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult Function(String discountId)? delete,
    TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult Function(String discountId, String conditionId)? removeCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
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
    required TResult Function(_AddCondition value) addCondition,
    required TResult Function(_RemoveCondition value) removeCondition,
    required TResult Function(_AddItemsToCondition value) addItemsToCondition,
    required TResult Function(_RemoveItemsFromCondition value)
        removeItemsFromCondition,
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
    TResult? Function(_AddCondition value)? addCondition,
    TResult? Function(_RemoveCondition value)? removeCondition,
    TResult? Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult? Function(_RemoveItemsFromCondition value)?
        removeItemsFromCondition,
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
    TResult Function(_AddCondition value)? addCondition,
    TResult Function(_RemoveCondition value)? removeCondition,
    TResult Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult Function(_RemoveItemsFromCondition value)? removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements DiscountCrudEvent {
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
    extends _$DiscountCrudEventCopyWithImpl<$Res, _$LoadAllImpl>
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
    return 'DiscountCrudEvent.loadAll(queryParameters: $queryParameters)';
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
            String id, UserUpdateDiscountReq userUpdateDiscountReq)
        update,
    required TResult Function(UserCreateDiscountReq userCreateDiscountReq)
        create,
    required TResult Function(String discountId) delete,
    required TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)
        addCondition,
    required TResult Function(String discountId, String conditionId)
        removeCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        addItemsToCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        removeItemsFromCondition,
  }) {
    return loadAll(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult? Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult? Function(String discountId)? delete,
    TResult? Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult? Function(String discountId, String conditionId)? removeCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
  }) {
    return loadAll?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult Function(String discountId)? delete,
    TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult Function(String discountId, String conditionId)? removeCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
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
    required TResult Function(_AddCondition value) addCondition,
    required TResult Function(_RemoveCondition value) removeCondition,
    required TResult Function(_AddItemsToCondition value) addItemsToCondition,
    required TResult Function(_RemoveItemsFromCondition value)
        removeItemsFromCondition,
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
    TResult? Function(_AddCondition value)? addCondition,
    TResult? Function(_RemoveCondition value)? removeCondition,
    TResult? Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult? Function(_RemoveItemsFromCondition value)?
        removeItemsFromCondition,
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
    TResult Function(_AddCondition value)? addCondition,
    TResult Function(_RemoveCondition value)? removeCondition,
    TResult Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult Function(_RemoveItemsFromCondition value)? removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class _LoadAll implements DiscountCrudEvent {
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
  $Res call({String id, UserUpdateDiscountReq userUpdateDiscountReq});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$DiscountCrudEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userUpdateDiscountReq = null,
  }) {
    return _then(_$UpdateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userUpdateDiscountReq
          ? _value.userUpdateDiscountReq
          : userUpdateDiscountReq // ignore: cast_nullable_to_non_nullable
              as UserUpdateDiscountReq,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.id, this.userUpdateDiscountReq);

  @override
  final String id;
  @override
  final UserUpdateDiscountReq userUpdateDiscountReq;

  @override
  String toString() {
    return 'DiscountCrudEvent.update(id: $id, userUpdateDiscountReq: $userUpdateDiscountReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userUpdateDiscountReq, userUpdateDiscountReq) ||
                other.userUpdateDiscountReq == userUpdateDiscountReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userUpdateDiscountReq);

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
            String id, UserUpdateDiscountReq userUpdateDiscountReq)
        update,
    required TResult Function(UserCreateDiscountReq userCreateDiscountReq)
        create,
    required TResult Function(String discountId) delete,
    required TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)
        addCondition,
    required TResult Function(String discountId, String conditionId)
        removeCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        addItemsToCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        removeItemsFromCondition,
  }) {
    return update(id, userUpdateDiscountReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult? Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult? Function(String discountId)? delete,
    TResult? Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult? Function(String discountId, String conditionId)? removeCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
  }) {
    return update?.call(id, userUpdateDiscountReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult Function(String discountId)? delete,
    TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult Function(String discountId, String conditionId)? removeCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, userUpdateDiscountReq);
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
    required TResult Function(_AddCondition value) addCondition,
    required TResult Function(_RemoveCondition value) removeCondition,
    required TResult Function(_AddItemsToCondition value) addItemsToCondition,
    required TResult Function(_RemoveItemsFromCondition value)
        removeItemsFromCondition,
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
    TResult? Function(_AddCondition value)? addCondition,
    TResult? Function(_RemoveCondition value)? removeCondition,
    TResult? Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult? Function(_RemoveItemsFromCondition value)?
        removeItemsFromCondition,
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
    TResult Function(_AddCondition value)? addCondition,
    TResult Function(_RemoveCondition value)? removeCondition,
    TResult Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult Function(_RemoveItemsFromCondition value)? removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements DiscountCrudEvent {
  const factory _Update(
          final String id, final UserUpdateDiscountReq userUpdateDiscountReq) =
      _$UpdateImpl;

  String get id;
  UserUpdateDiscountReq get userUpdateDiscountReq;
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
  $Res call({UserCreateDiscountReq userCreateDiscountReq});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$DiscountCrudEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCreateDiscountReq = null,
  }) {
    return _then(_$CreateImpl(
      null == userCreateDiscountReq
          ? _value.userCreateDiscountReq
          : userCreateDiscountReq // ignore: cast_nullable_to_non_nullable
              as UserCreateDiscountReq,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(this.userCreateDiscountReq);

  @override
  final UserCreateDiscountReq userCreateDiscountReq;

  @override
  String toString() {
    return 'DiscountCrudEvent.create(userCreateDiscountReq: $userCreateDiscountReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.userCreateDiscountReq, userCreateDiscountReq) ||
                other.userCreateDiscountReq == userCreateDiscountReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCreateDiscountReq);

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
            String id, UserUpdateDiscountReq userUpdateDiscountReq)
        update,
    required TResult Function(UserCreateDiscountReq userCreateDiscountReq)
        create,
    required TResult Function(String discountId) delete,
    required TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)
        addCondition,
    required TResult Function(String discountId, String conditionId)
        removeCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        addItemsToCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        removeItemsFromCondition,
  }) {
    return create(userCreateDiscountReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult? Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult? Function(String discountId)? delete,
    TResult? Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult? Function(String discountId, String conditionId)? removeCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
  }) {
    return create?.call(userCreateDiscountReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult Function(String discountId)? delete,
    TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult Function(String discountId, String conditionId)? removeCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(userCreateDiscountReq);
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
    required TResult Function(_AddCondition value) addCondition,
    required TResult Function(_RemoveCondition value) removeCondition,
    required TResult Function(_AddItemsToCondition value) addItemsToCondition,
    required TResult Function(_RemoveItemsFromCondition value)
        removeItemsFromCondition,
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
    TResult? Function(_AddCondition value)? addCondition,
    TResult? Function(_RemoveCondition value)? removeCondition,
    TResult? Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult? Function(_RemoveItemsFromCondition value)?
        removeItemsFromCondition,
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
    TResult Function(_AddCondition value)? addCondition,
    TResult Function(_RemoveCondition value)? removeCondition,
    TResult Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult Function(_RemoveItemsFromCondition value)? removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements DiscountCrudEvent {
  const factory _Create(final UserCreateDiscountReq userCreateDiscountReq) =
      _$CreateImpl;

  UserCreateDiscountReq get userCreateDiscountReq;
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
  $Res call({String discountId});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$DiscountCrudEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountId = null,
  }) {
    return _then(_$DeleteImpl(
      null == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.discountId);

  @override
  final String discountId;

  @override
  String toString() {
    return 'DiscountCrudEvent.delete(discountId: $discountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discountId);

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
            String id, UserUpdateDiscountReq userUpdateDiscountReq)
        update,
    required TResult Function(UserCreateDiscountReq userCreateDiscountReq)
        create,
    required TResult Function(String discountId) delete,
    required TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)
        addCondition,
    required TResult Function(String discountId, String conditionId)
        removeCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        addItemsToCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        removeItemsFromCondition,
  }) {
    return delete(discountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult? Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult? Function(String discountId)? delete,
    TResult? Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult? Function(String discountId, String conditionId)? removeCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
  }) {
    return delete?.call(discountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult Function(String discountId)? delete,
    TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult Function(String discountId, String conditionId)? removeCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(discountId);
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
    required TResult Function(_AddCondition value) addCondition,
    required TResult Function(_RemoveCondition value) removeCondition,
    required TResult Function(_AddItemsToCondition value) addItemsToCondition,
    required TResult Function(_RemoveItemsFromCondition value)
        removeItemsFromCondition,
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
    TResult? Function(_AddCondition value)? addCondition,
    TResult? Function(_RemoveCondition value)? removeCondition,
    TResult? Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult? Function(_RemoveItemsFromCondition value)?
        removeItemsFromCondition,
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
    TResult Function(_AddCondition value)? addCondition,
    TResult Function(_RemoveCondition value)? removeCondition,
    TResult Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult Function(_RemoveItemsFromCondition value)? removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements DiscountCrudEvent {
  const factory _Delete(final String discountId) = _$DeleteImpl;

  String get discountId;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddConditionImplCopyWith<$Res> {
  factory _$$AddConditionImplCopyWith(
          _$AddConditionImpl value, $Res Function(_$AddConditionImpl) then) =
      __$$AddConditionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String discountId, UserCreateConditionReq userCreateConditionReq});
}

/// @nodoc
class __$$AddConditionImplCopyWithImpl<$Res>
    extends _$DiscountCrudEventCopyWithImpl<$Res, _$AddConditionImpl>
    implements _$$AddConditionImplCopyWith<$Res> {
  __$$AddConditionImplCopyWithImpl(
      _$AddConditionImpl _value, $Res Function(_$AddConditionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountId = null,
    Object? userCreateConditionReq = null,
  }) {
    return _then(_$AddConditionImpl(
      null == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as String,
      null == userCreateConditionReq
          ? _value.userCreateConditionReq
          : userCreateConditionReq // ignore: cast_nullable_to_non_nullable
              as UserCreateConditionReq,
    ));
  }
}

/// @nodoc

class _$AddConditionImpl implements _AddCondition {
  const _$AddConditionImpl(this.discountId, this.userCreateConditionReq);

  @override
  final String discountId;
  @override
  final UserCreateConditionReq userCreateConditionReq;

  @override
  String toString() {
    return 'DiscountCrudEvent.addCondition(discountId: $discountId, userCreateConditionReq: $userCreateConditionReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddConditionImpl &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId) &&
            (identical(other.userCreateConditionReq, userCreateConditionReq) ||
                other.userCreateConditionReq == userCreateConditionReq));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, discountId, userCreateConditionReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddConditionImplCopyWith<_$AddConditionImpl> get copyWith =>
      __$$AddConditionImplCopyWithImpl<_$AddConditionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            String id, UserUpdateDiscountReq userUpdateDiscountReq)
        update,
    required TResult Function(UserCreateDiscountReq userCreateDiscountReq)
        create,
    required TResult Function(String discountId) delete,
    required TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)
        addCondition,
    required TResult Function(String discountId, String conditionId)
        removeCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        addItemsToCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        removeItemsFromCondition,
  }) {
    return addCondition(discountId, userCreateConditionReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult? Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult? Function(String discountId)? delete,
    TResult? Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult? Function(String discountId, String conditionId)? removeCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
  }) {
    return addCondition?.call(discountId, userCreateConditionReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult Function(String discountId)? delete,
    TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult Function(String discountId, String conditionId)? removeCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (addCondition != null) {
      return addCondition(discountId, userCreateConditionReq);
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
    required TResult Function(_AddCondition value) addCondition,
    required TResult Function(_RemoveCondition value) removeCondition,
    required TResult Function(_AddItemsToCondition value) addItemsToCondition,
    required TResult Function(_RemoveItemsFromCondition value)
        removeItemsFromCondition,
  }) {
    return addCondition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddCondition value)? addCondition,
    TResult? Function(_RemoveCondition value)? removeCondition,
    TResult? Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult? Function(_RemoveItemsFromCondition value)?
        removeItemsFromCondition,
  }) {
    return addCondition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddCondition value)? addCondition,
    TResult Function(_RemoveCondition value)? removeCondition,
    TResult Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult Function(_RemoveItemsFromCondition value)? removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (addCondition != null) {
      return addCondition(this);
    }
    return orElse();
  }
}

abstract class _AddCondition implements DiscountCrudEvent {
  const factory _AddCondition(final String discountId,
      final UserCreateConditionReq userCreateConditionReq) = _$AddConditionImpl;

  String get discountId;
  UserCreateConditionReq get userCreateConditionReq;
  @JsonKey(ignore: true)
  _$$AddConditionImplCopyWith<_$AddConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveConditionImplCopyWith<$Res> {
  factory _$$RemoveConditionImplCopyWith(_$RemoveConditionImpl value,
          $Res Function(_$RemoveConditionImpl) then) =
      __$$RemoveConditionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String discountId, String conditionId});
}

/// @nodoc
class __$$RemoveConditionImplCopyWithImpl<$Res>
    extends _$DiscountCrudEventCopyWithImpl<$Res, _$RemoveConditionImpl>
    implements _$$RemoveConditionImplCopyWith<$Res> {
  __$$RemoveConditionImplCopyWithImpl(
      _$RemoveConditionImpl _value, $Res Function(_$RemoveConditionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountId = null,
    Object? conditionId = null,
  }) {
    return _then(_$RemoveConditionImpl(
      null == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as String,
      null == conditionId
          ? _value.conditionId
          : conditionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveConditionImpl implements _RemoveCondition {
  const _$RemoveConditionImpl(this.discountId, this.conditionId);

  @override
  final String discountId;
  @override
  final String conditionId;

  @override
  String toString() {
    return 'DiscountCrudEvent.removeCondition(discountId: $discountId, conditionId: $conditionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveConditionImpl &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId) &&
            (identical(other.conditionId, conditionId) ||
                other.conditionId == conditionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discountId, conditionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveConditionImplCopyWith<_$RemoveConditionImpl> get copyWith =>
      __$$RemoveConditionImplCopyWithImpl<_$RemoveConditionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            String id, UserUpdateDiscountReq userUpdateDiscountReq)
        update,
    required TResult Function(UserCreateDiscountReq userCreateDiscountReq)
        create,
    required TResult Function(String discountId) delete,
    required TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)
        addCondition,
    required TResult Function(String discountId, String conditionId)
        removeCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        addItemsToCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        removeItemsFromCondition,
  }) {
    return removeCondition(discountId, conditionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult? Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult? Function(String discountId)? delete,
    TResult? Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult? Function(String discountId, String conditionId)? removeCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
  }) {
    return removeCondition?.call(discountId, conditionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult Function(String discountId)? delete,
    TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult Function(String discountId, String conditionId)? removeCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (removeCondition != null) {
      return removeCondition(discountId, conditionId);
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
    required TResult Function(_AddCondition value) addCondition,
    required TResult Function(_RemoveCondition value) removeCondition,
    required TResult Function(_AddItemsToCondition value) addItemsToCondition,
    required TResult Function(_RemoveItemsFromCondition value)
        removeItemsFromCondition,
  }) {
    return removeCondition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddCondition value)? addCondition,
    TResult? Function(_RemoveCondition value)? removeCondition,
    TResult? Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult? Function(_RemoveItemsFromCondition value)?
        removeItemsFromCondition,
  }) {
    return removeCondition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddCondition value)? addCondition,
    TResult Function(_RemoveCondition value)? removeCondition,
    TResult Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult Function(_RemoveItemsFromCondition value)? removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (removeCondition != null) {
      return removeCondition(this);
    }
    return orElse();
  }
}

abstract class _RemoveCondition implements DiscountCrudEvent {
  const factory _RemoveCondition(
          final String discountId, final String conditionId) =
      _$RemoveConditionImpl;

  String get discountId;
  String get conditionId;
  @JsonKey(ignore: true)
  _$$RemoveConditionImplCopyWith<_$RemoveConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddItemsToConditionImplCopyWith<$Res> {
  factory _$$AddItemsToConditionImplCopyWith(_$AddItemsToConditionImpl value,
          $Res Function(_$AddItemsToConditionImpl) then) =
      __$$AddItemsToConditionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String discountId, String conditionId, List<String> itemIds});
}

/// @nodoc
class __$$AddItemsToConditionImplCopyWithImpl<$Res>
    extends _$DiscountCrudEventCopyWithImpl<$Res, _$AddItemsToConditionImpl>
    implements _$$AddItemsToConditionImplCopyWith<$Res> {
  __$$AddItemsToConditionImplCopyWithImpl(_$AddItemsToConditionImpl _value,
      $Res Function(_$AddItemsToConditionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountId = null,
    Object? conditionId = null,
    Object? itemIds = null,
  }) {
    return _then(_$AddItemsToConditionImpl(
      null == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as String,
      null == conditionId
          ? _value.conditionId
          : conditionId // ignore: cast_nullable_to_non_nullable
              as String,
      null == itemIds
          ? _value._itemIds
          : itemIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AddItemsToConditionImpl implements _AddItemsToCondition {
  const _$AddItemsToConditionImpl(
      this.discountId, this.conditionId, final List<String> itemIds)
      : _itemIds = itemIds;

  @override
  final String discountId;
  @override
  final String conditionId;
  final List<String> _itemIds;
  @override
  List<String> get itemIds {
    if (_itemIds is EqualUnmodifiableListView) return _itemIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemIds);
  }

  @override
  String toString() {
    return 'DiscountCrudEvent.addItemsToCondition(discountId: $discountId, conditionId: $conditionId, itemIds: $itemIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemsToConditionImpl &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId) &&
            (identical(other.conditionId, conditionId) ||
                other.conditionId == conditionId) &&
            const DeepCollectionEquality().equals(other._itemIds, _itemIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discountId, conditionId,
      const DeepCollectionEquality().hash(_itemIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemsToConditionImplCopyWith<_$AddItemsToConditionImpl> get copyWith =>
      __$$AddItemsToConditionImplCopyWithImpl<_$AddItemsToConditionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            String id, UserUpdateDiscountReq userUpdateDiscountReq)
        update,
    required TResult Function(UserCreateDiscountReq userCreateDiscountReq)
        create,
    required TResult Function(String discountId) delete,
    required TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)
        addCondition,
    required TResult Function(String discountId, String conditionId)
        removeCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        addItemsToCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        removeItemsFromCondition,
  }) {
    return addItemsToCondition(discountId, conditionId, itemIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult? Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult? Function(String discountId)? delete,
    TResult? Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult? Function(String discountId, String conditionId)? removeCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
  }) {
    return addItemsToCondition?.call(discountId, conditionId, itemIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult Function(String discountId)? delete,
    TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult Function(String discountId, String conditionId)? removeCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (addItemsToCondition != null) {
      return addItemsToCondition(discountId, conditionId, itemIds);
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
    required TResult Function(_AddCondition value) addCondition,
    required TResult Function(_RemoveCondition value) removeCondition,
    required TResult Function(_AddItemsToCondition value) addItemsToCondition,
    required TResult Function(_RemoveItemsFromCondition value)
        removeItemsFromCondition,
  }) {
    return addItemsToCondition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddCondition value)? addCondition,
    TResult? Function(_RemoveCondition value)? removeCondition,
    TResult? Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult? Function(_RemoveItemsFromCondition value)?
        removeItemsFromCondition,
  }) {
    return addItemsToCondition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddCondition value)? addCondition,
    TResult Function(_RemoveCondition value)? removeCondition,
    TResult Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult Function(_RemoveItemsFromCondition value)? removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (addItemsToCondition != null) {
      return addItemsToCondition(this);
    }
    return orElse();
  }
}

abstract class _AddItemsToCondition implements DiscountCrudEvent {
  const factory _AddItemsToCondition(
      final String discountId,
      final String conditionId,
      final List<String> itemIds) = _$AddItemsToConditionImpl;

  String get discountId;
  String get conditionId;
  List<String> get itemIds;
  @JsonKey(ignore: true)
  _$$AddItemsToConditionImplCopyWith<_$AddItemsToConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveItemsFromConditionImplCopyWith<$Res> {
  factory _$$RemoveItemsFromConditionImplCopyWith(
          _$RemoveItemsFromConditionImpl value,
          $Res Function(_$RemoveItemsFromConditionImpl) then) =
      __$$RemoveItemsFromConditionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String discountId, String conditionId, List<String> itemIds});
}

/// @nodoc
class __$$RemoveItemsFromConditionImplCopyWithImpl<$Res>
    extends _$DiscountCrudEventCopyWithImpl<$Res,
        _$RemoveItemsFromConditionImpl>
    implements _$$RemoveItemsFromConditionImplCopyWith<$Res> {
  __$$RemoveItemsFromConditionImplCopyWithImpl(
      _$RemoveItemsFromConditionImpl _value,
      $Res Function(_$RemoveItemsFromConditionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountId = null,
    Object? conditionId = null,
    Object? itemIds = null,
  }) {
    return _then(_$RemoveItemsFromConditionImpl(
      null == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as String,
      null == conditionId
          ? _value.conditionId
          : conditionId // ignore: cast_nullable_to_non_nullable
              as String,
      null == itemIds
          ? _value._itemIds
          : itemIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$RemoveItemsFromConditionImpl implements _RemoveItemsFromCondition {
  const _$RemoveItemsFromConditionImpl(
      this.discountId, this.conditionId, final List<String> itemIds)
      : _itemIds = itemIds;

  @override
  final String discountId;
  @override
  final String conditionId;
  final List<String> _itemIds;
  @override
  List<String> get itemIds {
    if (_itemIds is EqualUnmodifiableListView) return _itemIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemIds);
  }

  @override
  String toString() {
    return 'DiscountCrudEvent.removeItemsFromCondition(discountId: $discountId, conditionId: $conditionId, itemIds: $itemIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemsFromConditionImpl &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId) &&
            (identical(other.conditionId, conditionId) ||
                other.conditionId == conditionId) &&
            const DeepCollectionEquality().equals(other._itemIds, _itemIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discountId, conditionId,
      const DeepCollectionEquality().hash(_itemIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveItemsFromConditionImplCopyWith<_$RemoveItemsFromConditionImpl>
      get copyWith => __$$RemoveItemsFromConditionImplCopyWithImpl<
          _$RemoveItemsFromConditionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(
            String id, UserUpdateDiscountReq userUpdateDiscountReq)
        update,
    required TResult Function(UserCreateDiscountReq userCreateDiscountReq)
        create,
    required TResult Function(String discountId) delete,
    required TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)
        addCondition,
    required TResult Function(String discountId, String conditionId)
        removeCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        addItemsToCondition,
    required TResult Function(
            String discountId, String conditionId, List<String> itemIds)
        removeItemsFromCondition,
  }) {
    return removeItemsFromCondition(discountId, conditionId, itemIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult? Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult? Function(String discountId)? delete,
    TResult? Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult? Function(String discountId, String conditionId)? removeCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult? Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
  }) {
    return removeItemsFromCondition?.call(discountId, conditionId, itemIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id, UserUpdateDiscountReq userUpdateDiscountReq)?
        update,
    TResult Function(UserCreateDiscountReq userCreateDiscountReq)? create,
    TResult Function(String discountId)? delete,
    TResult Function(
            String discountId, UserCreateConditionReq userCreateConditionReq)?
        addCondition,
    TResult Function(String discountId, String conditionId)? removeCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        addItemsToCondition,
    TResult Function(
            String discountId, String conditionId, List<String> itemIds)?
        removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (removeItemsFromCondition != null) {
      return removeItemsFromCondition(discountId, conditionId, itemIds);
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
    required TResult Function(_AddCondition value) addCondition,
    required TResult Function(_RemoveCondition value) removeCondition,
    required TResult Function(_AddItemsToCondition value) addItemsToCondition,
    required TResult Function(_RemoveItemsFromCondition value)
        removeItemsFromCondition,
  }) {
    return removeItemsFromCondition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Update value)? update,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_AddCondition value)? addCondition,
    TResult? Function(_RemoveCondition value)? removeCondition,
    TResult? Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult? Function(_RemoveItemsFromCondition value)?
        removeItemsFromCondition,
  }) {
    return removeItemsFromCondition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Update value)? update,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    TResult Function(_AddCondition value)? addCondition,
    TResult Function(_RemoveCondition value)? removeCondition,
    TResult Function(_AddItemsToCondition value)? addItemsToCondition,
    TResult Function(_RemoveItemsFromCondition value)? removeItemsFromCondition,
    required TResult orElse(),
  }) {
    if (removeItemsFromCondition != null) {
      return removeItemsFromCondition(this);
    }
    return orElse();
  }
}

abstract class _RemoveItemsFromCondition implements DiscountCrudEvent {
  const factory _RemoveItemsFromCondition(
      final String discountId,
      final String conditionId,
      final List<String> itemIds) = _$RemoveItemsFromConditionImpl;

  String get discountId;
  String get conditionId;
  List<String> get itemIds;
  @JsonKey(ignore: true)
  _$$RemoveItemsFromConditionImplCopyWith<_$RemoveItemsFromConditionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiscountCrudState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? discountId) loading,
    required TResult Function(Discount discount) discount,
    required TResult Function(List<Discount> discounts, int count) discounts,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? discountId)? loading,
    TResult? Function(Discount discount)? discount,
    TResult? Function(List<Discount> discounts, int count)? discounts,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? discountId)? loading,
    TResult Function(Discount discount)? discount,
    TResult Function(List<Discount> discounts, int count)? discounts,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Discount value) discount,
    required TResult Function(_Discounts value) discounts,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Discount value)? discount,
    TResult? Function(_Discounts value)? discounts,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Discount value)? discount,
    TResult Function(_Discounts value)? discounts,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountCrudStateCopyWith<$Res> {
  factory $DiscountCrudStateCopyWith(
          DiscountCrudState value, $Res Function(DiscountCrudState) then) =
      _$DiscountCrudStateCopyWithImpl<$Res, DiscountCrudState>;
}

/// @nodoc
class _$DiscountCrudStateCopyWithImpl<$Res, $Val extends DiscountCrudState>
    implements $DiscountCrudStateCopyWith<$Res> {
  _$DiscountCrudStateCopyWithImpl(this._value, this._then);

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
    extends _$DiscountCrudStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'DiscountCrudState.initial()';
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
    required TResult Function(String? discountId) loading,
    required TResult Function(Discount discount) discount,
    required TResult Function(List<Discount> discounts, int count) discounts,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? discountId)? loading,
    TResult? Function(Discount discount)? discount,
    TResult? Function(List<Discount> discounts, int count)? discounts,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? discountId)? loading,
    TResult Function(Discount discount)? discount,
    TResult Function(List<Discount> discounts, int count)? discounts,
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
    required TResult Function(_Discount value) discount,
    required TResult Function(_Discounts value) discounts,
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
    TResult? Function(_Discount value)? discount,
    TResult? Function(_Discounts value)? discounts,
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
    TResult Function(_Discount value)? discount,
    TResult Function(_Discounts value)? discounts,
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

abstract class _Initial implements DiscountCrudState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? discountId});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$DiscountCrudStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountId = freezed,
  }) {
    return _then(_$LoadingImpl(
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({this.discountId});

  @override
  final String? discountId;

  @override
  String toString() {
    return 'DiscountCrudState.loading(discountId: $discountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discountId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? discountId) loading,
    required TResult Function(Discount discount) discount,
    required TResult Function(List<Discount> discounts, int count) discounts,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return loading(discountId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? discountId)? loading,
    TResult? Function(Discount discount)? discount,
    TResult? Function(List<Discount> discounts, int count)? discounts,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return loading?.call(discountId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? discountId)? loading,
    TResult Function(Discount discount)? discount,
    TResult Function(List<Discount> discounts, int count)? discounts,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(discountId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Discount value) discount,
    required TResult Function(_Discounts value) discounts,
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
    TResult? Function(_Discount value)? discount,
    TResult? Function(_Discounts value)? discounts,
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
    TResult Function(_Discount value)? discount,
    TResult Function(_Discounts value)? discounts,
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

abstract class _Loading implements DiscountCrudState {
  const factory _Loading({final String? discountId}) = _$LoadingImpl;

  String? get discountId;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DiscountImplCopyWith<$Res> {
  factory _$$DiscountImplCopyWith(
          _$DiscountImpl value, $Res Function(_$DiscountImpl) then) =
      __$$DiscountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Discount discount});
}

/// @nodoc
class __$$DiscountImplCopyWithImpl<$Res>
    extends _$DiscountCrudStateCopyWithImpl<$Res, _$DiscountImpl>
    implements _$$DiscountImplCopyWith<$Res> {
  __$$DiscountImplCopyWithImpl(
      _$DiscountImpl _value, $Res Function(_$DiscountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = null,
  }) {
    return _then(_$DiscountImpl(
      null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as Discount,
    ));
  }
}

/// @nodoc

class _$DiscountImpl implements _Discount {
  const _$DiscountImpl(this.discount);

  @override
  final Discount discount;

  @override
  String toString() {
    return 'DiscountCrudState.discount(discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountImpl &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountImplCopyWith<_$DiscountImpl> get copyWith =>
      __$$DiscountImplCopyWithImpl<_$DiscountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? discountId) loading,
    required TResult Function(Discount discount) discount,
    required TResult Function(List<Discount> discounts, int count) discounts,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return discount(this.discount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? discountId)? loading,
    TResult? Function(Discount discount)? discount,
    TResult? Function(List<Discount> discounts, int count)? discounts,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return discount?.call(this.discount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? discountId)? loading,
    TResult Function(Discount discount)? discount,
    TResult Function(List<Discount> discounts, int count)? discounts,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (discount != null) {
      return discount(this.discount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Discount value) discount,
    required TResult Function(_Discounts value) discounts,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return discount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Discount value)? discount,
    TResult? Function(_Discounts value)? discounts,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return discount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Discount value)? discount,
    TResult Function(_Discounts value)? discounts,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (discount != null) {
      return discount(this);
    }
    return orElse();
  }
}

abstract class _Discount implements DiscountCrudState {
  const factory _Discount(final Discount discount) = _$DiscountImpl;

  Discount get discount;
  @JsonKey(ignore: true)
  _$$DiscountImplCopyWith<_$DiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DiscountsImplCopyWith<$Res> {
  factory _$$DiscountsImplCopyWith(
          _$DiscountsImpl value, $Res Function(_$DiscountsImpl) then) =
      __$$DiscountsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Discount> discounts, int count});
}

/// @nodoc
class __$$DiscountsImplCopyWithImpl<$Res>
    extends _$DiscountCrudStateCopyWithImpl<$Res, _$DiscountsImpl>
    implements _$$DiscountsImplCopyWith<$Res> {
  __$$DiscountsImplCopyWithImpl(
      _$DiscountsImpl _value, $Res Function(_$DiscountsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discounts = null,
    Object? count = null,
  }) {
    return _then(_$DiscountsImpl(
      null == discounts
          ? _value._discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as List<Discount>,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DiscountsImpl implements _Discounts {
  const _$DiscountsImpl(final List<Discount> discounts, this.count)
      : _discounts = discounts;

  final List<Discount> _discounts;
  @override
  List<Discount> get discounts {
    if (_discounts is EqualUnmodifiableListView) return _discounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discounts);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'DiscountCrudState.discounts(discounts: $discounts, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountsImpl &&
            const DeepCollectionEquality()
                .equals(other._discounts, _discounts) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_discounts), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountsImplCopyWith<_$DiscountsImpl> get copyWith =>
      __$$DiscountsImplCopyWithImpl<_$DiscountsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? discountId) loading,
    required TResult Function(Discount discount) discount,
    required TResult Function(List<Discount> discounts, int count) discounts,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return discounts(this.discounts, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? discountId)? loading,
    TResult? Function(Discount discount)? discount,
    TResult? Function(List<Discount> discounts, int count)? discounts,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return discounts?.call(this.discounts, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? discountId)? loading,
    TResult Function(Discount discount)? discount,
    TResult Function(List<Discount> discounts, int count)? discounts,
    TResult Function(Failure failure)? error,
    TResult Function()? deleted,
    required TResult orElse(),
  }) {
    if (discounts != null) {
      return discounts(this.discounts, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Discount value) discount,
    required TResult Function(_Discounts value) discounts,
    required TResult Function(_Error value) error,
    required TResult Function(_Deleted value) deleted,
  }) {
    return discounts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Discount value)? discount,
    TResult? Function(_Discounts value)? discounts,
    TResult? Function(_Error value)? error,
    TResult? Function(_Deleted value)? deleted,
  }) {
    return discounts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Discount value)? discount,
    TResult Function(_Discounts value)? discounts,
    TResult Function(_Error value)? error,
    TResult Function(_Deleted value)? deleted,
    required TResult orElse(),
  }) {
    if (discounts != null) {
      return discounts(this);
    }
    return orElse();
  }
}

abstract class _Discounts implements DiscountCrudState {
  const factory _Discounts(final List<Discount> discounts, final int count) =
      _$DiscountsImpl;

  List<Discount> get discounts;
  int get count;
  @JsonKey(ignore: true)
  _$$DiscountsImplCopyWith<_$DiscountsImpl> get copyWith =>
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
    extends _$DiscountCrudStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'DiscountCrudState.error(failure: $failure)';
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
    required TResult Function(String? discountId) loading,
    required TResult Function(Discount discount) discount,
    required TResult Function(List<Discount> discounts, int count) discounts,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? discountId)? loading,
    TResult? Function(Discount discount)? discount,
    TResult? Function(List<Discount> discounts, int count)? discounts,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? discountId)? loading,
    TResult Function(Discount discount)? discount,
    TResult Function(List<Discount> discounts, int count)? discounts,
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
    required TResult Function(_Discount value) discount,
    required TResult Function(_Discounts value) discounts,
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
    TResult? Function(_Discount value)? discount,
    TResult? Function(_Discounts value)? discounts,
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
    TResult Function(_Discount value)? discount,
    TResult Function(_Discounts value)? discounts,
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

abstract class _Error implements DiscountCrudState {
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
    extends _$DiscountCrudStateCopyWithImpl<$Res, _$DeletedImpl>
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
    return 'DiscountCrudState.deleted()';
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
    required TResult Function(String? discountId) loading,
    required TResult Function(Discount discount) discount,
    required TResult Function(List<Discount> discounts, int count) discounts,
    required TResult Function(Failure failure) error,
    required TResult Function() deleted,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? discountId)? loading,
    TResult? Function(Discount discount)? discount,
    TResult? Function(List<Discount> discounts, int count)? discounts,
    TResult? Function(Failure failure)? error,
    TResult? Function()? deleted,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? discountId)? loading,
    TResult Function(Discount discount)? discount,
    TResult Function(List<Discount> discounts, int count)? discounts,
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
    required TResult Function(_Discount value) discount,
    required TResult Function(_Discounts value) discounts,
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
    TResult? Function(_Discount value)? discount,
    TResult? Function(_Discounts value)? discounts,
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
    TResult Function(_Discount value)? discount,
    TResult Function(_Discounts value)? discounts,
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

abstract class _Deleted implements DiscountCrudState {
  const factory _Deleted() = _$DeletedImpl;
}
