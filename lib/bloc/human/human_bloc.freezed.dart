// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'human_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HumanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function(List<String> messages) refreshMessages,
    required TResult Function(String imagePath) refreshImage,
    required TResult Function(int range) refreshRange,
    required TResult Function(String message, ErrorCallback onError)
        sendMessage,
    required TResult Function(String imagePath, ErrorCallback onError)
        sendImage,
    required TResult Function(ErrorCallback? onError) sendDataRequest,
    required TResult Function() stopTransmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function(List<String> messages)? refreshMessages,
    TResult? Function(String imagePath)? refreshImage,
    TResult? Function(int range)? refreshRange,
    TResult? Function(String message, ErrorCallback onError)? sendMessage,
    TResult? Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult? Function(ErrorCallback? onError)? sendDataRequest,
    TResult? Function()? stopTransmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function(List<String> messages)? refreshMessages,
    TResult Function(String imagePath)? refreshImage,
    TResult Function(int range)? refreshRange,
    TResult Function(String message, ErrorCallback onError)? sendMessage,
    TResult Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult Function(ErrorCallback? onError)? sendDataRequest,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_RefreshMessages value) refreshMessages,
    required TResult Function(_RefreshImage value) refreshImage,
    required TResult Function(_RefreshRange value) refreshRange,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SendImage value) sendImage,
    required TResult Function(_SendDataRequest value) sendDataRequest,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_RefreshMessages value)? refreshMessages,
    TResult? Function(_RefreshImage value)? refreshImage,
    TResult? Function(_RefreshRange value)? refreshRange,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_SendImage value)? sendImage,
    TResult? Function(_SendDataRequest value)? sendDataRequest,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_RefreshMessages value)? refreshMessages,
    TResult Function(_RefreshImage value)? refreshImage,
    TResult Function(_RefreshRange value)? refreshRange,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SendImage value)? sendImage,
    TResult Function(_SendDataRequest value)? sendDataRequest,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HumanEventCopyWith<$Res> {
  factory $HumanEventCopyWith(
          HumanEvent value, $Res Function(HumanEvent) then) =
      _$HumanEventCopyWithImpl<$Res, HumanEvent>;
}

/// @nodoc
class _$HumanEventCopyWithImpl<$Res, $Val extends HumanEvent>
    implements $HumanEventCopyWith<$Res> {
  _$HumanEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$HumanEventCopyWithImpl<$Res, _$_StartTransmit>
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
    return 'HumanEvent.startTransmit(onError: $onError)';
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
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function(List<String> messages) refreshMessages,
    required TResult Function(String imagePath) refreshImage,
    required TResult Function(int range) refreshRange,
    required TResult Function(String message, ErrorCallback onError)
        sendMessage,
    required TResult Function(String imagePath, ErrorCallback onError)
        sendImage,
    required TResult Function(ErrorCallback? onError) sendDataRequest,
    required TResult Function() stopTransmit,
  }) {
    return startTransmit(onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function(List<String> messages)? refreshMessages,
    TResult? Function(String imagePath)? refreshImage,
    TResult? Function(int range)? refreshRange,
    TResult? Function(String message, ErrorCallback onError)? sendMessage,
    TResult? Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult? Function(ErrorCallback? onError)? sendDataRequest,
    TResult? Function()? stopTransmit,
  }) {
    return startTransmit?.call(onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function(List<String> messages)? refreshMessages,
    TResult Function(String imagePath)? refreshImage,
    TResult Function(int range)? refreshRange,
    TResult Function(String message, ErrorCallback onError)? sendMessage,
    TResult Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult Function(ErrorCallback? onError)? sendDataRequest,
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
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_RefreshMessages value) refreshMessages,
    required TResult Function(_RefreshImage value) refreshImage,
    required TResult Function(_RefreshRange value) refreshRange,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SendImage value) sendImage,
    required TResult Function(_SendDataRequest value) sendDataRequest,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return startTransmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_RefreshMessages value)? refreshMessages,
    TResult? Function(_RefreshImage value)? refreshImage,
    TResult? Function(_RefreshRange value)? refreshRange,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_SendImage value)? sendImage,
    TResult? Function(_SendDataRequest value)? sendDataRequest,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return startTransmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_RefreshMessages value)? refreshMessages,
    TResult Function(_RefreshImage value)? refreshImage,
    TResult Function(_RefreshRange value)? refreshRange,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SendImage value)? sendImage,
    TResult Function(_SendDataRequest value)? sendDataRequest,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (startTransmit != null) {
      return startTransmit(this);
    }
    return orElse();
  }
}

