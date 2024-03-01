// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_crud_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderCrudEvent {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(String id, UserUpdateOrderReq updateOrderReq)
        update,
    required TResult Function(String id) cancel,
    required TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)
        createFulfillment,
    required TResult Function(String id, String fulfillmentId)
        cancelFulfillment,
    required TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)
        createRefund,
    required TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)
        createOrderShipment,
    required TResult Function(String id) captureOrderPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult? Function(String id)? cancel,
    TResult? Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult? Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult? Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult? Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult? Function(String id)? captureOrderPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult Function(String id)? cancel,
    TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult Function(String id)? captureOrderPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Update value) update,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_CreateFulfillment value) createFulfillment,
    required TResult Function(_CancelFulfillment value) cancelFulfillment,
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_CreateOrderShipment value) createOrderShipment,
    required TResult Function(_CaptureOrderPayment value) captureOrderPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Update value)? update,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_CreateFulfillment value)? createFulfillment,
    TResult? Function(_CancelFulfillment value)? cancelFulfillment,
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_CreateOrderShipment value)? createOrderShipment,
    TResult? Function(_CaptureOrderPayment value)? captureOrderPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Update value)? update,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_CreateFulfillment value)? createFulfillment,
    TResult Function(_CancelFulfillment value)? cancelFulfillment,
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_CreateOrderShipment value)? createOrderShipment,
    TResult Function(_CaptureOrderPayment value)? captureOrderPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderCrudEventCopyWith<OrderCrudEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCrudEventCopyWith<$Res> {
  factory $OrderCrudEventCopyWith(
          OrderCrudEvent value, $Res Function(OrderCrudEvent) then) =
      _$OrderCrudEventCopyWithImpl<$Res, OrderCrudEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$OrderCrudEventCopyWithImpl<$Res, $Val extends OrderCrudEvent>
    implements $OrderCrudEventCopyWith<$Res> {
  _$OrderCrudEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res>
    implements $OrderCrudEventCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Map<String, dynamic>? queryParameters});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$OrderCrudEventCopyWithImpl<$Res, _$LoadImpl>
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
    return 'OrderCrudEvent.load(id: $id, queryParameters: $queryParameters)';
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
    required TResult Function(String id, UserUpdateOrderReq updateOrderReq)
        update,
    required TResult Function(String id) cancel,
    required TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)
        createFulfillment,
    required TResult Function(String id, String fulfillmentId)
        cancelFulfillment,
    required TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)
        createRefund,
    required TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)
        createOrderShipment,
    required TResult Function(String id) captureOrderPayment,
  }) {
    return load(id, queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult? Function(String id)? cancel,
    TResult? Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult? Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult? Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult? Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult? Function(String id)? captureOrderPayment,
  }) {
    return load?.call(id, queryParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult Function(String id)? cancel,
    TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult Function(String id)? captureOrderPayment,
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
    required TResult Function(_Update value) update,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_CreateFulfillment value) createFulfillment,
    required TResult Function(_CancelFulfillment value) cancelFulfillment,
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_CreateOrderShipment value) createOrderShipment,
    required TResult Function(_CaptureOrderPayment value) captureOrderPayment,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Update value)? update,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_CreateFulfillment value)? createFulfillment,
    TResult? Function(_CancelFulfillment value)? cancelFulfillment,
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_CreateOrderShipment value)? createOrderShipment,
    TResult? Function(_CaptureOrderPayment value)? captureOrderPayment,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Update value)? update,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_CreateFulfillment value)? createFulfillment,
    TResult Function(_CancelFulfillment value)? cancelFulfillment,
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_CreateOrderShipment value)? createOrderShipment,
    TResult Function(_CaptureOrderPayment value)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements OrderCrudEvent {
  const factory _Load(final String id,
      {final Map<String, dynamic>? queryParameters}) = _$LoadImpl;

  @override
  String get id;
  Map<String, dynamic>? get queryParameters;
  @override
  @JsonKey(ignore: true)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res>
    implements $OrderCrudEventCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, UserUpdateOrderReq updateOrderReq});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$OrderCrudEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updateOrderReq = null,
  }) {
    return _then(_$UpdateImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == updateOrderReq
          ? _value.updateOrderReq
          : updateOrderReq // ignore: cast_nullable_to_non_nullable
              as UserUpdateOrderReq,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(this.id, this.updateOrderReq);

  @override
  final String id;
  @override
  final UserUpdateOrderReq updateOrderReq;

  @override
  String toString() {
    return 'OrderCrudEvent.update(id: $id, updateOrderReq: $updateOrderReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updateOrderReq, updateOrderReq) ||
                other.updateOrderReq == updateOrderReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, updateOrderReq);

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
    required TResult Function(String id, UserUpdateOrderReq updateOrderReq)
        update,
    required TResult Function(String id) cancel,
    required TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)
        createFulfillment,
    required TResult Function(String id, String fulfillmentId)
        cancelFulfillment,
    required TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)
        createRefund,
    required TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)
        createOrderShipment,
    required TResult Function(String id) captureOrderPayment,
  }) {
    return update(id, updateOrderReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult? Function(String id)? cancel,
    TResult? Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult? Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult? Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult? Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult? Function(String id)? captureOrderPayment,
  }) {
    return update?.call(id, updateOrderReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult Function(String id)? cancel,
    TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult Function(String id)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(id, updateOrderReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Update value) update,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_CreateFulfillment value) createFulfillment,
    required TResult Function(_CancelFulfillment value) cancelFulfillment,
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_CreateOrderShipment value) createOrderShipment,
    required TResult Function(_CaptureOrderPayment value) captureOrderPayment,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Update value)? update,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_CreateFulfillment value)? createFulfillment,
    TResult? Function(_CancelFulfillment value)? cancelFulfillment,
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_CreateOrderShipment value)? createOrderShipment,
    TResult? Function(_CaptureOrderPayment value)? captureOrderPayment,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Update value)? update,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_CreateFulfillment value)? createFulfillment,
    TResult Function(_CancelFulfillment value)? cancelFulfillment,
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_CreateOrderShipment value)? createOrderShipment,
    TResult Function(_CaptureOrderPayment value)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements OrderCrudEvent {
  const factory _Update(
      final String id, final UserUpdateOrderReq updateOrderReq) = _$UpdateImpl;

  @override
  String get id;
  UserUpdateOrderReq get updateOrderReq;
  @override
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelImplCopyWith<$Res>
    implements $OrderCrudEventCopyWith<$Res> {
  factory _$$CancelImplCopyWith(
          _$CancelImpl value, $Res Function(_$CancelImpl) then) =
      __$$CancelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$CancelImplCopyWithImpl<$Res>
    extends _$OrderCrudEventCopyWithImpl<$Res, _$CancelImpl>
    implements _$$CancelImplCopyWith<$Res> {
  __$$CancelImplCopyWithImpl(
      _$CancelImpl _value, $Res Function(_$CancelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$CancelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelImpl implements _Cancel {
  const _$CancelImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'OrderCrudEvent.cancel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelImplCopyWith<_$CancelImpl> get copyWith =>
      __$$CancelImplCopyWithImpl<_$CancelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(String id, UserUpdateOrderReq updateOrderReq)
        update,
    required TResult Function(String id) cancel,
    required TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)
        createFulfillment,
    required TResult Function(String id, String fulfillmentId)
        cancelFulfillment,
    required TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)
        createRefund,
    required TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)
        createOrderShipment,
    required TResult Function(String id) captureOrderPayment,
  }) {
    return cancel(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult? Function(String id)? cancel,
    TResult? Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult? Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult? Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult? Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult? Function(String id)? captureOrderPayment,
  }) {
    return cancel?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult Function(String id)? cancel,
    TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult Function(String id)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Update value) update,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_CreateFulfillment value) createFulfillment,
    required TResult Function(_CancelFulfillment value) cancelFulfillment,
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_CreateOrderShipment value) createOrderShipment,
    required TResult Function(_CaptureOrderPayment value) captureOrderPayment,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Update value)? update,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_CreateFulfillment value)? createFulfillment,
    TResult? Function(_CancelFulfillment value)? cancelFulfillment,
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_CreateOrderShipment value)? createOrderShipment,
    TResult? Function(_CaptureOrderPayment value)? captureOrderPayment,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Update value)? update,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_CreateFulfillment value)? createFulfillment,
    TResult Function(_CancelFulfillment value)? cancelFulfillment,
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_CreateOrderShipment value)? createOrderShipment,
    TResult Function(_CaptureOrderPayment value)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class _Cancel implements OrderCrudEvent {
  const factory _Cancel(final String id) = _$CancelImpl;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$CancelImplCopyWith<_$CancelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFulfillmentImplCopyWith<$Res>
    implements $OrderCrudEventCopyWith<$Res> {
  factory _$$CreateFulfillmentImplCopyWith(_$CreateFulfillmentImpl value,
          $Res Function(_$CreateFulfillmentImpl) then) =
      __$$CreateFulfillmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, UserCreateFulfillmentReq userCreateFulfillmentReq});
}

