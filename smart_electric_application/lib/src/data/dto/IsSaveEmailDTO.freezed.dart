// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'IsSaveEmailDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IsSaveEmailDTO _$IsSaveEmailDTOFromJson(Map<String, dynamic> json) {
  return _IsSaveEmailDTO.fromJson(json);
}

/// @nodoc
mixin _$IsSaveEmailDTO {
  bool get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IsSaveEmailDTOCopyWith<IsSaveEmailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsSaveEmailDTOCopyWith<$Res> {
  factory $IsSaveEmailDTOCopyWith(
          IsSaveEmailDTO value, $Res Function(IsSaveEmailDTO) then) =
      _$IsSaveEmailDTOCopyWithImpl<$Res>;
  $Res call({bool updated});
}

/// @nodoc
class _$IsSaveEmailDTOCopyWithImpl<$Res>
    implements $IsSaveEmailDTOCopyWith<$Res> {
  _$IsSaveEmailDTOCopyWithImpl(this._value, this._then);

  final IsSaveEmailDTO _value;
  // ignore: unused_field
  final $Res Function(IsSaveEmailDTO) _then;

  @override
  $Res call({
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_IsSaveEmailDTOCopyWith<$Res>
    implements $IsSaveEmailDTOCopyWith<$Res> {
  factory _$$_IsSaveEmailDTOCopyWith(
          _$_IsSaveEmailDTO value, $Res Function(_$_IsSaveEmailDTO) then) =
      __$$_IsSaveEmailDTOCopyWithImpl<$Res>;
  @override
  $Res call({bool updated});
}

/// @nodoc
class __$$_IsSaveEmailDTOCopyWithImpl<$Res>
    extends _$IsSaveEmailDTOCopyWithImpl<$Res>
    implements _$$_IsSaveEmailDTOCopyWith<$Res> {
  __$$_IsSaveEmailDTOCopyWithImpl(
      _$_IsSaveEmailDTO _value, $Res Function(_$_IsSaveEmailDTO) _then)
      : super(_value, (v) => _then(v as _$_IsSaveEmailDTO));

  @override
  _$_IsSaveEmailDTO get _value => super._value as _$_IsSaveEmailDTO;

  @override
  $Res call({
    Object? updated = freezed,
  }) {
    return _then(_$_IsSaveEmailDTO(
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IsSaveEmailDTO implements _IsSaveEmailDTO {
  _$_IsSaveEmailDTO({required this.updated});

  factory _$_IsSaveEmailDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IsSaveEmailDTOFromJson(json);

  @override
  final bool updated;

  @override
  String toString() {
    return 'IsSaveEmailDTO(updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IsSaveEmailDTO &&
            const DeepCollectionEquality().equals(other.updated, updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(updated));

  @JsonKey(ignore: true)
  @override
  _$$_IsSaveEmailDTOCopyWith<_$_IsSaveEmailDTO> get copyWith =>
      __$$_IsSaveEmailDTOCopyWithImpl<_$_IsSaveEmailDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IsSaveEmailDTOToJson(
      this,
    );
  }
}

abstract class _IsSaveEmailDTO implements IsSaveEmailDTO {
  factory _IsSaveEmailDTO({required final bool updated}) = _$_IsSaveEmailDTO;

  factory _IsSaveEmailDTO.fromJson(Map<String, dynamic> json) =
      _$_IsSaveEmailDTO.fromJson;

  @override
  bool get updated;
  @override
  @JsonKey(ignore: true)
  _$$_IsSaveEmailDTOCopyWith<_$_IsSaveEmailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