abstract class _StartTransmit implements HumanEvent {
  const factory _StartTransmit({required final ErrorCallback onError}) =
      _$_StartTransmit;

  ErrorCallback get onError;
  @JsonKey(ignore: true)
  _$$_StartTransmitCopyWith<_$_StartTransmit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RefreshMessagesCopyWith<$Res> {
  factory _$$_RefreshMessagesCopyWith(
          _$_RefreshMessages value, $Res Function(_$_RefreshMessages) then) =
      __$$_RefreshMessagesCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> messages});
}

/// @nodoc
class __$$_RefreshMessagesCopyWithImpl<$Res>
    extends _$HumanEventCopyWithImpl<$Res, _$_RefreshMessages>
    implements _$$_RefreshMessagesCopyWith<$Res> {
  __$$_RefreshMessagesCopyWithImpl(
      _$_RefreshMessages _value, $Res Function(_$_RefreshMessages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$_RefreshMessages(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_RefreshMessages implements _RefreshMessages {
  const _$_RefreshMessages({required final List<String> messages})
      : _messages = messages;

  final List<String> _messages;
  @override
  List<String> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'HumanEvent.refreshMessages(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshMessages &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshMessagesCopyWith<_$_RefreshMessages> get copyWith =>
      __$$_RefreshMessagesCopyWithImpl<_$_RefreshMessages>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function(List<String> messages) refreshMessages,
    required TResult Function(String imagePath) refreshImage,
    required TResult Function(int range) refreshRange,
    required TResult Function(String message, ErrorCallback onError)
        sendMessage,
    required TResult Function(String imagePath, ErrorCallback onError)
        sendImage,
    required TResult Function(ErrorCallback? onError) sendDataRequest,
    required TResult Function() stopTransmit,
  }) {
    return refreshMessages(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function(List<String> messages)? refreshMessages,
    TResult? Function(String imagePath)? refreshImage,
    TResult? Function(int range)? refreshRange,
    TResult? Function(String message, ErrorCallback onError)? sendMessage,
    TResult? Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult? Function(ErrorCallback? onError)? sendDataRequest,
    TResult? Function()? stopTransmit,
  }) {
    return refreshMessages?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function(List<String> messages)? refreshMessages,
    TResult Function(String imagePath)? refreshImage,
    TResult Function(int range)? refreshRange,
    TResult Function(String message, ErrorCallback onError)? sendMessage,
    TResult Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult Function(ErrorCallback? onError)? sendDataRequest,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) {
    if (refreshMessages != null) {
      return refreshMessages(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_RefreshMessages value) refreshMessages,
    required TResult Function(_RefreshImage value) refreshImage,
    required TResult Function(_RefreshRange value) refreshRange,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SendImage value) sendImage,
    required TResult Function(_SendDataRequest value) sendDataRequest,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return refreshMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_RefreshMessages value)? refreshMessages,
    TResult? Function(_RefreshImage value)? refreshImage,
    TResult? Function(_RefreshRange value)? refreshRange,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_SendImage value)? sendImage,
    TResult? Function(_SendDataRequest value)? sendDataRequest,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return refreshMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_RefreshMessages value)? refreshMessages,
    TResult Function(_RefreshImage value)? refreshImage,
    TResult Function(_RefreshRange value)? refreshRange,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SendImage value)? sendImage,
    TResult Function(_SendDataRequest value)? sendDataRequest,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (refreshMessages != null) {
      return refreshMessages(this);
    }
    return orElse();
  }
}

abstract class _RefreshMessages implements HumanEvent {
  const factory _RefreshMessages({required final List<String> messages}) =
      _$_RefreshMessages;