/// @nodoc
class __$$CreateFulfillmentImplCopyWithImpl<$Res>
    extends _$OrderCrudEventCopyWithImpl<$Res, _$CreateFulfillmentImpl>
    implements _$$CreateFulfillmentImplCopyWith<$Res> {
  __$$CreateFulfillmentImplCopyWithImpl(_$CreateFulfillmentImpl _value,
      $Res Function(_$CreateFulfillmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userCreateFulfillmentReq = null,
  }) {
    return _then(_$CreateFulfillmentImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userCreateFulfillmentReq
          ? _value.userCreateFulfillmentReq
          : userCreateFulfillmentReq // ignore: cast_nullable_to_non_nullable
              as UserCreateFulfillmentReq,
    ));
  }
}

/// @nodoc

class _$CreateFulfillmentImpl implements _CreateFulfillment {
  const _$CreateFulfillmentImpl(this.id, this.userCreateFulfillmentReq);

  @override
  final String id;
  @override
  final UserCreateFulfillmentReq userCreateFulfillmentReq;

  @override
  String toString() {
    return 'OrderCrudEvent.createFulfillment(id: $id, userCreateFulfillmentReq: $userCreateFulfillmentReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFulfillmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(
                    other.userCreateFulfillmentReq, userCreateFulfillmentReq) ||
                other.userCreateFulfillmentReq == userCreateFulfillmentReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userCreateFulfillmentReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFulfillmentImplCopyWith<_$CreateFulfillmentImpl> get copyWith =>
      __$$CreateFulfillmentImplCopyWithImpl<_$CreateFulfillmentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(String id, UserUpdateOrderReq updateOrderReq)
        update,
    required TResult Function(String id) cancel,
    required TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)
        createFulfillment,
    required TResult Function(String id, String fulfillmentId)
        cancelFulfillment,
    required TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)
        createRefund,
    required TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)
        createOrderShipment,
    required TResult Function(String id) captureOrderPayment,
  }) {
    return createFulfillment(id, userCreateFulfillmentReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult? Function(String id)? cancel,
    TResult? Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult? Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult? Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult? Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult? Function(String id)? captureOrderPayment,
  }) {
    return createFulfillment?.call(id, userCreateFulfillmentReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult Function(String id)? cancel,
    TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult Function(String id)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (createFulfillment != null) {
      return createFulfillment(id, userCreateFulfillmentReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Update value) update,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_CreateFulfillment value) createFulfillment,
    required TResult Function(_CancelFulfillment value) cancelFulfillment,
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_CreateOrderShipment value) createOrderShipment,
    required TResult Function(_CaptureOrderPayment value) captureOrderPayment,
  }) {
    return createFulfillment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Update value)? update,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_CreateFulfillment value)? createFulfillment,
    TResult? Function(_CancelFulfillment value)? cancelFulfillment,
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_CreateOrderShipment value)? createOrderShipment,
    TResult? Function(_CaptureOrderPayment value)? captureOrderPayment,
  }) {
    return createFulfillment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Update value)? update,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_CreateFulfillment value)? createFulfillment,
    TResult Function(_CancelFulfillment value)? cancelFulfillment,
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_CreateOrderShipment value)? createOrderShipment,
    TResult Function(_CaptureOrderPayment value)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (createFulfillment != null) {
      return createFulfillment(this);
    }
    return orElse();
  }
}

