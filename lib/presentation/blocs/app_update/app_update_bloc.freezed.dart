// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppUpdateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForUpdate,
    required TResult Function() performUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForUpdate,
    TResult? Function()? performUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForUpdate,
    TResult Function()? performUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckForUpdate value) checkForUpdate,
    required TResult Function(_PerformUpdate value) performUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckForUpdate value)? checkForUpdate,
    TResult? Function(_PerformUpdate value)? performUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckForUpdate value)? checkForUpdate,
    TResult Function(_PerformUpdate value)? performUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUpdateEventCopyWith<$Res> {
  factory $AppUpdateEventCopyWith(
          AppUpdateEvent value, $Res Function(AppUpdateEvent) then) =
      _$AppUpdateEventCopyWithImpl<$Res, AppUpdateEvent>;
}

/// @nodoc
class _$AppUpdateEventCopyWithImpl<$Res, $Val extends AppUpdateEvent>
    implements $AppUpdateEventCopyWith<$Res> {
  _$AppUpdateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckForUpdateImplCopyWith<$Res> {
  factory _$$CheckForUpdateImplCopyWith(_$CheckForUpdateImpl value,
          $Res Function(_$CheckForUpdateImpl) then) =
      __$$CheckForUpdateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckForUpdateImplCopyWithImpl<$Res>
    extends _$AppUpdateEventCopyWithImpl<$Res, _$CheckForUpdateImpl>
    implements _$$CheckForUpdateImplCopyWith<$Res> {
  __$$CheckForUpdateImplCopyWithImpl(
      _$CheckForUpdateImpl _value, $Res Function(_$CheckForUpdateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckForUpdateImpl implements _CheckForUpdate {
  const _$CheckForUpdateImpl();

  @override
  String toString() {
    return 'AppUpdateEvent.checkForUpdate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckForUpdateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForUpdate,
    required TResult Function() performUpdate,
  }) {
    return checkForUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForUpdate,
    TResult? Function()? performUpdate,
  }) {
    return checkForUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForUpdate,
    TResult Function()? performUpdate,
    required TResult orElse(),
  }) {
    if (checkForUpdate != null) {
      return checkForUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckForUpdate value) checkForUpdate,
    required TResult Function(_PerformUpdate value) performUpdate,
  }) {
    return checkForUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckForUpdate value)? checkForUpdate,
    TResult? Function(_PerformUpdate value)? performUpdate,
  }) {
    return checkForUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckForUpdate value)? checkForUpdate,
    TResult Function(_PerformUpdate value)? performUpdate,
    required TResult orElse(),
  }) {
    if (checkForUpdate != null) {
      return checkForUpdate(this);
    }
    return orElse();
  }
}

abstract class _CheckForUpdate implements AppUpdateEvent {
  const factory _CheckForUpdate() = _$CheckForUpdateImpl;
}

/// @nodoc
abstract class _$$PerformUpdateImplCopyWith<$Res> {
  factory _$$PerformUpdateImplCopyWith(
          _$PerformUpdateImpl value, $Res Function(_$PerformUpdateImpl) then) =
      __$$PerformUpdateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PerformUpdateImplCopyWithImpl<$Res>
    extends _$AppUpdateEventCopyWithImpl<$Res, _$PerformUpdateImpl>
    implements _$$PerformUpdateImplCopyWith<$Res> {
  __$$PerformUpdateImplCopyWithImpl(
      _$PerformUpdateImpl _value, $Res Function(_$PerformUpdateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PerformUpdateImpl implements _PerformUpdate {
  const _$PerformUpdateImpl();

  @override
  String toString() {
    return 'AppUpdateEvent.performUpdate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PerformUpdateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForUpdate,
    required TResult Function() performUpdate,
  }) {
    return performUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForUpdate,
    TResult? Function()? performUpdate,
  }) {
    return performUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForUpdate,
    TResult Function()? performUpdate,
    required TResult orElse(),
  }) {
    if (performUpdate != null) {
      return performUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckForUpdate value) checkForUpdate,
    required TResult Function(_PerformUpdate value) performUpdate,
  }) {
    return performUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckForUpdate value)? checkForUpdate,
    TResult? Function(_PerformUpdate value)? performUpdate,
  }) {
    return performUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckForUpdate value)? checkForUpdate,
    TResult Function(_PerformUpdate value)? performUpdate,
    required TResult orElse(),
  }) {
    if (performUpdate != null) {
      return performUpdate(this);
    }
    return orElse();
  }
}