  List<String> get messages;
  @JsonKey(ignore: true)
  _$$_RefreshMessagesCopyWith<_$_RefreshMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RefreshImageCopyWith<$Res> {
  factory _$$_RefreshImageCopyWith(
          _$_RefreshImage value, $Res Function(_$_RefreshImage) then) =
      __$$_RefreshImageCopyWithImpl<$Res>;
  @useResult
  $Res call({String imagePath});
}

/// @nodoc
class __$$_RefreshImageCopyWithImpl<$Res>
    extends _$HumanEventCopyWithImpl<$Res, _$_RefreshImage>
    implements _$$_RefreshImageCopyWith<$Res> {
  __$$_RefreshImageCopyWithImpl(
      _$_RefreshImage _value, $Res Function(_$_RefreshImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
  }) {
    return _then(_$_RefreshImage(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RefreshImage implements _RefreshImage {
  const _$_RefreshImage({required this.imagePath});

  @override
  final String imagePath;

  @override
  String toString() {
    return 'HumanEvent.refreshImage(imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshImage &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshImageCopyWith<_$_RefreshImage> get copyWith =>
      __$$_RefreshImageCopyWithImpl<_$_RefreshImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function(List<String> messages) refreshMessages,
    required TResult Function(String imagePath) refreshImage,
    required TResult Function(int range) refreshRange,
    required TResult Function(String message, ErrorCallback onError)
        sendMessage,
    required TResult Function(String imagePath, ErrorCallback onError)
        sendImage,
    required TResult Function(ErrorCallback? onError) sendDataRequest,
    required TResult Function() stopTransmit,
  }) {
    return refreshImage(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function(List<String> messages)? refreshMessages,
    TResult? Function(String imagePath)? refreshImage,
    TResult? Function(int range)? refreshRange,
    TResult? Function(String message, ErrorCallback onError)? sendMessage,
    TResult? Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult? Function(ErrorCallback? onError)? sendDataRequest,
    TResult? Function()? stopTransmit,
  }) {
    return refreshImage?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function(List<String> messages)? refreshMessages,
    TResult Function(String imagePath)? refreshImage,
    TResult Function(int range)? refreshRange,
    TResult Function(String message, ErrorCallback onError)? sendMessage,
    TResult Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult Function(ErrorCallback? onError)? sendDataRequest,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) {
    if (refreshImage != null) {
      return refreshImage(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_RefreshMessages value) refreshMessages,
    required TResult Function(_RefreshImage value) refreshImage,
    required TResult Function(_RefreshRange value) refreshRange,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SendImage value) sendImage,
    required TResult Function(_SendDataRequest value) sendDataRequest,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return refreshImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_RefreshMessages value)? refreshMessages,
    TResult? Function(_RefreshImage value)? refreshImage,
    TResult? Function(_RefreshRange value)? refreshRange,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_SendImage value)? sendImage,
    TResult? Function(_SendDataRequest value)? sendDataRequest,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return refreshImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_RefreshMessages value)? refreshMessages,
    TResult Function(_RefreshImage value)? refreshImage,
    TResult Function(_RefreshRange value)? refreshRange,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SendImage value)? sendImage,
    TResult Function(_SendDataRequest value)? sendDataRequest,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (refreshImage != null) {
      return refreshImage(this);
    }
    return orElse();
  }
}

abstract class _RefreshImage implements HumanEvent {
  const factory _RefreshImage({required final String imagePath}) =
      _$_RefreshImage;