abstract class _CreateFulfillment implements OrderCrudEvent {
  const factory _CreateFulfillment(final String id,
          final UserCreateFulfillmentReq userCreateFulfillmentReq) =
      _$CreateFulfillmentImpl;

  @override
  String get id;
  UserCreateFulfillmentReq get userCreateFulfillmentReq;
  @override
  @JsonKey(ignore: true)
  _$$CreateFulfillmentImplCopyWith<_$CreateFulfillmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelFulfillmentImplCopyWith<$Res>
    implements $OrderCrudEventCopyWith<$Res> {
  factory _$$CancelFulfillmentImplCopyWith(_$CancelFulfillmentImpl value,
          $Res Function(_$CancelFulfillmentImpl) then) =
      __$$CancelFulfillmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String fulfillmentId});
}

/// @nodoc
class __$$CancelFulfillmentImplCopyWithImpl<$Res>
    extends _$OrderCrudEventCopyWithImpl<$Res, _$CancelFulfillmentImpl>
    implements _$$CancelFulfillmentImplCopyWith<$Res> {
  __$$CancelFulfillmentImplCopyWithImpl(_$CancelFulfillmentImpl _value,
      $Res Function(_$CancelFulfillmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fulfillmentId = null,
  }) {
    return _then(_$CancelFulfillmentImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == fulfillmentId
          ? _value.fulfillmentId
          : fulfillmentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelFulfillmentImpl implements _CancelFulfillment {
  const _$CancelFulfillmentImpl(this.id, this.fulfillmentId);

  @override
  final String id;
  @override
  final String fulfillmentId;

  @override
  String toString() {
    return 'OrderCrudEvent.cancelFulfillment(id: $id, fulfillmentId: $fulfillmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelFulfillmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fulfillmentId, fulfillmentId) ||
                other.fulfillmentId == fulfillmentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fulfillmentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelFulfillmentImplCopyWith<_$CancelFulfillmentImpl> get copyWith =>
      __$$CancelFulfillmentImplCopyWithImpl<_$CancelFulfillmentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(String id, UserUpdateOrderReq updateOrderReq)
        update,
    required TResult Function(String id) cancel,
    required TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)
        createFulfillment,
    required TResult Function(String id, String fulfillmentId)
        cancelFulfillment,
    required TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)
        createRefund,
    required TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)
        createOrderShipment,
    required TResult Function(String id) captureOrderPayment,
  }) {
    return cancelFulfillment(id, fulfillmentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult? Function(String id)? cancel,
    TResult? Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult? Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult? Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult? Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult? Function(String id)? captureOrderPayment,
  }) {
    return cancelFulfillment?.call(id, fulfillmentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult Function(String id)? cancel,
    TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult Function(String id)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (cancelFulfillment != null) {
      return cancelFulfillment(id, fulfillmentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Update value) update,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_CreateFulfillment value) createFulfillment,
    required TResult Function(_CancelFulfillment value) cancelFulfillment,
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_CreateOrderShipment value) createOrderShipment,
    required TResult Function(_CaptureOrderPayment value) captureOrderPayment,
  }) {
    return cancelFulfillment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Update value)? update,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_CreateFulfillment value)? createFulfillment,
    TResult? Function(_CancelFulfillment value)? cancelFulfillment,
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_CreateOrderShipment value)? createOrderShipment,
    TResult? Function(_CaptureOrderPayment value)? captureOrderPayment,
  }) {
    return cancelFulfillment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Update value)? update,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_CreateFulfillment value)? createFulfillment,
    TResult Function(_CancelFulfillment value)? cancelFulfillment,
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_CreateOrderShipment value)? createOrderShipment,
    TResult Function(_CaptureOrderPayment value)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (cancelFulfillment != null) {
      return cancelFulfillment(this);
    }
    return orElse();
  }
}

