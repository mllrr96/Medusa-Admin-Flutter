// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_crud_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GroupCrudEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(String name, Map<String, dynamic>? metadata)
        create,
    required TResult Function(
            String id, String name, Map<String, dynamic>? metadata)
        update,
    required TResult Function(String id, List<String> customerIds) addCustomers,
    required TResult Function(String id, List<String> customerIds)
        removeCustomers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(String name, Map<String, dynamic>? metadata)? create,
    TResult? Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult? Function(String id, List<String> customerIds)? addCustomers,
    TResult? Function(String id, List<String> customerIds)? removeCustomers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(String name, Map<String, dynamic>? metadata)? create,
    TResult Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult Function(String id, List<String> customerIds)? addCustomers,
    TResult Function(String id, List<String> customerIds)? removeCustomers,
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
    required TResult Function(_AddCustomers value) addCustomers,
    required TResult Function(_RemoveCustomers value) removeCustomers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_AddCustomers value)? addCustomers,
    TResult? Function(_RemoveCustomers value)? removeCustomers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_AddCustomers value)? addCustomers,
    TResult Function(_RemoveCustomers value)? removeCustomers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCrudEventCopyWith<$Res> {
  factory $GroupCrudEventCopyWith(
          GroupCrudEvent value, $Res Function(GroupCrudEvent) then) =
      _$GroupCrudEventCopyWithImpl<$Res, GroupCrudEvent>;
}