  String get imagePath;
  @JsonKey(ignore: true)
  _$$_RefreshImageCopyWith<_$_RefreshImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RefreshRangeCopyWith<$Res> {
  factory _$$_RefreshRangeCopyWith(
          _$_RefreshRange value, $Res Function(_$_RefreshRange) then) =
      __$$_RefreshRangeCopyWithImpl<$Res>;
  @useResult
  $Res call({int range});
}

/// @nodoc
class __$$_RefreshRangeCopyWithImpl<$Res>
    extends _$HumanEventCopyWithImpl<$Res, _$_RefreshRange>
    implements _$$_RefreshRangeCopyWith<$Res> {
  __$$_RefreshRangeCopyWithImpl(
      _$_RefreshRange _value, $Res Function(_$_RefreshRange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
  }) {
    return _then(_$_RefreshRange(
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RefreshRange implements _RefreshRange {
  const _$_RefreshRange({required this.range});

  @override
  final int range;

  @override
  String toString() {
    return 'HumanEvent.refreshRange(range: $range)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshRange &&
            (identical(other.range, range) || other.range == range));
  }

  @override
  int get hashCode => Object.hash(runtimeType, range);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshRangeCopyWith<_$_RefreshRange> get copyWith =>
      __$$_RefreshRangeCopyWithImpl<_$_RefreshRange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function(List<String> messages) refreshMessages,
    required TResult Function(String imagePath) refreshImage,
    required TResult Function(int range) refreshRange,
    required TResult Function(String message, ErrorCallback onError)
        sendMessage,
    required TResult Function(String imagePath, ErrorCallback onError)
        sendImage,
    required TResult Function(ErrorCallback? onError) sendDataRequest,
    required TResult Function() stopTransmit,
  }) {
    return refreshRange(range);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function(List<String> messages)? refreshMessages,
    TResult? Function(String imagePath)? refreshImage,
    TResult? Function(int range)? refreshRange,
    TResult? Function(String message, ErrorCallback onError)? sendMessage,
    TResult? Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult? Function(ErrorCallback? onError)? sendDataRequest,
    TResult? Function()? stopTransmit,
  }) {
    return refreshRange?.call(range);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function(List<String> messages)? refreshMessages,
    TResult Function(String imagePath)? refreshImage,
    TResult Function(int range)? refreshRange,
    TResult Function(String message, ErrorCallback onError)? sendMessage,
    TResult Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult Function(ErrorCallback? onError)? sendDataRequest,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) {
    if (refreshRange != null) {
      return refreshRange(range);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_RefreshMessages value) refreshMessages,
    required TResult Function(_RefreshImage value) refreshImage,
    required TResult Function(_RefreshRange value) refreshRange,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SendImage value) sendImage,
    required TResult Function(_SendDataRequest value) sendDataRequest,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return refreshRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_RefreshMessages value)? refreshMessages,
    TResult? Function(_RefreshImage value)? refreshImage,
    TResult? Function(_RefreshRange value)? refreshRange,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_SendImage value)? sendImage,
    TResult? Function(_SendDataRequest value)? sendDataRequest,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return refreshRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_RefreshMessages value)? refreshMessages,
    TResult Function(_RefreshImage value)? refreshImage,
    TResult Function(_RefreshRange value)? refreshRange,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SendImage value)? sendImage,
    TResult Function(_SendDataRequest value)? sendDataRequest,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (refreshRange != null) {
      return refreshRange(this);
    }
    return orElse();
  }
}

abstract class _RefreshRange implements HumanEvent {
  const factory _RefreshRange({required final int range}) = _$_RefreshRange;

  int get range;
  @JsonKey(ignore: true)
  _$$_RefreshRangeCopyWith<_$_RefreshRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendMessageCopyWith<$Res> {
  factory _$$_SendMessageCopyWith(
          _$_SendMessage value, $Res Function(_$_SendMessage) then) =
      __$$_SendMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, ErrorCallback onError});
}

/// @nodoc
class __$$_SendMessageCopyWithImpl<$Res>
    extends _$HumanEventCopyWithImpl<$Res, _$_SendMessage>
    implements _$$_SendMessageCopyWith<$Res> {
  __$$_SendMessageCopyWithImpl(
      _$_SendMessage _value, $Res Function(_$_SendMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? onError = null,
  }) {
    return _then(_$_SendMessage(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as ErrorCallback,
    ));
  }
}

/// @nodoc

class _$_SendMessage implements _SendMessage {
  const _$_SendMessage({required this.message, required this.onError});

  @override
  final String message;
  @override
  final ErrorCallback onError;