abstract class _CancelFulfillment implements OrderCrudEvent {
  const factory _CancelFulfillment(
      final String id, final String fulfillmentId) = _$CancelFulfillmentImpl;

  @override
  String get id;
  String get fulfillmentId;
  @override
  @JsonKey(ignore: true)
  _$$CancelFulfillmentImplCopyWith<_$CancelFulfillmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateRefundImplCopyWith<$Res>
    implements $OrderCrudEventCopyWith<$Res> {
  factory _$$CreateRefundImplCopyWith(
          _$CreateRefundImpl value, $Res Function(_$CreateRefundImpl) then) =
      __$$CreateRefundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq});
}

/// @nodoc
class __$$CreateRefundImplCopyWithImpl<$Res>
    extends _$OrderCrudEventCopyWithImpl<$Res, _$CreateRefundImpl>
    implements _$$CreateRefundImplCopyWith<$Res> {
  __$$CreateRefundImplCopyWithImpl(
      _$CreateRefundImpl _value, $Res Function(_$CreateRefundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userCreateRefundOrdersReq = null,
  }) {
    return _then(_$CreateRefundImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userCreateRefundOrdersReq
          ? _value.userCreateRefundOrdersReq
          : userCreateRefundOrdersReq // ignore: cast_nullable_to_non_nullable
              as UserCreateRefundOrdersReq,
    ));
  }
}