/// @nodoc
class _$GroupCrudEventCopyWithImpl<$Res, $Val extends GroupCrudEvent>
    implements $GroupCrudEventCopyWith<$Res> {
  _$GroupCrudEventCopyWithImpl(this._value, this._then);

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
    extends _$GroupCrudEventCopyWithImpl<$Res, _$LoadImpl>
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
    return 'GroupCrudEvent.load(id: $id)';
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
    required TResult Function(String id) delete,
    required TResult Function(String name, Map<String, dynamic>? metadata)
        create,
    required TResult Function(
            String id, String name, Map<String, dynamic>? metadata)
        update,
    required TResult Function(String id, List<String> customerIds) addCustomers,
    required TResult Function(String id, List<String> customerIds)
        removeCustomers,
  }) {
    return load(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(String name, Map<String, dynamic>? metadata)? create,
    TResult? Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult? Function(String id, List<String> customerIds)? addCustomers,
    TResult? Function(String id, List<String> customerIds)? removeCustomers,
  }) {
    return load?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(String name, Map<String, dynamic>? metadata)? create,
    TResult Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult Function(String id, List<String> customerIds)? addCustomers,
    TResult Function(String id, List<String> customerIds)? removeCustomers,
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
    required TResult Function(_Delete value) delete,
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_AddCustomers value) addCustomers,
    required TResult Function(_RemoveCustomers value) removeCustomers,
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
    TResult? Function(_AddCustomers value)? addCustomers,
    TResult? Function(_RemoveCustomers value)? removeCustomers,
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
    TResult Function(_AddCustomers value)? addCustomers,
    TResult Function(_RemoveCustomers value)? removeCustomers,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements GroupCrudEvent {
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
    extends _$GroupCrudEventCopyWithImpl<$Res, _$LoadAllImpl>
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
    return 'GroupCrudEvent.loadAll(queryParameters: $queryParameters)';
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
    required TResult Function(String id) delete,
    required TResult Function(String name, Map<String, dynamic>? metadata)
        create,
    required TResult Function(
            String id, String name, Map<String, dynamic>? metadata)
        update,
    required TResult Function(String id, List<String> customerIds) addCustomers,
    required TResult Function(String id, List<String> customerIds)
        removeCustomers,
  }) {
    return loadAll(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(String name, Map<String, dynamic>? metadata)? create,
    TResult? Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult? Function(String id, List<String> customerIds)? addCustomers,
    TResult? Function(String id, List<String> customerIds)? removeCustomers,
  }) {
    return loadAll?.call(queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(String name, Map<String, dynamic>? metadata)? create,
    TResult Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult Function(String id, List<String> customerIds)? addCustomers,
    TResult Function(String id, List<String> customerIds)? removeCustomers,
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
    required TResult Function(_AddCustomers value) addCustomers,
    required TResult Function(_RemoveCustomers value) removeCustomers,
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
    TResult? Function(_AddCustomers value)? addCustomers,
    TResult? Function(_RemoveCustomers value)? removeCustomers,
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
    TResult Function(_AddCustomers value)? addCustomers,
    TResult Function(_RemoveCustomers value)? removeCustomers,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class _LoadAll implements GroupCrudEvent {
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
    extends _$GroupCrudEventCopyWithImpl<$Res, _$DeleteImpl>
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
    return 'GroupCrudEvent.delete(id: $id)';
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
    required TResult Function(String id) delete,
    required TResult Function(String name, Map<String, dynamic>? metadata)
        create,
    required TResult Function(
            String id, String name, Map<String, dynamic>? metadata)
        update,
    required TResult Function(String id, List<String> customerIds) addCustomers,
    required TResult Function(String id, List<String> customerIds)
        removeCustomers,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(String name, Map<String, dynamic>? metadata)? create,
    TResult? Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult? Function(String id, List<String> customerIds)? addCustomers,
    TResult? Function(String id, List<String> customerIds)? removeCustomers,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(String name, Map<String, dynamic>? metadata)? create,
    TResult Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult Function(String id, List<String> customerIds)? addCustomers,
    TResult Function(String id, List<String> customerIds)? removeCustomers,
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
    required TResult Function(_AddCustomers value) addCustomers,
    required TResult Function(_RemoveCustomers value) removeCustomers,
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
    TResult? Function(_AddCustomers value)? addCustomers,
    TResult? Function(_RemoveCustomers value)? removeCustomers,
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
    TResult Function(_AddCustomers value)? addCustomers,
    TResult Function(_RemoveCustomers value)? removeCustomers,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements GroupCrudEvent {
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
  $Res call({String name, Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$GroupCrudEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? metadata = freezed,
  }) {
    return _then(_$CreateImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(this.name, final Map<String, dynamic>? metadata)
      : _metadata = metadata;

  @override
  final String name;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GroupCrudEvent.create(name: $name, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_metadata));

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
    required TResult Function(String id) delete,
    required TResult Function(String name, Map<String, dynamic>? metadata)
        create,
    required TResult Function(
            String id, String name, Map<String, dynamic>? metadata)
        update,
    required TResult Function(String id, List<String> customerIds) addCustomers,
    required TResult Function(String id, List<String> customerIds)
        removeCustomers,
  }) {
    return create(name, metadata);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(String name, Map<String, dynamic>? metadata)? create,
    TResult? Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult? Function(String id, List<String> customerIds)? addCustomers,
    TResult? Function(String id, List<String> customerIds)? removeCustomers,
  }) {
    return create?.call(name, metadata);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(String name, Map<String, dynamic>? metadata)? create,
    TResult Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult Function(String id, List<String> customerIds)? addCustomers,
    TResult Function(String id, List<String> customerIds)? removeCustomers,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(name, metadata);
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
    required TResult Function(_AddCustomers value) addCustomers,
    required TResult Function(_RemoveCustomers value) removeCustomers,
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
    TResult? Function(_AddCustomers value)? addCustomers,
    TResult? Function(_RemoveCustomers value)? removeCustomers,
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
    TResult Function(_AddCustomers value)? addCustomers,
    TResult Function(_RemoveCustomers value)? removeCustomers,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements GroupCrudEvent {
  const factory _Create(
      final String name, final Map<String, dynamic>? metadata) = _$CreateImpl;

  String get name;
  Map<String, dynamic>? get metadata;
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
  $Res call({String id, String name, Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$GroupCrudEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? metadata = freezed,
  }) {
    return _then(_$UpdateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.id, this.name, final Map<String, dynamic>? metadata)
      : _metadata = metadata;

  @override
  final String id;
  @override
  final String name;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GroupCrudEvent.update(id: $id, name: $name, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_metadata));

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
    required TResult Function(String id) delete,
    required TResult Function(String name, Map<String, dynamic>? metadata)
        create,
    required TResult Function(
            String id, String name, Map<String, dynamic>? metadata)
        update,
    required TResult Function(String id, List<String> customerIds) addCustomers,
    required TResult Function(String id, List<String> customerIds)
        removeCustomers,
  }) {
    return update(id, name, metadata);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(String name, Map<String, dynamic>? metadata)? create,
    TResult? Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult? Function(String id, List<String> customerIds)? addCustomers,
    TResult? Function(String id, List<String> customerIds)? removeCustomers,
  }) {
    return update?.call(id, name, metadata);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(String name, Map<String, dynamic>? metadata)? create,
    TResult Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult Function(String id, List<String> customerIds)? addCustomers,
    TResult Function(String id, List<String> customerIds)? removeCustomers,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, name, metadata);
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
    required TResult Function(_AddCustomers value) addCustomers,
    required TResult Function(_RemoveCustomers value) removeCustomers,
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
    TResult? Function(_AddCustomers value)? addCustomers,
    TResult? Function(_RemoveCustomers value)? removeCustomers,
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
    TResult Function(_AddCustomers value)? addCustomers,
    TResult Function(_RemoveCustomers value)? removeCustomers,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements GroupCrudEvent {
  const factory _Update(final String id, final String name,
      final Map<String, dynamic>? metadata) = _$UpdateImpl;

  String get id;
  String get name;
  Map<String, dynamic>? get metadata;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddCustomersImplCopyWith<$Res> {
  factory _$$AddCustomersImplCopyWith(
          _$AddCustomersImpl value, $Res Function(_$AddCustomersImpl) then) =
      __$$AddCustomersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, List<String> customerIds});
}