  @override
  String toString() {
    return 'HumanEvent.sendMessage(message: $message, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendMessage &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendMessageCopyWith<_$_SendMessage> get copyWith =>
      __$$_SendMessageCopyWithImpl<_$_SendMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function(List<String> messages) refreshMessages,
    required TResult Function(String imagePath) refreshImage,
    required TResult Function(int range) refreshRange,
    required TResult Function(String message, ErrorCallback onError)
        sendMessage,
    required TResult Function(String imagePath, ErrorCallback onError)
        sendImage,
    required TResult Function(ErrorCallback? onError) sendDataRequest,
    required TResult Function() stopTransmit,
  }) {
    return sendMessage(message, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function(List<String> messages)? refreshMessages,
    TResult? Function(String imagePath)? refreshImage,
    TResult? Function(int range)? refreshRange,
    TResult? Function(String message, ErrorCallback onError)? sendMessage,
    TResult? Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult? Function(ErrorCallback? onError)? sendDataRequest,
    TResult? Function()? stopTransmit,
  }) {
    return sendMessage?.call(message, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function(List<String> messages)? refreshMessages,
    TResult Function(String imagePath)? refreshImage,
    TResult Function(int range)? refreshRange,
    TResult Function(String message, ErrorCallback onError)? sendMessage,
    TResult Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult Function(ErrorCallback? onError)? sendDataRequest,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(message, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_RefreshMessages value) refreshMessages,
    required TResult Function(_RefreshImage value) refreshImage,
    required TResult Function(_RefreshRange value) refreshRange,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SendImage value) sendImage,
    required TResult Function(_SendDataRequest value) sendDataRequest,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_RefreshMessages value)? refreshMessages,
    TResult? Function(_RefreshImage value)? refreshImage,
    TResult? Function(_RefreshRange value)? refreshRange,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_SendImage value)? sendImage,
    TResult? Function(_SendDataRequest value)? sendDataRequest,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_RefreshMessages value)? refreshMessages,
    TResult Function(_RefreshImage value)? refreshImage,
    TResult Function(_RefreshRange value)? refreshRange,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SendImage value)? sendImage,
    TResult Function(_SendDataRequest value)? sendDataRequest,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements HumanEvent {
  const factory _SendMessage(
      {required final String message,
      required final ErrorCallback onError}) = _$_SendMessage;

  String get message;
  ErrorCallback get onError;
  @JsonKey(ignore: true)
  _$$_SendMessageCopyWith<_$_SendMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendImageCopyWith<$Res> {
  factory _$$_SendImageCopyWith(
          _$_SendImage value, $Res Function(_$_SendImage) then) =
      __$$_SendImageCopyWithImpl<$Res>;
  @useResult
  $Res call({String imagePath, ErrorCallback onError});
}

/// @nodoc
class __$$_SendImageCopyWithImpl<$Res>
    extends _$HumanEventCopyWithImpl<$Res, _$_SendImage>
    implements _$$_SendImageCopyWith<$Res> {
  __$$_SendImageCopyWithImpl(
      _$_SendImage _value, $Res Function(_$_SendImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
    Object? onError = null,
  }) {
    return _then(_$_SendImage(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      onError: null == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as ErrorCallback,
    ));
  }
}

/// @nodoc

class _$_SendImage implements _SendImage {
  const _$_SendImage({required this.imagePath, required this.onError});

  @override
  final String imagePath;
  @override
  final ErrorCallback onError;

  @override
  String toString() {
    return 'HumanEvent.sendImage(imagePath: $imagePath, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendImage &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendImageCopyWith<_$_SendImage> get copyWith =>
      __$$_SendImageCopyWithImpl<_$_SendImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function(List<String> messages) refreshMessages,
    required TResult Function(String imagePath) refreshImage,
    required TResult Function(int range) refreshRange,
    required TResult Function(String message, ErrorCallback onError)
        sendMessage,
    required TResult Function(String imagePath, ErrorCallback onError)
        sendImage,
    required TResult Function(ErrorCallback? onError) sendDataRequest,
    required TResult Function() stopTransmit,
  }) {
    return sendImage(imagePath, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function(List<String> messages)? refreshMessages,
    TResult? Function(String imagePath)? refreshImage,
    TResult? Function(int range)? refreshRange,
    TResult? Function(String message, ErrorCallback onError)? sendMessage,
    TResult? Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult? Function(ErrorCallback? onError)? sendDataRequest,
    TResult? Function()? stopTransmit,
  }) {
    return sendImage?.call(imagePath, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function(List<String> messages)? refreshMessages,
    TResult Function(String imagePath)? refreshImage,
    TResult Function(int range)? refreshRange,
    TResult Function(String message, ErrorCallback onError)? sendMessage,
    TResult Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult Function(ErrorCallback? onError)? sendDataRequest,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) {
    if (sendImage != null) {
      return sendImage(imagePath, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_RefreshMessages value) refreshMessages,
    required TResult Function(_RefreshImage value) refreshImage,
    required TResult Function(_RefreshRange value) refreshRange,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SendImage value) sendImage,
    required TResult Function(_SendDataRequest value) sendDataRequest,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return sendImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_RefreshMessages value)? refreshMessages,
    TResult? Function(_RefreshImage value)? refreshImage,
    TResult? Function(_RefreshRange value)? refreshRange,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_SendImage value)? sendImage,
    TResult? Function(_SendDataRequest value)? sendDataRequest,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return sendImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_RefreshMessages value)? refreshMessages,
    TResult Function(_RefreshImage value)? refreshImage,
    TResult Function(_RefreshRange value)? refreshRange,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SendImage value)? sendImage,
    TResult Function(_SendDataRequest value)? sendDataRequest,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (sendImage != null) {
      return sendImage(this);
    }
    return orElse();
  }
}