/// @nodoc

class _$CreateRefundImpl implements _CreateRefund {
  const _$CreateRefundImpl(this.id, this.userCreateRefundOrdersReq);

  @override
  final String id;
  @override
  final UserCreateRefundOrdersReq userCreateRefundOrdersReq;

  @override
  String toString() {
    return 'OrderCrudEvent.createRefund(id: $id, userCreateRefundOrdersReq: $userCreateRefundOrdersReq)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRefundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userCreateRefundOrdersReq,
                    userCreateRefundOrdersReq) ||
                other.userCreateRefundOrdersReq == userCreateRefundOrdersReq));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userCreateRefundOrdersReq);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRefundImplCopyWith<_$CreateRefundImpl> get copyWith =>
      __$$CreateRefundImplCopyWithImpl<_$CreateRefundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(String id, UserUpdateOrderReq updateOrderReq)
        update,
    required TResult Function(String id) cancel,
    required TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)
        createFulfillment,
    required TResult Function(String id, String fulfillmentId)
        cancelFulfillment,
    required TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)
        createRefund,
    required TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)
        createOrderShipment,
    required TResult Function(String id) captureOrderPayment,
  }) {
    return createRefund(id, userCreateRefundOrdersReq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult? Function(String id)? cancel,
    TResult? Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult? Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult? Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult? Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult? Function(String id)? captureOrderPayment,
  }) {
    return createRefund?.call(id, userCreateRefundOrdersReq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult Function(String id)? cancel,
    TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult Function(String id)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (createRefund != null) {
      return createRefund(id, userCreateRefundOrdersReq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Update value) update,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_CreateFulfillment value) createFulfillment,
    required TResult Function(_CancelFulfillment value) cancelFulfillment,
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_CreateOrderShipment value) createOrderShipment,
    required TResult Function(_CaptureOrderPayment value) captureOrderPayment,
  }) {
    return createRefund(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Update value)? update,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_CreateFulfillment value)? createFulfillment,
    TResult? Function(_CancelFulfillment value)? cancelFulfillment,
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_CreateOrderShipment value)? createOrderShipment,
    TResult? Function(_CaptureOrderPayment value)? captureOrderPayment,
  }) {
    return createRefund?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Update value)? update,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_CreateFulfillment value)? createFulfillment,
    TResult Function(_CancelFulfillment value)? cancelFulfillment,
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_CreateOrderShipment value)? createOrderShipment,
    TResult Function(_CaptureOrderPayment value)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (createRefund != null) {
      return createRefund(this);
    }
    return orElse();
  }
}