abstract class _PerformUpdate implements AppUpdateEvent {
  const factory _PerformUpdate() = _$PerformUpdateImpl;
}

/// @nodoc
mixin _$AppUpdateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noUpdateAvailable,
    required TResult Function(Failure failure) error,
    required TResult Function(AppUpdate appUpdate) updateAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noUpdateAvailable,
    TResult? Function(Failure failure)? error,
    TResult? Function(AppUpdate appUpdate)? updateAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noUpdateAvailable,
    TResult Function(Failure failure)? error,
    TResult Function(AppUpdate appUpdate)? updateAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoUpdateAvailable value) noUpdateAvailable,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateAvailable value) updateAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateAvailable value)? updateAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateAvailable value)? updateAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUpdateStateCopyWith<$Res> {
  factory $AppUpdateStateCopyWith(
          AppUpdateState value, $Res Function(AppUpdateState) then) =
      _$AppUpdateStateCopyWithImpl<$Res, AppUpdateState>;
}

/// @nodoc
class _$AppUpdateStateCopyWithImpl<$Res, $Val extends AppUpdateState>
    implements $AppUpdateStateCopyWith<$Res> {
  _$AppUpdateStateCopyWithImpl(this._value, this._then);

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
    extends _$AppUpdateStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AppUpdateState.initial()';
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
    required TResult Function() noUpdateAvailable,
    required TResult Function(Failure failure) error,
    required TResult Function(AppUpdate appUpdate) updateAvailable,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noUpdateAvailable,
    TResult? Function(Failure failure)? error,
    TResult? Function(AppUpdate appUpdate)? updateAvailable,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noUpdateAvailable,
    TResult Function(Failure failure)? error,
    TResult Function(AppUpdate appUpdate)? updateAvailable,
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
    required TResult Function(_NoUpdateAvailable value) noUpdateAvailable,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateAvailable value) updateAvailable,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateAvailable value)? updateAvailable,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateAvailable value)? updateAvailable,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppUpdateState {
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
    extends _$AppUpdateStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'AppUpdateState.loading()';
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
    required TResult Function() noUpdateAvailable,
    required TResult Function(Failure failure) error,
    required TResult Function(AppUpdate appUpdate) updateAvailable,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noUpdateAvailable,
    TResult? Function(Failure failure)? error,
    TResult? Function(AppUpdate appUpdate)? updateAvailable,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noUpdateAvailable,
    TResult Function(Failure failure)? error,
    TResult Function(AppUpdate appUpdate)? updateAvailable,
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
    required TResult Function(_NoUpdateAvailable value) noUpdateAvailable,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateAvailable value) updateAvailable,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateAvailable value)? updateAvailable,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateAvailable value)? updateAvailable,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AppUpdateState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$NoUpdateAvailableImplCopyWith<$Res> {
  factory _$$NoUpdateAvailableImplCopyWith(_$NoUpdateAvailableImpl value,
          $Res Function(_$NoUpdateAvailableImpl) then) =
      __$$NoUpdateAvailableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoUpdateAvailableImplCopyWithImpl<$Res>
    extends _$AppUpdateStateCopyWithImpl<$Res, _$NoUpdateAvailableImpl>
    implements _$$NoUpdateAvailableImplCopyWith<$Res> {
  __$$NoUpdateAvailableImplCopyWithImpl(_$NoUpdateAvailableImpl _value,
      $Res Function(_$NoUpdateAvailableImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoUpdateAvailableImpl implements _NoUpdateAvailable {
  const _$NoUpdateAvailableImpl();

  @override
  String toString() {
    return 'AppUpdateState.noUpdateAvailable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoUpdateAvailableImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noUpdateAvailable,
    required TResult Function(Failure failure) error,
    required TResult Function(AppUpdate appUpdate) updateAvailable,
  }) {
    return noUpdateAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noUpdateAvailable,
    TResult? Function(Failure failure)? error,
    TResult? Function(AppUpdate appUpdate)? updateAvailable,
  }) {
    return noUpdateAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noUpdateAvailable,
    TResult Function(Failure failure)? error,
    TResult Function(AppUpdate appUpdate)? updateAvailable,
    required TResult orElse(),
  }) {
    if (noUpdateAvailable != null) {
      return noUpdateAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoUpdateAvailable value) noUpdateAvailable,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateAvailable value) updateAvailable,
  }) {
    return noUpdateAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateAvailable value)? updateAvailable,
  }) {
    return noUpdateAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateAvailable value)? updateAvailable,
    required TResult orElse(),
  }) {
    if (noUpdateAvailable != null) {
      return noUpdateAvailable(this);
    }
    return orElse();
  }
}