abstract class _SendImage implements HumanEvent {
  const factory _SendImage(
      {required final String imagePath,
      required final ErrorCallback onError}) = _$_SendImage;

  String get imagePath;
  ErrorCallback get onError;
  @JsonKey(ignore: true)
  _$$_SendImageCopyWith<_$_SendImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendDataRequestCopyWith<$Res> {
  factory _$$_SendDataRequestCopyWith(
          _$_SendDataRequest value, $Res Function(_$_SendDataRequest) then) =
      __$$_SendDataRequestCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorCallback? onError});
}

/// @nodoc
class __$$_SendDataRequestCopyWithImpl<$Res>
    extends _$HumanEventCopyWithImpl<$Res, _$_SendDataRequest>
    implements _$$_SendDataRequestCopyWith<$Res> {
  __$$_SendDataRequestCopyWithImpl(
      _$_SendDataRequest _value, $Res Function(_$_SendDataRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onError = freezed,
  }) {
    return _then(_$_SendDataRequest(
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as ErrorCallback?,
    ));
  }
}

/// @nodoc

class _$_SendDataRequest implements _SendDataRequest {
  const _$_SendDataRequest({this.onError});

  @override
  final ErrorCallback? onError;

  @override
  String toString() {
    return 'HumanEvent.sendDataRequest(onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendDataRequest &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendDataRequestCopyWith<_$_SendDataRequest> get copyWith =>
      __$$_SendDataRequestCopyWithImpl<_$_SendDataRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function(List<String> messages) refreshMessages,
    required TResult Function(String imagePath) refreshImage,
    required TResult Function(int range) refreshRange,
    required TResult Function(String message, ErrorCallback onError)
        sendMessage,
    required TResult Function(String imagePath, ErrorCallback onError)
        sendImage,
    required TResult Function(ErrorCallback? onError) sendDataRequest,
    required TResult Function() stopTransmit,
  }) {
    return sendDataRequest(onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function(List<String> messages)? refreshMessages,
    TResult? Function(String imagePath)? refreshImage,
    TResult? Function(int range)? refreshRange,
    TResult? Function(String message, ErrorCallback onError)? sendMessage,
    TResult? Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult? Function(ErrorCallback? onError)? sendDataRequest,
    TResult? Function()? stopTransmit,
  }) {
    return sendDataRequest?.call(onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function(List<String> messages)? refreshMessages,
    TResult Function(String imagePath)? refreshImage,
    TResult Function(int range)? refreshRange,
    TResult Function(String message, ErrorCallback onError)? sendMessage,
    TResult Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult Function(ErrorCallback? onError)? sendDataRequest,
    TResult Function()? stopTransmit,
    required TResult orElse(),
  }) {
    if (sendDataRequest != null) {
      return sendDataRequest(onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_RefreshMessages value) refreshMessages,
    required TResult Function(_RefreshImage value) refreshImage,
    required TResult Function(_RefreshRange value) refreshRange,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SendImage value) sendImage,
    required TResult Function(_SendDataRequest value) sendDataRequest,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return sendDataRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_RefreshMessages value)? refreshMessages,
    TResult? Function(_RefreshImage value)? refreshImage,
    TResult? Function(_RefreshRange value)? refreshRange,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_SendImage value)? sendImage,
    TResult? Function(_SendDataRequest value)? sendDataRequest,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return sendDataRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_RefreshMessages value)? refreshMessages,
    TResult Function(_RefreshImage value)? refreshImage,
    TResult Function(_RefreshRange value)? refreshRange,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SendImage value)? sendImage,
    TResult Function(_SendDataRequest value)? sendDataRequest,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (sendDataRequest != null) {
      return sendDataRequest(this);
    }
    return orElse();
  }
}