abstract class _CreateRefund implements OrderCrudEvent {
  const factory _CreateRefund(final String id,
          final UserCreateRefundOrdersReq userCreateRefundOrdersReq) =
      _$CreateRefundImpl;

  @override
  String get id;
  UserCreateRefundOrdersReq get userCreateRefundOrdersReq;
  @override
  @JsonKey(ignore: true)
  _$$CreateRefundImplCopyWith<_$CreateRefundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateOrderShipmentImplCopyWith<$Res>
    implements $OrderCrudEventCopyWith<$Res> {
  factory _$$CreateOrderShipmentImplCopyWith(_$CreateOrderShipmentImpl value,
          $Res Function(_$CreateOrderShipmentImpl) then) =
      __$$CreateOrderShipmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String fulfillmentId, List<String>? trackingNumbers});
}

/// @nodoc
class __$$CreateOrderShipmentImplCopyWithImpl<$Res>
    extends _$OrderCrudEventCopyWithImpl<$Res, _$CreateOrderShipmentImpl>
    implements _$$CreateOrderShipmentImplCopyWith<$Res> {
  __$$CreateOrderShipmentImplCopyWithImpl(_$CreateOrderShipmentImpl _value,
      $Res Function(_$CreateOrderShipmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fulfillmentId = null,
    Object? trackingNumbers = freezed,
  }) {
    return _then(_$CreateOrderShipmentImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == fulfillmentId
          ? _value.fulfillmentId
          : fulfillmentId // ignore: cast_nullable_to_non_nullable
              as String,
      trackingNumbers: freezed == trackingNumbers
          ? _value._trackingNumbers
          : trackingNumbers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$CreateOrderShipmentImpl implements _CreateOrderShipment {
  const _$CreateOrderShipmentImpl(this.id, this.fulfillmentId,
      {final List<String>? trackingNumbers})
      : _trackingNumbers = trackingNumbers;

  @override
  final String id;
  @override
  final String fulfillmentId;
  final List<String>? _trackingNumbers;
  @override
  List<String>? get trackingNumbers {
    final value = _trackingNumbers;
    if (value == null) return null;
    if (_trackingNumbers is EqualUnmodifiableListView) return _trackingNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderCrudEvent.createOrderShipment(id: $id, fulfillmentId: $fulfillmentId, trackingNumbers: $trackingNumbers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderShipmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fulfillmentId, fulfillmentId) ||
                other.fulfillmentId == fulfillmentId) &&
            const DeepCollectionEquality()
                .equals(other._trackingNumbers, _trackingNumbers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fulfillmentId,
      const DeepCollectionEquality().hash(_trackingNumbers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderShipmentImplCopyWith<_$CreateOrderShipmentImpl> get copyWith =>
      __$$CreateOrderShipmentImplCopyWithImpl<_$CreateOrderShipmentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(String id, UserUpdateOrderReq updateOrderReq)
        update,
    required TResult Function(String id) cancel,
    required TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)
        createFulfillment,
    required TResult Function(String id, String fulfillmentId)
        cancelFulfillment,
    required TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)
        createRefund,
    required TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)
        createOrderShipment,
    required TResult Function(String id) captureOrderPayment,
  }) {
    return createOrderShipment(id, fulfillmentId, trackingNumbers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult? Function(String id)? cancel,
    TResult? Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult? Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult? Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult? Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult? Function(String id)? captureOrderPayment,
  }) {
    return createOrderShipment?.call(id, fulfillmentId, trackingNumbers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult Function(String id)? cancel,
    TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult Function(String id)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (createOrderShipment != null) {
      return createOrderShipment(id, fulfillmentId, trackingNumbers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Update value) update,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_CreateFulfillment value) createFulfillment,
    required TResult Function(_CancelFulfillment value) cancelFulfillment,
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_CreateOrderShipment value) createOrderShipment,
    required TResult Function(_CaptureOrderPayment value) captureOrderPayment,
  }) {
    return createOrderShipment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Update value)? update,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_CreateFulfillment value)? createFulfillment,
    TResult? Function(_CancelFulfillment value)? cancelFulfillment,
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_CreateOrderShipment value)? createOrderShipment,
    TResult? Function(_CaptureOrderPayment value)? captureOrderPayment,
  }) {
    return createOrderShipment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Update value)? update,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_CreateFulfillment value)? createFulfillment,
    TResult Function(_CancelFulfillment value)? cancelFulfillment,
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_CreateOrderShipment value)? createOrderShipment,
    TResult Function(_CaptureOrderPayment value)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (createOrderShipment != null) {
      return createOrderShipment(this);
    }
    return orElse();
  }
}

