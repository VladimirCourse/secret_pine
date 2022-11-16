// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pine_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PineEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() refreshData,
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function() stopTransmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? refreshData,
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function()? stopTransmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? refreshData,
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RefreshData value) refreshData,
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RefreshData value)? refreshData,
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RefreshData value)? refreshData,
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PineEventCopyWith<$Res> {
  factory $PineEventCopyWith(PineEvent value, $Res Function(PineEvent) then) =
      _$PineEventCopyWithImpl<$Res, PineEvent>;
}

/// @nodoc
class _$PineEventCopyWithImpl<$Res, $Val extends PineEvent>
    implements $PineEventCopyWith<$Res> {
  _$PineEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RefreshDataCopyWith<$Res> {
  factory _$$_RefreshDataCopyWith(
          _$_RefreshData value, $Res Function(_$_RefreshData) then) =
      __$$_RefreshDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshDataCopyWithImpl<$Res>
    extends _$PineEventCopyWithImpl<$Res, _$_RefreshData>
    implements _$$_RefreshDataCopyWith<$Res> {
  __$$_RefreshDataCopyWithImpl(
      _$_RefreshData _value, $Res Function(_$_RefreshData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RefreshData implements _RefreshData {
  const _$_RefreshData();

  @override
  String toString() {
    return 'PineEvent.refreshData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RefreshData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() refreshData,
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function() stopTransmit,
  }) {
    return refreshData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? refreshData,
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function()? stopTransmit,
  }) {
    return refreshData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? refreshData,
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) {
    if (refreshData != null) {
      return refreshData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RefreshData value) refreshData,
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return refreshData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RefreshData value)? refreshData,
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return refreshData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RefreshData value)? refreshData,
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (refreshData != null) {
      return refreshData(this);
    }
    return orElse();
  }
}

abstract class _RefreshData implements PineEvent {
  const factory _RefreshData() = _$_RefreshData;
}

/// @nodoc
abstract class _$$_StartTransmitCopyWith<$Res> {
  factory _$$_StartTransmitCopyWith(
          _$_StartTransmit value, $Res Function(_$_StartTransmit) then) =
      __$$_StartTransmitCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorCallback onError});
}

/// @nodoc
class __$$_StartTransmitCopyWithImpl<$Res>
    extends _$PineEventCopyWithImpl<$Res, _$_StartTransmit>
    implements _$$_StartTransmitCopyWith<$Res> {
  __$$_StartTransmitCopyWithImpl(
      _$_StartTransmit _value, $Res Function(_$_StartTransmit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onError = null,
  }) {
    return _then(_$_StartTransmit(
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as ErrorCallback,
    ));
  }
}

/// @nodoc

class _$_StartTransmit implements _StartTransmit {
  const _$_StartTransmit({required this.onError});

  @override
  final ErrorCallback onError;

  @override
  String toString() {
    return 'PineEvent.startTransmit(onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartTransmit &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartTransmitCopyWith<_$_StartTransmit> get copyWith =>
      __$$_StartTransmitCopyWithImpl<_$_StartTransmit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() refreshData,
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function() stopTransmit,
  }) {
    return startTransmit(onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? refreshData,
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function()? stopTransmit,
  }) {
    return startTransmit?.call(onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? refreshData,
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) {
    if (startTransmit != null) {
      return startTransmit(onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RefreshData value) refreshData,
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return startTransmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RefreshData value)? refreshData,
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return startTransmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RefreshData value)? refreshData,
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (startTransmit != null) {
      return startTransmit(this);
    }
    return orElse();
  }
}

abstract class _StartTransmit implements PineEvent {
  const factory _StartTransmit({required final ErrorCallback onError}) =
      _$_StartTransmit;

  ErrorCallback get onError;
  @JsonKey(ignore: true)
  _$$_StartTransmitCopyWith<_$_StartTransmit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StopTransmitCopyWith<$Res> {
  factory _$$_StopTransmitCopyWith(
          _$_StopTransmit value, $Res Function(_$_StopTransmit) then) =
      __$$_StopTransmitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StopTransmitCopyWithImpl<$Res>
    extends _$PineEventCopyWithImpl<$Res, _$_StopTransmit>
    implements _$$_StopTransmitCopyWith<$Res> {
  __$$_StopTransmitCopyWithImpl(
      _$_StopTransmit _value, $Res Function(_$_StopTransmit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StopTransmit implements _StopTransmit {
  const _$_StopTransmit();

  @override
  String toString() {
    return 'PineEvent.stopTransmit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StopTransmit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() refreshData,
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function() stopTransmit,
  }) {
    return stopTransmit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? refreshData,
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function()? stopTransmit,
  }) {
    return stopTransmit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? refreshData,
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) {
    if (stopTransmit != null) {
      return stopTransmit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RefreshData value) refreshData,
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return stopTransmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RefreshData value)? refreshData,
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return stopTransmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RefreshData value)? refreshData,
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (stopTransmit != null) {
      return stopTransmit(this);
    }
    return orElse();
  }
}

abstract class _StopTransmit implements PineEvent {
  const factory _StopTransmit() = _$_StopTransmit;
}

/// @nodoc
mixin _$PineState {
  String get name => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isListening => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PineStateCopyWith<PineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PineStateCopyWith<$Res> {
  factory $PineStateCopyWith(PineState value, $Res Function(PineState) then) =
      _$PineStateCopyWithImpl<$Res, PineState>;
  @useResult
  $Res call({String name, bool isLoading, bool isListening});
}

/// @nodoc
class _$PineStateCopyWithImpl<$Res, $Val extends PineState>
    implements $PineStateCopyWith<$Res> {
  _$PineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isLoading = null,
    Object? isListening = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isListening: null == isListening
          ? _value.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $PineStateCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool isLoading, bool isListening});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$PineStateCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isLoading = null,
    Object? isListening = null,
  }) {
    return _then(_$_Data(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isListening: null == isListening
          ? _value.isListening
          : isListening // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Data implements _Data {
  const _$_Data(
      {required this.name, this.isLoading = false, this.isListening = false});

  @override
  final String name;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isListening;

  @override
  String toString() {
    return 'PineState(name: $name, isLoading: $isLoading, isListening: $isListening)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isListening, isListening) ||
                other.isListening == isListening));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, isLoading, isListening);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);
}

abstract class _Data implements PineState {
  const factory _Data(
      {required final String name,
      final bool isLoading,
      final bool isListening}) = _$_Data;

  @override
  String get name;
  @override
  bool get isLoading;
  @override
  bool get isListening;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