abstract class _SendDataRequest implements HumanEvent {
  const factory _SendDataRequest({final ErrorCallback? onError}) =
      _$_SendDataRequest;

  ErrorCallback? get onError;
  @JsonKey(ignore: true)
  _$$_SendDataRequestCopyWith<_$_SendDataRequest> get copyWith =>
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
    extends _$HumanEventCopyWithImpl<$Res, _$_StopTransmit>
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
    return 'HumanEvent.stopTransmit()';
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
    required TResult Function(ErrorCallback onError) startTransmit,
    required TResult Function(List<String> messages) refreshMessages,
    required TResult Function(String imagePath) refreshImage,
    required TResult Function(int range) refreshRange,
    required TResult Function(String message, ErrorCallback onError)
        sendMessage,
    required TResult Function(String imagePath, ErrorCallback onError)
        sendImage,
    required TResult Function(ErrorCallback? onError) sendDataRequest,
    required TResult Function() stopTransmit,
  }) {
    return stopTransmit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorCallback onError)? startTransmit,
    TResult? Function(List<String> messages)? refreshMessages,
    TResult? Function(String imagePath)? refreshImage,
    TResult? Function(int range)? refreshRange,
    TResult? Function(String message, ErrorCallback onError)? sendMessage,
    TResult? Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult? Function(ErrorCallback? onError)? sendDataRequest,
    TResult? Function()? stopTransmit,
  }) {
    return stopTransmit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorCallback onError)? startTransmit,
    TResult Function(List<String> messages)? refreshMessages,
    TResult Function(String imagePath)? refreshImage,
    TResult Function(int range)? refreshRange,
    TResult Function(String message, ErrorCallback onError)? sendMessage,
    TResult Function(String imagePath, ErrorCallback onError)? sendImage,
    TResult Function(ErrorCallback? onError)? sendDataRequest,
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
    required TResult Function(_StartTransmit value) startTransmit,
    required TResult Function(_RefreshMessages value) refreshMessages,
    required TResult Function(_RefreshImage value) refreshImage,
    required TResult Function(_RefreshRange value) refreshRange,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SendImage value) sendImage,
    required TResult Function(_SendDataRequest value) sendDataRequest,
    required TResult Function(_StopTransmit value) stopTransmit,
  }) {
    return stopTransmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTransmit value)? startTransmit,
    TResult? Function(_RefreshMessages value)? refreshMessages,
    TResult? Function(_RefreshImage value)? refreshImage,
    TResult? Function(_RefreshRange value)? refreshRange,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_SendImage value)? sendImage,
    TResult? Function(_SendDataRequest value)? sendDataRequest,
    TResult? Function(_StopTransmit value)? stopTransmit,
  }) {
    return stopTransmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTransmit value)? startTransmit,
    TResult Function(_RefreshMessages value)? refreshMessages,
    TResult Function(_RefreshImage value)? refreshImage,
    TResult Function(_RefreshRange value)? refreshRange,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SendImage value)? sendImage,
    TResult Function(_SendDataRequest value)? sendDataRequest,
    TResult Function(_StopTransmit value)? stopTransmit,
    required TResult orElse(),
  }) {
    if (stopTransmit != null) {
      return stopTransmit(this);
    }
    return orElse();
  }
}

