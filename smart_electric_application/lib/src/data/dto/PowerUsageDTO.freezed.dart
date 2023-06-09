// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'PowerUsageDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PowerUsageDTO _$PowerUsageDTOFromJson(Map<String, dynamic> json) {
  return _PowerUsageDTO.fromJson(json);
}

/// @nodoc
mixin _$PowerUsageDTO {
  String? get startDateKr => throw _privateConstructorUsedError;
  String? get endDateKr => throw _privateConstructorUsedError;
  String get dateTimeKr => throw _privateConstructorUsedError;
  double get powerUsageQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PowerUsageDTOCopyWith<PowerUsageDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PowerUsageDTOCopyWith<$Res> {
  factory $PowerUsageDTOCopyWith(
          PowerUsageDTO value, $Res Function(PowerUsageDTO) then) =
      _$PowerUsageDTOCopyWithImpl<$Res, PowerUsageDTO>;
  @useResult
  $Res call(
      {String? startDateKr,
      String? endDateKr,
      String dateTimeKr,
      double powerUsageQuantity});
}

/// @nodoc
class _$PowerUsageDTOCopyWithImpl<$Res, $Val extends PowerUsageDTO>
    implements $PowerUsageDTOCopyWith<$Res> {
  _$PowerUsageDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDateKr = freezed,
    Object? endDateKr = freezed,
    Object? dateTimeKr = null,
    Object? powerUsageQuantity = null,
  }) {
    return _then(_value.copyWith(
      startDateKr: freezed == startDateKr
          ? _value.startDateKr
          : startDateKr // ignore: cast_nullable_to_non_nullable
              as String?,
      endDateKr: freezed == endDateKr
          ? _value.endDateKr
          : endDateKr // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTimeKr: null == dateTimeKr
          ? _value.dateTimeKr
          : dateTimeKr // ignore: cast_nullable_to_non_nullable
              as String,
      powerUsageQuantity: null == powerUsageQuantity
          ? _value.powerUsageQuantity
          : powerUsageQuantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PowerUsageDTOCopyWith<$Res>
    implements $PowerUsageDTOCopyWith<$Res> {
  factory _$$_PowerUsageDTOCopyWith(
          _$_PowerUsageDTO value, $Res Function(_$_PowerUsageDTO) then) =
      __$$_PowerUsageDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? startDateKr,
      String? endDateKr,
      String dateTimeKr,
      double powerUsageQuantity});
}

/// @nodoc
class __$$_PowerUsageDTOCopyWithImpl<$Res>
    extends _$PowerUsageDTOCopyWithImpl<$Res, _$_PowerUsageDTO>
    implements _$$_PowerUsageDTOCopyWith<$Res> {
  __$$_PowerUsageDTOCopyWithImpl(
      _$_PowerUsageDTO _value, $Res Function(_$_PowerUsageDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDateKr = freezed,
    Object? endDateKr = freezed,
    Object? dateTimeKr = null,
    Object? powerUsageQuantity = null,
  }) {
    return _then(_$_PowerUsageDTO(
      startDateKr: freezed == startDateKr
          ? _value.startDateKr
          : startDateKr // ignore: cast_nullable_to_non_nullable
              as String?,
      endDateKr: freezed == endDateKr
          ? _value.endDateKr
          : endDateKr // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTimeKr: null == dateTimeKr
          ? _value.dateTimeKr
          : dateTimeKr // ignore: cast_nullable_to_non_nullable
              as String,
      powerUsageQuantity: null == powerUsageQuantity
          ? _value.powerUsageQuantity
          : powerUsageQuantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PowerUsageDTO implements _PowerUsageDTO {
  _$_PowerUsageDTO(
      {this.startDateKr,
      this.endDateKr,
      required this.dateTimeKr,
      required this.powerUsageQuantity});

  factory _$_PowerUsageDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PowerUsageDTOFromJson(json);

  @override
  final String? startDateKr;
  @override
  final String? endDateKr;
  @override
  final String dateTimeKr;
  @override
  final double powerUsageQuantity;

  @override
  String toString() {
    return 'PowerUsageDTO(startDateKr: $startDateKr, endDateKr: $endDateKr, dateTimeKr: $dateTimeKr, powerUsageQuantity: $powerUsageQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PowerUsageDTO &&
            (identical(other.startDateKr, startDateKr) ||
                other.startDateKr == startDateKr) &&
            (identical(other.endDateKr, endDateKr) ||
                other.endDateKr == endDateKr) &&
            (identical(other.dateTimeKr, dateTimeKr) ||
                other.dateTimeKr == dateTimeKr) &&
            (identical(other.powerUsageQuantity, powerUsageQuantity) ||
                other.powerUsageQuantity == powerUsageQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, startDateKr, endDateKr, dateTimeKr, powerUsageQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PowerUsageDTOCopyWith<_$_PowerUsageDTO> get copyWith =>
      __$$_PowerUsageDTOCopyWithImpl<_$_PowerUsageDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PowerUsageDTOToJson(
      this,
    );
  }
}

abstract class _PowerUsageDTO implements PowerUsageDTO {
  factory _PowerUsageDTO(
      {final String? startDateKr,
      final String? endDateKr,
      required final String dateTimeKr,
      required final double powerUsageQuantity}) = _$_PowerUsageDTO;

  factory _PowerUsageDTO.fromJson(Map<String, dynamic> json) =
      _$_PowerUsageDTO.fromJson;

  @override
  String? get startDateKr;
  @override
  String? get endDateKr;
  @override
  String get dateTimeKr;
  @override
  double get powerUsageQuantity;
  @override
  @JsonKey(ignore: true)
  _$$_PowerUsageDTOCopyWith<_$_PowerUsageDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
