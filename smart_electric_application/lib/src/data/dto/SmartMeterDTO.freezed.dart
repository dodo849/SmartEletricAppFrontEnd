// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'SmartMeterDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SmartMeterDTO _$SmartMeterDTOFromJson(Map<String, dynamic> json) {
  return _SmartMeterDTO.fromJson(json);
}

/// @nodoc
mixin _$SmartMeterDTO {
  bool get custNumValidation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartMeterDTOCopyWith<SmartMeterDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartMeterDTOCopyWith<$Res> {
  factory $SmartMeterDTOCopyWith(
          SmartMeterDTO value, $Res Function(SmartMeterDTO) then) =
      _$SmartMeterDTOCopyWithImpl<$Res>;
  $Res call({bool custNumValidation});
}

/// @nodoc
class _$SmartMeterDTOCopyWithImpl<$Res>
    implements $SmartMeterDTOCopyWith<$Res> {
  _$SmartMeterDTOCopyWithImpl(this._value, this._then);

  final SmartMeterDTO _value;
  // ignore: unused_field
  final $Res Function(SmartMeterDTO) _then;

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
abstract class _$$_SmartMeterDTOCopyWith<$Res>
    implements $SmartMeterDTOCopyWith<$Res> {
  factory _$$_SmartMeterDTOCopyWith(
          _$_SmartMeterDTO value, $Res Function(_$_SmartMeterDTO) then) =
      __$$_SmartMeterDTOCopyWithImpl<$Res>;
  @override
  $Res call({bool custNumValidation});
}

/// @nodoc
class __$$_SmartMeterDTOCopyWithImpl<$Res>
    extends _$SmartMeterDTOCopyWithImpl<$Res>
    implements _$$_SmartMeterDTOCopyWith<$Res> {
  __$$_SmartMeterDTOCopyWithImpl(
      _$_SmartMeterDTO _value, $Res Function(_$_SmartMeterDTO) _then)
      : super(_value, (v) => _then(v as _$_SmartMeterDTO));

  @override
  _$_SmartMeterDTO get _value => super._value as _$_SmartMeterDTO;

  @override
  $Res call({
    Object? custNumValidation = freezed,
  }) {
    return _then(_$_SmartMeterDTO(
      custNumValidation: custNumValidation == freezed
          ? _value.custNumValidation
          : custNumValidation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SmartMeterDTO implements _SmartMeterDTO {
  _$_SmartMeterDTO({required this.custNumValidation});

  factory _$_SmartMeterDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SmartMeterDTOFromJson(json);

  @override
  final bool custNumValidation;

  @override
  String toString() {
    return 'SmartMeterDTO(custNumValidation: $custNumValidation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SmartMeterDTO &&
            const DeepCollectionEquality()
                .equals(other.custNumValidation, custNumValidation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(custNumValidation));

  @JsonKey(ignore: true)
  @override
  _$$_SmartMeterDTOCopyWith<_$_SmartMeterDTO> get copyWith =>
      __$$_SmartMeterDTOCopyWithImpl<_$_SmartMeterDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmartMeterDTOToJson(
      this,
    );
  }
}

abstract class _SmartMeterDTO implements SmartMeterDTO {
  factory _SmartMeterDTO({required final bool custNumValidation}) =
      _$_SmartMeterDTO;

  factory _SmartMeterDTO.fromJson(Map<String, dynamic> json) =
      _$_SmartMeterDTO.fromJson;

  @override
  bool get custNumValidation;
  @override
  @JsonKey(ignore: true)
  _$$_SmartMeterDTOCopyWith<_$_SmartMeterDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
