// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'IsSmartMeterDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IsSmartMeterDTO _$IsSmartMeterDTOFromJson(Map<String, dynamic> json) {
  return _IsSmartMeterDTO.fromJson(json);
}

/// @nodoc
mixin _$IsSmartMeterDTO {
  bool get custNumValidation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IsSmartMeterDTOCopyWith<IsSmartMeterDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsSmartMeterDTOCopyWith<$Res> {
  factory $IsSmartMeterDTOCopyWith(
          IsSmartMeterDTO value, $Res Function(IsSmartMeterDTO) then) =
      _$IsSmartMeterDTOCopyWithImpl<$Res>;
  $Res call({bool custNumValidation});
}

/// @nodoc
class _$IsSmartMeterDTOCopyWithImpl<$Res>
    implements $IsSmartMeterDTOCopyWith<$Res> {
  _$IsSmartMeterDTOCopyWithImpl(this._value, this._then);

  final IsSmartMeterDTO _value;
  // ignore: unused_field
  final $Res Function(IsSmartMeterDTO) _then;

  @override
  $Res call({
    Object? custNumValidation = freezed,
  }) {
    return _then(_value.copyWith(
      custNumValidation: custNumValidation == freezed
          ? _value.custNumValidation
          : custNumValidation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_IsSmartMeterDTOCopyWith<$Res>
    implements $IsSmartMeterDTOCopyWith<$Res> {
  factory _$$_IsSmartMeterDTOCopyWith(
          _$_IsSmartMeterDTO value, $Res Function(_$_IsSmartMeterDTO) then) =
      __$$_IsSmartMeterDTOCopyWithImpl<$Res>;
  @override
  $Res call({bool custNumValidation});
}

/// @nodoc
class __$$_IsSmartMeterDTOCopyWithImpl<$Res>
    extends _$IsSmartMeterDTOCopyWithImpl<$Res>
    implements _$$_IsSmartMeterDTOCopyWith<$Res> {
  __$$_IsSmartMeterDTOCopyWithImpl(
      _$_IsSmartMeterDTO _value, $Res Function(_$_IsSmartMeterDTO) _then)
      : super(_value, (v) => _then(v as _$_IsSmartMeterDTO));

  @override
  _$_IsSmartMeterDTO get _value => super._value as _$_IsSmartMeterDTO;

  @override
  $Res call({
    Object? custNumValidation = freezed,
  }) {
    return _then(_$_IsSmartMeterDTO(
      custNumValidation: custNumValidation == freezed
          ? _value.custNumValidation
          : custNumValidation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IsSmartMeterDTO implements _IsSmartMeterDTO {
  _$_IsSmartMeterDTO({required this.custNumValidation});

  factory _$_IsSmartMeterDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IsSmartMeterDTOFromJson(json);

  @override
  final bool custNumValidation;

  @override
  String toString() {
    return 'IsSmartMeterDTO(custNumValidation: $custNumValidation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IsSmartMeterDTO &&
            const DeepCollectionEquality()
                .equals(other.custNumValidation, custNumValidation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(custNumValidation));

  @JsonKey(ignore: true)
  @override
  _$$_IsSmartMeterDTOCopyWith<_$_IsSmartMeterDTO> get copyWith =>
      __$$_IsSmartMeterDTOCopyWithImpl<_$_IsSmartMeterDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IsSmartMeterDTOToJson(
      this,
    );
  }
}

abstract class _IsSmartMeterDTO implements IsSmartMeterDTO {
  factory _IsSmartMeterDTO({required final bool custNumValidation}) =
      _$_IsSmartMeterDTO;

  factory _IsSmartMeterDTO.fromJson(Map<String, dynamic> json) =
      _$_IsSmartMeterDTO.fromJson;

  @override
  bool get custNumValidation;
  @override
  @JsonKey(ignore: true)
  _$$_IsSmartMeterDTOCopyWith<_$_IsSmartMeterDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