/// @nodoc
class __$$AddCustomersImplCopyWithImpl<$Res>
    extends _$GroupCrudEventCopyWithImpl<$Res, _$AddCustomersImpl>
    implements _$$AddCustomersImplCopyWith<$Res> {
  __$$AddCustomersImplCopyWithImpl(
      _$AddCustomersImpl _value, $Res Function(_$AddCustomersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerIds = null,
  }) {
    return _then(_$AddCustomersImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == customerIds
          ? _value._customerIds
          : customerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AddCustomersImpl implements _AddCustomers {
  const _$AddCustomersImpl(this.id, final List<String> customerIds)
      : _customerIds = customerIds;

  @override
  final String id;
  final List<String> _customerIds;
  @override
  List<String> get customerIds {
    if (_customerIds is EqualUnmodifiableListView) return _customerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerIds);
  }

  @override
  String toString() {
    return 'GroupCrudEvent.addCustomers(id: $id, customerIds: $customerIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCustomersImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._customerIds, _customerIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_customerIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCustomersImplCopyWith<_$AddCustomersImpl> get copyWith =>
      __$$AddCustomersImplCopyWithImpl<_$AddCustomersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(String name, Map<String, dynamic>? metadata)
        create,
    required TResult Function(
            String id, String name, Map<String, dynamic>? metadata)
        update,
    required TResult Function(String id, List<String> customerIds) addCustomers,
    required TResult Function(String id, List<String> customerIds)
        removeCustomers,
  }) {
    return addCustomers(id, customerIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(String name, Map<String, dynamic>? metadata)? create,
    TResult? Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult? Function(String id, List<String> customerIds)? addCustomers,
    TResult? Function(String id, List<String> customerIds)? removeCustomers,
  }) {
    return addCustomers?.call(id, customerIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(String name, Map<String, dynamic>? metadata)? create,
    TResult Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult Function(String id, List<String> customerIds)? addCustomers,
    TResult Function(String id, List<String> customerIds)? removeCustomers,
    required TResult orElse(),
  }) {
    if (addCustomers != null) {
      return addCustomers(id, customerIds);
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
    required TResult Function(_AddCustomers value) addCustomers,
    required TResult Function(_RemoveCustomers value) removeCustomers,
  }) {
    return addCustomers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_AddCustomers value)? addCustomers,
    TResult? Function(_RemoveCustomers value)? removeCustomers,
  }) {
    return addCustomers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_AddCustomers value)? addCustomers,
    TResult Function(_RemoveCustomers value)? removeCustomers,
    required TResult orElse(),
  }) {
    if (addCustomers != null) {
      return addCustomers(this);
    }
    return orElse();
  }
}