abstract class _CreateOrderShipment implements OrderCrudEvent {
  const factory _CreateOrderShipment(
      final String id, final String fulfillmentId,
      {final List<String>? trackingNumbers}) = _$CreateOrderShipmentImpl;

  @override
  String get id;
  String get fulfillmentId;
  List<String>? get trackingNumbers;
  @override
  @JsonKey(ignore: true)
  _$$CreateOrderShipmentImplCopyWith<_$CreateOrderShipmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CaptureOrderPaymentImplCopyWith<$Res>
    implements $OrderCrudEventCopyWith<$Res> {
  factory _$$CaptureOrderPaymentImplCopyWith(_$CaptureOrderPaymentImpl value,
          $Res Function(_$CaptureOrderPaymentImpl) then) =
      __$$CaptureOrderPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$CaptureOrderPaymentImplCopyWithImpl<$Res>
    extends _$OrderCrudEventCopyWithImpl<$Res, _$CaptureOrderPaymentImpl>
    implements _$$CaptureOrderPaymentImplCopyWith<$Res> {
  __$$CaptureOrderPaymentImplCopyWithImpl(_$CaptureOrderPaymentImpl _value,
      $Res Function(_$CaptureOrderPaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$CaptureOrderPaymentImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CaptureOrderPaymentImpl implements _CaptureOrderPayment {
  const _$CaptureOrderPaymentImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'OrderCrudEvent.captureOrderPayment(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaptureOrderPaymentImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CaptureOrderPaymentImplCopyWith<_$CaptureOrderPaymentImpl> get copyWith =>
      __$$CaptureOrderPaymentImplCopyWithImpl<_$CaptureOrderPaymentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, Map<String, dynamic>? queryParameters)
        load,
    required TResult Function(String id, UserUpdateOrderReq updateOrderReq)
        update,
    required TResult Function(String id) cancel,
    required TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)
        createFulfillment,
    required TResult Function(String id, String fulfillmentId)
        cancelFulfillment,
    required TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)
        createRefund,
    required TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)
        createOrderShipment,
    required TResult Function(String id) captureOrderPayment,
  }) {
    return captureOrderPayment(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult? Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult? Function(String id)? cancel,
    TResult? Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult? Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult? Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult? Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult? Function(String id)? captureOrderPayment,
  }) {
    return captureOrderPayment?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, Map<String, dynamic>? queryParameters)? load,
    TResult Function(String id, UserUpdateOrderReq updateOrderReq)? update,
    TResult Function(String id)? cancel,
    TResult Function(
            String id, UserCreateFulfillmentReq userCreateFulfillmentReq)?
        createFulfillment,
    TResult Function(String id, String fulfillmentId)? cancelFulfillment,
    TResult Function(
            String id, UserCreateRefundOrdersReq userCreateRefundOrdersReq)?
        createRefund,
    TResult Function(
            String id, String fulfillmentId, List<String>? trackingNumbers)?
        createOrderShipment,
    TResult Function(String id)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (captureOrderPayment != null) {
      return captureOrderPayment(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Update value) update,
    required TResult Function(_Cancel value) cancel,
    required TResult Function(_CreateFulfillment value) createFulfillment,
    required TResult Function(_CancelFulfillment value) cancelFulfillment,
    required TResult Function(_CreateRefund value) createRefund,
    required TResult Function(_CreateOrderShipment value) createOrderShipment,
    required TResult Function(_CaptureOrderPayment value) captureOrderPayment,
  }) {
    return captureOrderPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Update value)? update,
    TResult? Function(_Cancel value)? cancel,
    TResult? Function(_CreateFulfillment value)? createFulfillment,
    TResult? Function(_CancelFulfillment value)? cancelFulfillment,
    TResult? Function(_CreateRefund value)? createRefund,
    TResult? Function(_CreateOrderShipment value)? createOrderShipment,
    TResult? Function(_CaptureOrderPayment value)? captureOrderPayment,
  }) {
    return captureOrderPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Update value)? update,
    TResult Function(_Cancel value)? cancel,
    TResult Function(_CreateFulfillment value)? createFulfillment,
    TResult Function(_CancelFulfillment value)? cancelFulfillment,
    TResult Function(_CreateRefund value)? createRefund,
    TResult Function(_CreateOrderShipment value)? createOrderShipment,
    TResult Function(_CaptureOrderPayment value)? captureOrderPayment,
    required TResult orElse(),
  }) {
    if (captureOrderPayment != null) {
      return captureOrderPayment(this);
    }
    return orElse();
  }
}