abstract class _StopTransmit implements HumanEvent {
  const factory _StopTransmit() = _$_StopTransmit;
}

/// @nodoc
mixin _$HumanState {
  String get name => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isTransmitting => throw _privateConstructorUsedError;
  dynamic get isConnected => throw _privateConstructorUsedError;
  List<String> get messages => throw _privateConstructorUsedError;
  bool get isClose => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HumanStateCopyWith<HumanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HumanStateCopyWith<$Res> {
  factory $HumanStateCopyWith(
          HumanState value, $Res Function(HumanState) then) =
      _$HumanStateCopyWithImpl<$Res, HumanState>;
  @useResult
  $Res call(
      {String name,
      bool isLoading,
      bool isTransmitting,
      dynamic isConnected,
      List<String> messages,
      bool isClose,
      File? image});
}

/// @nodoc
class _$HumanStateCopyWithImpl<$Res, $Val extends HumanState>
    implements $HumanStateCopyWith<$Res> {
  _$HumanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isLoading = null,
    Object? isTransmitting = null,
    Object? isConnected = null,
    Object? messages = null,
    Object? isClose = null,
    Object? image = freezed,
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
      isTransmitting: null == isTransmitting
          ? _value.isTransmitting
          : isTransmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as dynamic,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isClose: null == isClose
          ? _value.isClose
          : isClose // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $HumanStateCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      bool isLoading,
      bool isTransmitting,
      dynamic isConnected,
      List<String> messages,
      bool isClose,
      File? image});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res>
    extends _$HumanStateCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isLoading = null,
    Object? isTransmitting = null,
    Object? isConnected = null,
    Object? messages = null,
    Object? isClose = null,
    Object? image = freezed,
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
      isTransmitting: null == isTransmitting
          ? _value.isTransmitting
          : isTransmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected ? _value.isConnected : isConnected,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isClose: null == isClose
          ? _value.isClose
          : isClose // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_Data implements _Data {
  const _$_Data(
      {required this.name,
      this.isLoading = false,
      this.isTransmitting = false,
      this.isConnected = false,
      final List<String> messages = const [],
      this.isClose = false,
      this.image})
      : _messages = messages;

  @override
  final String name;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isTransmitting;
  @override
  @JsonKey()
  final dynamic isConnected;
  final List<String> _messages;
  @override
  @JsonKey()
  List<String> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool isClose;
  @override
  final File? image;

  @override
  String toString() {
    return 'HumanState(name: $name, isLoading: $isLoading, isTransmitting: $isTransmitting, isConnected: $isConnected, messages: $messages, isClose: $isClose, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isTransmitting, isTransmitting) ||
                other.isTransmitting == isTransmitting) &&
            const DeepCollectionEquality()
                .equals(other.isConnected, isConnected) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isClose, isClose) || other.isClose == isClose) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      isLoading,
      isTransmitting,
      const DeepCollectionEquality().hash(isConnected),
      const DeepCollectionEquality().hash(_messages),
      isClose,
      image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);
}

abstract class _Data implements HumanState {
  const factory _Data(
      {required final String name,
      final bool isLoading,
      final bool isTransmitting,
      final dynamic isConnected,
      final List<String> messages,
      final bool isClose,
      final File? image}) = _$_Data;

  @override
  String get name;
  @override
  bool get isLoading;
  @override
  bool get isTransmitting;
  @override
  dynamic get isConnected;
  @override
  List<String> get messages;
  @override
  bool get isClose;
  @override
  File? get image;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