abstract class _AddCustomers implements GroupCrudEvent {
  const factory _AddCustomers(final String id, final List<String> customerIds) =
      _$AddCustomersImpl;

  String get id;
  List<String> get customerIds;
  @JsonKey(ignore: true)
  _$$AddCustomersImplCopyWith<_$AddCustomersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveCustomersImplCopyWith<$Res> {
  factory _$$RemoveCustomersImplCopyWith(_$RemoveCustomersImpl value,
          $Res Function(_$RemoveCustomersImpl) then) =
      __$$RemoveCustomersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, List<String> customerIds});
}

/// @nodoc
class __$$RemoveCustomersImplCopyWithImpl<$Res>
    extends _$GroupCrudEventCopyWithImpl<$Res, _$RemoveCustomersImpl>
    implements _$$RemoveCustomersImplCopyWith<$Res> {
  __$$RemoveCustomersImplCopyWithImpl(
      _$RemoveCustomersImpl _value, $Res Function(_$RemoveCustomersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerIds = null,
  }) {
    return _then(_$RemoveCustomersImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == customerIds
          ? _value._customerIds
          : customerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$RemoveCustomersImpl implements _RemoveCustomers {
  const _$RemoveCustomersImpl(this.id, final List<String> customerIds)
      : _customerIds = customerIds;

  @override
  final String id;
  final List<String> _customerIds;
  @override
  List<String> get customerIds {
    if (_customerIds is EqualUnmodifiableListView) return _customerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerIds);
  }

  @override
  String toString() {
    return 'GroupCrudEvent.removeCustomers(id: $id, customerIds: $customerIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveCustomersImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._customerIds, _customerIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_customerIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveCustomersImplCopyWith<_$RemoveCustomersImpl> get copyWith =>
      __$$RemoveCustomersImplCopyWithImpl<_$RemoveCustomersImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) load,
    required TResult Function(Map<String, dynamic>? queryParameters) loadAll,
    required TResult Function(String id) delete,
    required TResult Function(String name, Map<String, dynamic>? metadata)
        create,
    required TResult Function(
            String id, String name, Map<String, dynamic>? metadata)
        update,
    required TResult Function(String id, List<String> customerIds) addCustomers,
    required TResult Function(String id, List<String> customerIds)
        removeCustomers,
  }) {
    return removeCustomers(id, customerIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? load,
    TResult? Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult? Function(String id)? delete,
    TResult? Function(String name, Map<String, dynamic>? metadata)? create,
    TResult? Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult? Function(String id, List<String> customerIds)? addCustomers,
    TResult? Function(String id, List<String> customerIds)? removeCustomers,
  }) {
    return removeCustomers?.call(id, customerIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? load,
    TResult Function(Map<String, dynamic>? queryParameters)? loadAll,
    TResult Function(String id)? delete,
    TResult Function(String name, Map<String, dynamic>? metadata)? create,
    TResult Function(String id, String name, Map<String, dynamic>? metadata)?
        update,
    TResult Function(String id, List<String> customerIds)? addCustomers,
    TResult Function(String id, List<String> customerIds)? removeCustomers,
    required TResult orElse(),
  }) {
    if (removeCustomers != null) {
      return removeCustomers(id, customerIds);
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
    required TResult Function(_AddCustomers value) addCustomers,
    required TResult Function(_RemoveCustomers value) removeCustomers,
  }) {
    return removeCustomers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_AddCustomers value)? addCustomers,
    TResult? Function(_RemoveCustomers value)? removeCustomers,
  }) {
    return removeCustomers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_Delete value)? delete,
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_AddCustomers value)? addCustomers,
    TResult Function(_RemoveCustomers value)? removeCustomers,
    required TResult orElse(),
  }) {
    if (removeCustomers != null) {
      return removeCustomers(this);
    }
    return orElse();
  }
}

abstract class _RemoveCustomers implements GroupCrudEvent {
  const factory _RemoveCustomers(
      final String id, final List<String> customerIds) = _$RemoveCustomersImpl;

