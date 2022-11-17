// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataEventModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> messages) messages,
    required TResult Function(String imagePath) image,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> messages)? messages,
    TResult? Function(String imagePath)? image,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> messages)? messages,
    TResult Function(String imagePath)? image,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Messages value) messages,
    required TResult Function(_Image value) image,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Messages value)? messages,
    TResult? Function(_Image value)? image,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Messages value)? messages,
    TResult Function(_Image value)? image,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataEventModelCopyWith<$Res> {
  factory $DataEventModelCopyWith(
          DataEventModel value, $Res Function(DataEventModel) then) =
      _$DataEventModelCopyWithImpl<$Res, DataEventModel>;
}

/// @nodoc
class _$DataEventModelCopyWithImpl<$Res, $Val extends DataEventModel>
    implements $DataEventModelCopyWith<$Res> {
  _$DataEventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_MessagesCopyWith<$Res> {
  factory _$$_MessagesCopyWith(
          _$_Messages value, $Res Function(_$_Messages) then) =
      __$$_MessagesCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> messages});
}

/// @nodoc
class __$$_MessagesCopyWithImpl<$Res>
    extends _$DataEventModelCopyWithImpl<$Res, _$_Messages>
    implements _$$_MessagesCopyWith<$Res> {
  __$$_MessagesCopyWithImpl(
      _$_Messages _value, $Res Function(_$_Messages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$_Messages(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Messages with DiagnosticableTreeMixin implements _Messages {
  const _$_Messages({required final List<String> messages})
      : _messages = messages;

  final List<String> _messages;
  @override
  List<String> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataEventModel.messages(messages: $messages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DataEventModel.messages'))
      ..add(DiagnosticsProperty('messages', messages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Messages &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessagesCopyWith<_$_Messages> get copyWith =>
      __$$_MessagesCopyWithImpl<_$_Messages>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> messages) messages,
    required TResult Function(String imagePath) image,
  }) {
    return messages(this.messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> messages)? messages,
    TResult? Function(String imagePath)? image,
  }) {
    return messages?.call(this.messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> messages)? messages,
    TResult Function(String imagePath)? image,
    required TResult orElse(),
  }) {
    if (messages != null) {
      return messages(this.messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Messages value) messages,
    required TResult Function(_Image value) image,
  }) {
    return messages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Messages value)? messages,
    TResult? Function(_Image value)? image,
  }) {
    return messages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Messages value)? messages,
    TResult Function(_Image value)? image,
    required TResult orElse(),
  }) {
    if (messages != null) {
      return messages(this);
    }
    return orElse();
  }
}

abstract class _Messages implements DataEventModel {
  const factory _Messages({required final List<String> messages}) = _$_Messages;

  List<String> get messages;
  @JsonKey(ignore: true)
  _$$_MessagesCopyWith<_$_Messages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ImageCopyWith<$Res> {
  factory _$$_ImageCopyWith(_$_Image value, $Res Function(_$_Image) then) =
      __$$_ImageCopyWithImpl<$Res>;
  @useResult
  $Res call({String imagePath});
}

/// @nodoc
class __$$_ImageCopyWithImpl<$Res>
    extends _$DataEventModelCopyWithImpl<$Res, _$_Image>
    implements _$$_ImageCopyWith<$Res> {
  __$$_ImageCopyWithImpl(_$_Image _value, $Res Function(_$_Image) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
  }) {
    return _then(_$_Image(
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Image with DiagnosticableTreeMixin implements _Image {
  const _$_Image({required this.imagePath});

  @override
  final String imagePath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataEventModel.image(imagePath: $imagePath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DataEventModel.image'))
      ..add(DiagnosticsProperty('imagePath', imagePath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Image &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      __$$_ImageCopyWithImpl<_$_Image>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> messages) messages,
    required TResult Function(String imagePath) image,
  }) {
    return image(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> messages)? messages,
    TResult? Function(String imagePath)? image,
  }) {
    return image?.call(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> messages)? messages,
    TResult Function(String imagePath)? image,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Messages value) messages,
    required TResult Function(_Image value) image,
  }) {
    return image(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Messages value)? messages,
    TResult? Function(_Image value)? image,
  }) {
    return image?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Messages value)? messages,
    TResult Function(_Image value)? image,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(this);
    }
    return orElse();
  }
}

abstract class _Image implements DataEventModel {
  const factory _Image({required final String imagePath}) = _$_Image;

  String get imagePath;
  @JsonKey(ignore: true)
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      throw _privateConstructorUsedError;
}
