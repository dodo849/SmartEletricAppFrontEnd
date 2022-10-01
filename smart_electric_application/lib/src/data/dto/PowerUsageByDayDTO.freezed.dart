// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'PowerUsageByDayDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PowerUsageByDayDTO _$PowerUsageByDayDTOFromJson(Map<String, dynamic> json) {
  return _PowerUsageByDayDTO.fromJson(json);
}

/// @nodoc
mixin _$PowerUsageByDayDTO {
  String get dateTimeKr => throw _privateConstructorUsedError;
  double get powerUsageQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PowerUsageByDayDTOCopyWith<PowerUsageByDayDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PowerUsageByDayDTOCopyWith<$Res> {
  factory $PowerUsageByDayDTOCopyWith(
          PowerUsageByDayDTO value, $Res Function(PowerUsageByDayDTO) then) =
      _$PowerUsageByDayDTOCopyWithImpl<$Res>;
  $Res call({String dateTimeKr, double powerUsageQuantity});
}

/// @nodoc
class _$PowerUsageByDayDTOCopyWithImpl<$Res>
    implements $PowerUsageByDayDTOCopyWith<$Res> {
  _$PowerUsageByDayDTOCopyWithImpl(this._value, this._then);

  final PowerUsageByDayDTO _value;
  // ignore: unused_field
  final $Res Function(PowerUsageByDayDTO) _then;

  @override
  $Res call({
    Object? dateTimeKr = freezed,
    Object? powerUsageQuantity = freezed,
  }) {
    return _then(_value.copyWith(
      dateTimeKr: dateTimeKr == freezed
          ? _value.dateTimeKr
          : dateTimeKr // ignore: cast_nullable_to_non_nullable
              as String,
      powerUsageQuantity: powerUsageQuantity == freezed
          ? _value.powerUsageQuantity
          : powerUsageQuantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_PowerUsageByDayDTOCopyWith<$Res>
    implements $PowerUsageByDayDTOCopyWith<$Res> {
  factory _$$_PowerUsageByDayDTOCopyWith(_$_PowerUsageByDayDTO value,
          $Res Function(_$_PowerUsageByDayDTO) then) =
      __$$_PowerUsageByDayDTOCopyWithImpl<$Res>;
  @override
  $Res call({String dateTimeKr, double powerUsageQuantity});
}

/// @nodoc
class __$$_PowerUsageByDayDTOCopyWithImpl<$Res>
    extends _$PowerUsageByDayDTOCopyWithImpl<$Res>
    implements _$$_PowerUsageByDayDTOCopyWith<$Res> {
  __$$_PowerUsageByDayDTOCopyWithImpl(
      _$_PowerUsageByDayDTO _value, $Res Function(_$_PowerUsageByDayDTO) _then)
      : super(_value, (v) => _then(v as _$_PowerUsageByDayDTO));

  @override
  _$_PowerUsageByDayDTO get _value => super._value as _$_PowerUsageByDayDTO;

  @override
  $Res call({
    Object? dateTimeKr = freezed,
    Object? powerUsageQuantity = freezed,
  }) {
    return _then(_$_PowerUsageByDayDTO(
      dateTimeKr: dateTimeKr == freezed
          ? _value.dateTimeKr
          : dateTimeKr // ignore: cast_nullable_to_non_nullable
              as String,
      powerUsageQuantity: powerUsageQuantity == freezed
          ? _value.powerUsageQuantity
          : powerUsageQuantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PowerUsageByDayDTO implements _PowerUsageByDayDTO {
  _$_PowerUsageByDayDTO(
      {required this.dateTimeKr, required this.powerUsageQuantity});

  factory _$_PowerUsageByDayDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PowerUsageByDayDTOFromJson(json);

  @override
  final String dateTimeKr;
  @override
  final double powerUsageQuantity;

  @override
  String toString() {
    return 'PowerUsageByDayDTO(dateTimeKr: $dateTimeKr, powerUsageQuantity: $powerUsageQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PowerUsageByDayDTO &&
            const DeepCollectionEquality()
                .equals(other.dateTimeKr, dateTimeKr) &&
            const DeepCollectionEquality()
                .equals(other.powerUsageQuantity, powerUsageQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dateTimeKr),
      const DeepCollectionEquality().hash(powerUsageQuantity));

  @JsonKey(ignore: true)
  @override
  _$$_PowerUsageByDayDTOCopyWith<_$_PowerUsageByDayDTO> get copyWith =>
      __$$_PowerUsageByDayDTOCopyWithImpl<_$_PowerUsageByDayDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PowerUsageByDayDTOToJson(
      this,
    );
  }
}

abstract class _PowerUsageByDayDTO implements PowerUsageByDayDTO {
  factory _PowerUsageByDayDTO(
      {required final String dateTimeKr,
      required final double powerUsageQuantity}) = _$_PowerUsageByDayDTO;

  factory _PowerUsageByDayDTO.fromJson(Map<String, dynamic> json) =
      _$_PowerUsageByDayDTO.fromJson;

  @override
  String get dateTimeKr;
  @override
  double get powerUsageQuantity;
  @override
  @JsonKey(ignore: true)
  _$$_PowerUsageByDayDTOCopyWith<_$_PowerUsageByDayDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