  String get id;
  List<String> get customerIds;
  @JsonKey(ignore: true)
  _$$RemoveCustomersImplCopyWith<_$RemoveCustomersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GroupCrudState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomerGroup group) group,
    required TResult Function(List<CustomerGroup> groups, int count) groups,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomerGroup group)? group,
    TResult? Function(List<CustomerGroup> groups, int count)? groups,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomerGroup group)? group,
    TResult Function(List<CustomerGroup> groups, int count)? groups,
    TResult Function()? deleted,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Group value) group,
    required TResult Function(_Groups value) groups,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Group value)? group,
    TResult? Function(_Groups value)? groups,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Group value)? group,
    TResult Function(_Groups value)? groups,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCrudStateCopyWith<$Res> {
  factory $GroupCrudStateCopyWith(
          GroupCrudState value, $Res Function(GroupCrudState) then) =
      _$GroupCrudStateCopyWithImpl<$Res, GroupCrudState>;
}

/// @nodoc
class _$GroupCrudStateCopyWithImpl<$Res, $Val extends GroupCrudState>
    implements $GroupCrudStateCopyWith<$Res> {
  _$GroupCrudStateCopyWithImpl(this._value, this._then);

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
    extends _$GroupCrudStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'GroupCrudState.initial()';
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
    required TResult Function(CustomerGroup group) group,
    required TResult Function(List<CustomerGroup> groups, int count) groups,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomerGroup group)? group,
    TResult? Function(List<CustomerGroup> groups, int count)? groups,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomerGroup group)? group,
    TResult Function(List<CustomerGroup> groups, int count)? groups,
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
    required TResult Function(_Group value) group,
    required TResult Function(_Groups value) groups,
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
    TResult? Function(_Group value)? group,
    TResult? Function(_Groups value)? groups,
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
    TResult Function(_Group value)? group,
    TResult Function(_Groups value)? groups,
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

abstract class _Initial implements GroupCrudState {
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
    extends _$GroupCrudStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'GroupCrudState.loading()';
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
    required TResult Function(CustomerGroup group) group,
    required TResult Function(List<CustomerGroup> groups, int count) groups,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomerGroup group)? group,
    TResult? Function(List<CustomerGroup> groups, int count)? groups,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomerGroup group)? group,
    TResult Function(List<CustomerGroup> groups, int count)? groups,
    TResult Function()? deleted,
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
    required TResult Function(_Group value) group,
    required TResult Function(_Groups value) groups,
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
    TResult? Function(_Group value)? group,
    TResult? Function(_Groups value)? groups,
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
    TResult Function(_Group value)? group,
    TResult Function(_Groups value)? groups,
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

abstract class _Loading implements GroupCrudState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$GroupImplCopyWith<$Res> {
  factory _$$GroupImplCopyWith(
          _$GroupImpl value, $Res Function(_$GroupImpl) then) =
      __$$GroupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerGroup group});
}

/// @nodoc
class __$$GroupImplCopyWithImpl<$Res>
    extends _$GroupCrudStateCopyWithImpl<$Res, _$GroupImpl>
    implements _$$GroupImplCopyWith<$Res> {
  __$$GroupImplCopyWithImpl(
      _$GroupImpl _value, $Res Function(_$GroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
  }) {
    return _then(_$GroupImpl(
      null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as CustomerGroup,
    ));
  }
}

/// @nodoc

class _$GroupImpl implements _Group {
  const _$GroupImpl(this.group);

  @override
  final CustomerGroup group;

  @override
  String toString() {
    return 'GroupCrudState.group(group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupImpl &&
            (identical(other.group, group) || other.group == group));
  }

  @override
  int get hashCode => Object.hash(runtimeType, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      __$$GroupImplCopyWithImpl<_$GroupImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomerGroup group) group,
    required TResult Function(List<CustomerGroup> groups, int count) groups,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return group(this.group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomerGroup group)? group,
    TResult? Function(List<CustomerGroup> groups, int count)? groups,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return group?.call(this.group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomerGroup group)? group,
    TResult Function(List<CustomerGroup> groups, int count)? groups,
    TResult Function()? deleted,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(this.group);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Group value) group,
    required TResult Function(_Groups value) groups,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return group(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Group value)? group,
    TResult? Function(_Groups value)? groups,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return group?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Group value)? group,
    TResult Function(_Groups value)? groups,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(this);
    }
    return orElse();
  }
}

