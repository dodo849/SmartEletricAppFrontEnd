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
      _$SmartMeterDTOCopyWithImpl<$Res, SmartMeterDTO>;
  @useResult
  $Res call({bool custNumValidation});
}

/// @nodoc
class _$SmartMeterDTOCopyWithImpl<$Res, $Val extends SmartMeterDTO>
    implements $SmartMeterDTOCopyWith<$Res> {
  _$SmartMeterDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custNumValidation = null,
  }) {
    return _then(_value.copyWith(
      custNumValidation: null == custNumValidation
          ? _value.custNumValidation
          : custNumValidation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SmartMeterDTOCopyWith<$Res>
    implements $SmartMeterDTOCopyWith<$Res> {
  factory _$$_SmartMeterDTOCopyWith(
          _$_SmartMeterDTO value, $Res Function(_$_SmartMeterDTO) then) =
      __$$_SmartMeterDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool custNumValidation});
}

/// @nodoc
class __$$_SmartMeterDTOCopyWithImpl<$Res>
    extends _$SmartMeterDTOCopyWithImpl<$Res, _$_SmartMeterDTO>
    implements _$$_SmartMeterDTOCopyWith<$Res> {
  __$$_SmartMeterDTOCopyWithImpl(
      _$_SmartMeterDTO _value, $Res Function(_$_SmartMeterDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custNumValidation = null,
  }) {
    return _then(_$_SmartMeterDTO(
      custNumValidation: null == custNumValidation
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
            (identical(other.custNumValidation, custNumValidation) ||
                other.custNumValidation == custNumValidation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, custNumValidation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