abstract class _CaptureOrderPayment implements OrderCrudEvent {
  const factory _CaptureOrderPayment(final String id) =
      _$CaptureOrderPaymentImpl;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$CaptureOrderPaymentImplCopyWith<_$CaptureOrderPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderCrudState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Order order) order,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Order order)? order,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Order order)? order,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Order value) order,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Order value)? order,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Order value)? order,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCrudStateCopyWith<$Res> {
  factory $OrderCrudStateCopyWith(
          OrderCrudState value, $Res Function(OrderCrudState) then) =
      _$OrderCrudStateCopyWithImpl<$Res, OrderCrudState>;
}

/// @nodoc
class _$OrderCrudStateCopyWithImpl<$Res, $Val extends OrderCrudState>
    implements $OrderCrudStateCopyWith<$Res> {
  _$OrderCrudStateCopyWithImpl(this._value, this._then);

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
    extends _$OrderCrudStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'OrderCrudState.initial()';
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
    required TResult Function(Order order) order,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Order order)? order,
    TResult? Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Order order)? order,
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
    required TResult Function(_Order value) order,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Order value)? order,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Order value)? order,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OrderCrudState {
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
    extends _$OrderCrudStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'OrderCrudState.loading()';
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
    required TResult Function(Order order) order,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Order order)? order,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Order order)? order,
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
    required TResult Function(_Order value) order,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Order value)? order,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Order value)? order,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements OrderCrudState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Order order});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCrudStateCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$OrderImpl(
      null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
    ));
  }
}

/// @nodoc

class _$OrderImpl implements _Order {
  const _$OrderImpl(this.order);

  @override
  final Order order;

  @override
  String toString() {
    return 'OrderCrudState.order(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Order order) order,
    required TResult Function(Failure failure) error,
  }) {
    return order(this.order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Order order)? order,
    TResult? Function(Failure failure)? error,
  }) {
    return order?.call(this.order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Order order)? order,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (order != null) {
      return order(this.order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Order value) order,
    required TResult Function(_Error value) error,
  }) {
    return order(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Order value)? order,
    TResult? Function(_Error value)? error,
  }) {
    return order?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Order value)? order,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (order != null) {
      return order(this);
    }
    return orElse();
  }
}

abstract class _Order implements OrderCrudState {
  const factory _Order(final Order order) = _$OrderImpl;

  Order get order;
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
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
    extends _$OrderCrudStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'OrderCrudState.error(failure: $failure)';
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
    required TResult Function(Order order) order,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Order order)? order,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Order order)? order,
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
    required TResult Function(_Order value) order,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Order value)? order,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Order value)? order,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements OrderCrudState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