abstract class _Group implements GroupCrudState {
  const factory _Group(final CustomerGroup group) = _$GroupImpl;

  CustomerGroup get group;
  @JsonKey(ignore: true)
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupsImplCopyWith<$Res> {
  factory _$$GroupsImplCopyWith(
          _$GroupsImpl value, $Res Function(_$GroupsImpl) then) =
      __$$GroupsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CustomerGroup> groups, int count});
}

/// @nodoc
class __$$GroupsImplCopyWithImpl<$Res>
    extends _$GroupCrudStateCopyWithImpl<$Res, _$GroupsImpl>
    implements _$$GroupsImplCopyWith<$Res> {
  __$$GroupsImplCopyWithImpl(
      _$GroupsImpl _value, $Res Function(_$GroupsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = null,
    Object? count = null,
  }) {
    return _then(_$GroupsImpl(
      null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<CustomerGroup>,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GroupsImpl implements _Groups {
  const _$GroupsImpl(final List<CustomerGroup> groups, this.count)
      : _groups = groups;

  final List<CustomerGroup> _groups;
  @override
  List<CustomerGroup> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'GroupCrudState.groups(groups: $groups, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupsImpl &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_groups), count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupsImplCopyWith<_$GroupsImpl> get copyWith =>
      __$$GroupsImplCopyWithImpl<_$GroupsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CustomerGroup group) group,
    required TResult Function(List<CustomerGroup> groups, int count) groups,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return groups(this.groups, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomerGroup group)? group,
    TResult? Function(List<CustomerGroup> groups, int count)? groups,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return groups?.call(this.groups, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomerGroup group)? group,
    TResult Function(List<CustomerGroup> groups, int count)? groups,
    TResult Function()? deleted,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (groups != null) {
      return groups(this.groups, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Group value) group,
    required TResult Function(_Groups value) groups,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return groups(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Group value)? group,
    TResult? Function(_Groups value)? groups,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return groups?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Group value)? group,
    TResult Function(_Groups value)? groups,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (groups != null) {
      return groups(this);
    }
    return orElse();
  }
}

abstract class _Groups implements GroupCrudState {
  const factory _Groups(final List<CustomerGroup> groups, final int count) =
      _$GroupsImpl;

  List<CustomerGroup> get groups;
  int get count;
  @JsonKey(ignore: true)
  _$$GroupsImplCopyWith<_$GroupsImpl> get copyWith =>
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
    extends _$GroupCrudStateCopyWithImpl<$Res, _$DeletedImpl>
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
    return 'GroupCrudState.deleted()';
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
    required TResult Function(CustomerGroup group) group,
    required TResult Function(List<CustomerGroup> groups, int count) groups,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomerGroup group)? group,
    TResult? Function(List<CustomerGroup> groups, int count)? groups,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomerGroup group)? group,
    TResult Function(List<CustomerGroup> groups, int count)? groups,
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
    required TResult Function(_Group value) group,
    required TResult Function(_Groups value) groups,
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
    TResult? Function(_Group value)? group,
    TResult? Function(_Groups value)? groups,
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
    TResult Function(_Group value)? group,
    TResult Function(_Groups value)? groups,
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

abstract class _Deleted implements GroupCrudState {
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
    extends _$GroupCrudStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'GroupCrudState.error(failure: $failure)';
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
    required TResult Function(CustomerGroup group) group,
    required TResult Function(List<CustomerGroup> groups, int count) groups,
    required TResult Function() deleted,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CustomerGroup group)? group,
    TResult? Function(List<CustomerGroup> groups, int count)? groups,
    TResult? Function()? deleted,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CustomerGroup group)? group,
    TResult Function(List<CustomerGroup> groups, int count)? groups,
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
    required TResult Function(_Group value) group,
    required TResult Function(_Groups value) groups,
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
    TResult? Function(_Group value)? group,
    TResult? Function(_Groups value)? groups,
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
    TResult Function(_Group value)? group,
    TResult Function(_Groups value)? groups,
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

abstract class _Error implements GroupCrudState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