abstract class _NoUpdateAvailable implements AppUpdateState {
  const factory _NoUpdateAvailable() = _$NoUpdateAvailableImpl;
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
    extends _$AppUpdateStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'AppUpdateState.error(failure: $failure)';
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
    required TResult Function() noUpdateAvailable,
    required TResult Function(Failure failure) error,
    required TResult Function(AppUpdate appUpdate) updateAvailable,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noUpdateAvailable,
    TResult? Function(Failure failure)? error,
    TResult? Function(AppUpdate appUpdate)? updateAvailable,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noUpdateAvailable,
    TResult Function(Failure failure)? error,
    TResult Function(AppUpdate appUpdate)? updateAvailable,
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
    required TResult Function(_NoUpdateAvailable value) noUpdateAvailable,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateAvailable value) updateAvailable,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateAvailable value)? updateAvailable,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateAvailable value)? updateAvailable,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AppUpdateState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAvailableImplCopyWith<$Res> {
  factory _$$UpdateAvailableImplCopyWith(_$UpdateAvailableImpl value,
          $Res Function(_$UpdateAvailableImpl) then) =
      __$$UpdateAvailableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppUpdate appUpdate});
}

/// @nodoc
class __$$UpdateAvailableImplCopyWithImpl<$Res>
    extends _$AppUpdateStateCopyWithImpl<$Res, _$UpdateAvailableImpl>
    implements _$$UpdateAvailableImplCopyWith<$Res> {
  __$$UpdateAvailableImplCopyWithImpl(
      _$UpdateAvailableImpl _value, $Res Function(_$UpdateAvailableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appUpdate = null,
  }) {
    return _then(_$UpdateAvailableImpl(
      null == appUpdate
          ? _value.appUpdate
          : appUpdate // ignore: cast_nullable_to_non_nullable
              as AppUpdate,
    ));
  }
}

/// @nodoc

class _$UpdateAvailableImpl implements _UpdateAvailable {
  const _$UpdateAvailableImpl(this.appUpdate);

  @override
  final AppUpdate appUpdate;

  @override
  String toString() {
    return 'AppUpdateState.updateAvailable(appUpdate: $appUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAvailableImpl &&
            (identical(other.appUpdate, appUpdate) ||
                other.appUpdate == appUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAvailableImplCopyWith<_$UpdateAvailableImpl> get copyWith =>
      __$$UpdateAvailableImplCopyWithImpl<_$UpdateAvailableImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() noUpdateAvailable,
    required TResult Function(Failure failure) error,
    required TResult Function(AppUpdate appUpdate) updateAvailable,
  }) {
    return updateAvailable(appUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? noUpdateAvailable,
    TResult? Function(Failure failure)? error,
    TResult? Function(AppUpdate appUpdate)? updateAvailable,
  }) {
    return updateAvailable?.call(appUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? noUpdateAvailable,
    TResult Function(Failure failure)? error,
    TResult Function(AppUpdate appUpdate)? updateAvailable,
    required TResult orElse(),
  }) {
    if (updateAvailable != null) {
      return updateAvailable(appUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoUpdateAvailable value) noUpdateAvailable,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateAvailable value) updateAvailable,
  }) {
    return updateAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateAvailable value)? updateAvailable,
  }) {
    return updateAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoUpdateAvailable value)? noUpdateAvailable,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateAvailable value)? updateAvailable,
    required TResult orElse(),
  }) {
    if (updateAvailable != null) {
      return updateAvailable(this);
    }
    return orElse();
  }
}

abstract class _UpdateAvailable implements AppUpdateState {
  const factory _UpdateAvailable(final AppUpdate appUpdate) =
      _$UpdateAvailableImpl;

  AppUpdate get appUpdate;
  @JsonKey(ignore: true)
  _$$UpdateAvailableImplCopyWith<_$UpdateAvailableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
