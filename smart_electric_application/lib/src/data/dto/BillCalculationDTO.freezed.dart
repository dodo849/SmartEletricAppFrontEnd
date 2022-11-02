// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'BillCalculationDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BillCalculationDTO _$BillCalculationDTOFromJson(Map<String, dynamic> json) {
  return _BillCalculationDTO.fromJson(json);
}

/// @nodoc
mixin _$BillCalculationDTO {
  double get result => throw _privateConstructorUsedError;
  int get accumulate => throw _privateConstructorUsedError;
  PowerBillInfoDTO get powerBillInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillCalculationDTOCopyWith<BillCalculationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillCalculationDTOCopyWith<$Res> {
  factory $BillCalculationDTOCopyWith(
          BillCalculationDTO value, $Res Function(BillCalculationDTO) then) =
      _$BillCalculationDTOCopyWithImpl<$Res>;
  $Res call({double result, int accumulate, PowerBillInfoDTO powerBillInfo});

  $PowerBillInfoDTOCopyWith<$Res> get powerBillInfo;
}

/// @nodoc
class _$BillCalculationDTOCopyWithImpl<$Res>
    implements $BillCalculationDTOCopyWith<$Res> {
  _$BillCalculationDTOCopyWithImpl(this._value, this._then);

  final BillCalculationDTO _value;
  // ignore: unused_field
  final $Res Function(BillCalculationDTO) _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? accumulate = freezed,
    Object? powerBillInfo = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
      accumulate: accumulate == freezed
          ? _value.accumulate
          : accumulate // ignore: cast_nullable_to_non_nullable
              as int,
      powerBillInfo: powerBillInfo == freezed
          ? _value.powerBillInfo
          : powerBillInfo // ignore: cast_nullable_to_non_nullable
              as PowerBillInfoDTO,
    ));
  }

  @override
  $PowerBillInfoDTOCopyWith<$Res> get powerBillInfo {
    return $PowerBillInfoDTOCopyWith<$Res>(_value.powerBillInfo, (value) {
      return _then(_value.copyWith(powerBillInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_BillCalculationDTOCopyWith<$Res>
    implements $BillCalculationDTOCopyWith<$Res> {
  factory _$$_BillCalculationDTOCopyWith(_$_BillCalculationDTO value,
          $Res Function(_$_BillCalculationDTO) then) =
      __$$_BillCalculationDTOCopyWithImpl<$Res>;
  @override
  $Res call({double result, int accumulate, PowerBillInfoDTO powerBillInfo});

  @override
  $PowerBillInfoDTOCopyWith<$Res> get powerBillInfo;
}

/// @nodoc
class __$$_BillCalculationDTOCopyWithImpl<$Res>
    extends _$BillCalculationDTOCopyWithImpl<$Res>
    implements _$$_BillCalculationDTOCopyWith<$Res> {
  __$$_BillCalculationDTOCopyWithImpl(
      _$_BillCalculationDTO _value, $Res Function(_$_BillCalculationDTO) _then)
      : super(_value, (v) => _then(v as _$_BillCalculationDTO));

  @override
  _$_BillCalculationDTO get _value => super._value as _$_BillCalculationDTO;

  @override
  $Res call({
    Object? result = freezed,
    Object? accumulate = freezed,
    Object? powerBillInfo = freezed,
  }) {
    return _then(_$_BillCalculationDTO(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as double,
      accumulate: accumulate == freezed
          ? _value.accumulate
          : accumulate // ignore: cast_nullable_to_non_nullable
              as int,
      powerBillInfo: powerBillInfo == freezed
          ? _value.powerBillInfo
          : powerBillInfo // ignore: cast_nullable_to_non_nullable
              as PowerBillInfoDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BillCalculationDTO implements _BillCalculationDTO {
  _$_BillCalculationDTO(
      {required this.result,
      required this.accumulate,
      required this.powerBillInfo});

  factory _$_BillCalculationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_BillCalculationDTOFromJson(json);

  @override
  final double result;
  @override
  final int accumulate;
  @override
  final PowerBillInfoDTO powerBillInfo;

  @override
  String toString() {
    return 'BillCalculationDTO(result: $result, accumulate: $accumulate, powerBillInfo: $powerBillInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BillCalculationDTO &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality()
                .equals(other.accumulate, accumulate) &&
            const DeepCollectionEquality()
                .equals(other.powerBillInfo, powerBillInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(accumulate),
      const DeepCollectionEquality().hash(powerBillInfo));

  @JsonKey(ignore: true)
  @override
  _$$_BillCalculationDTOCopyWith<_$_BillCalculationDTO> get copyWith =>
      __$$_BillCalculationDTOCopyWithImpl<_$_BillCalculationDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BillCalculationDTOToJson(
      this,
    );
  }
}

abstract class _BillCalculationDTO implements BillCalculationDTO {
  factory _BillCalculationDTO(
      {required final double result,
      required final int accumulate,
      required final PowerBillInfoDTO powerBillInfo}) = _$_BillCalculationDTO;

  factory _BillCalculationDTO.fromJson(Map<String, dynamic> json) =
      _$_BillCalculationDTO.fromJson;

  @override
  double get result;
  @override
  int get accumulate;
  @override
  PowerBillInfoDTO get powerBillInfo;
  @override
  @JsonKey(ignore: true)
  _$$_BillCalculationDTOCopyWith<_$_BillCalculationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

PowerBillInfoDTO _$PowerBillInfoDTOFromJson(Map<String, dynamic> json) {
  return _PowerBillInfoDTO.fromJson(json);
}

/// @nodoc
mixin _$PowerBillInfoDTO {
  @JsonKey(name: "power_accumulate_threshold_first")
  int get powerAccumulateThresholdFirst => throw _privateConstructorUsedError;
  @JsonKey(name: "power_accumulate_threshold_second")
  int get powerAccumulateThresholdSecond => throw _privateConstructorUsedError;
  @JsonKey(name: "power_accumulate_threshold_super")
  int get powerAccumulateThresholdSuper => throw _privateConstructorUsedError;
  @JsonKey(name: "base_bill_first")
  int get baseBillFirst => throw _privateConstructorUsedError;
  @JsonKey(name: "base_bill_second")
  int get baseBillSecond => throw _privateConstructorUsedError;
  @JsonKey(name: "base_bill_third")
  int get baseBillThired => throw _privateConstructorUsedError;
  @JsonKey(name: "power_bill_first")
  double get powerBillFrist => throw _privateConstructorUsedError;
  @JsonKey(name: "power_bill_second")
  double get powerBillSecond => throw _privateConstructorUsedError;
  @JsonKey(name: "power_bill_third")
  double get powerBillThird => throw _privateConstructorUsedError;
  @JsonKey(name: "power_bill_super")
  double get powerBillSuper => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PowerBillInfoDTOCopyWith<PowerBillInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PowerBillInfoDTOCopyWith<$Res> {
  factory $PowerBillInfoDTOCopyWith(
          PowerBillInfoDTO value, $Res Function(PowerBillInfoDTO) then) =
      _$PowerBillInfoDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "power_accumulate_threshold_first")
          int powerAccumulateThresholdFirst,
      @JsonKey(name: "power_accumulate_threshold_second")
          int powerAccumulateThresholdSecond,
      @JsonKey(name: "power_accumulate_threshold_super")
          int powerAccumulateThresholdSuper,
      @JsonKey(name: "base_bill_first")
          int baseBillFirst,
      @JsonKey(name: "base_bill_second")
          int baseBillSecond,
      @JsonKey(name: "base_bill_third")
          int baseBillThired,
      @JsonKey(name: "power_bill_first")
          double powerBillFrist,
      @JsonKey(name: "power_bill_second")
          double powerBillSecond,
      @JsonKey(name: "power_bill_third")
          double powerBillThird,
      @JsonKey(name: "power_bill_super")
          double powerBillSuper});
}

/// @nodoc
class _$PowerBillInfoDTOCopyWithImpl<$Res>
    implements $PowerBillInfoDTOCopyWith<$Res> {
  _$PowerBillInfoDTOCopyWithImpl(this._value, this._then);

  final PowerBillInfoDTO _value;
  // ignore: unused_field
  final $Res Function(PowerBillInfoDTO) _then;

  @override
  $Res call({
    Object? powerAccumulateThresholdFirst = freezed,
    Object? powerAccumulateThresholdSecond = freezed,
    Object? powerAccumulateThresholdSuper = freezed,
    Object? baseBillFirst = freezed,
    Object? baseBillSecond = freezed,
    Object? baseBillThired = freezed,
    Object? powerBillFrist = freezed,
    Object? powerBillSecond = freezed,
    Object? powerBillThird = freezed,
    Object? powerBillSuper = freezed,
  }) {
    return _then(_value.copyWith(
      powerAccumulateThresholdFirst: powerAccumulateThresholdFirst == freezed
          ? _value.powerAccumulateThresholdFirst
          : powerAccumulateThresholdFirst // ignore: cast_nullable_to_non_nullable
              as int,
      powerAccumulateThresholdSecond: powerAccumulateThresholdSecond == freezed
          ? _value.powerAccumulateThresholdSecond
          : powerAccumulateThresholdSecond // ignore: cast_nullable_to_non_nullable
              as int,
      powerAccumulateThresholdSuper: powerAccumulateThresholdSuper == freezed
          ? _value.powerAccumulateThresholdSuper
          : powerAccumulateThresholdSuper // ignore: cast_nullable_to_non_nullable
              as int,
      baseBillFirst: baseBillFirst == freezed
          ? _value.baseBillFirst
          : baseBillFirst // ignore: cast_nullable_to_non_nullable
              as int,
      baseBillSecond: baseBillSecond == freezed
          ? _value.baseBillSecond
          : baseBillSecond // ignore: cast_nullable_to_non_nullable
              as int,
      baseBillThired: baseBillThired == freezed
          ? _value.baseBillThired
          : baseBillThired // ignore: cast_nullable_to_non_nullable
              as int,
      powerBillFrist: powerBillFrist == freezed
          ? _value.powerBillFrist
          : powerBillFrist // ignore: cast_nullable_to_non_nullable
              as double,
      powerBillSecond: powerBillSecond == freezed
          ? _value.powerBillSecond
          : powerBillSecond // ignore: cast_nullable_to_non_nullable
              as double,
      powerBillThird: powerBillThird == freezed
          ? _value.powerBillThird
          : powerBillThird // ignore: cast_nullable_to_non_nullable
              as double,
      powerBillSuper: powerBillSuper == freezed
          ? _value.powerBillSuper
          : powerBillSuper // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_PowerBillInfoDTOCopyWith<$Res>
    implements $PowerBillInfoDTOCopyWith<$Res> {
  factory _$$_PowerBillInfoDTOCopyWith(
          _$_PowerBillInfoDTO value, $Res Function(_$_PowerBillInfoDTO) then) =
      __$$_PowerBillInfoDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "power_accumulate_threshold_first")
          int powerAccumulateThresholdFirst,
      @JsonKey(name: "power_accumulate_threshold_second")
          int powerAccumulateThresholdSecond,
      @JsonKey(name: "power_accumulate_threshold_super")
          int powerAccumulateThresholdSuper,
      @JsonKey(name: "base_bill_first")
          int baseBillFirst,
      @JsonKey(name: "base_bill_second")
          int baseBillSecond,
      @JsonKey(name: "base_bill_third")
          int baseBillThired,
      @JsonKey(name: "power_bill_first")
          double powerBillFrist,
      @JsonKey(name: "power_bill_second")
          double powerBillSecond,
      @JsonKey(name: "power_bill_third")
          double powerBillThird,
      @JsonKey(name: "power_bill_super")
          double powerBillSuper});
}

/// @nodoc
class __$$_PowerBillInfoDTOCopyWithImpl<$Res>
    extends _$PowerBillInfoDTOCopyWithImpl<$Res>
    implements _$$_PowerBillInfoDTOCopyWith<$Res> {
  __$$_PowerBillInfoDTOCopyWithImpl(
      _$_PowerBillInfoDTO _value, $Res Function(_$_PowerBillInfoDTO) _then)
      : super(_value, (v) => _then(v as _$_PowerBillInfoDTO));

  @override
  _$_PowerBillInfoDTO get _value => super._value as _$_PowerBillInfoDTO;

  @override
  $Res call({
    Object? powerAccumulateThresholdFirst = freezed,
    Object? powerAccumulateThresholdSecond = freezed,
    Object? powerAccumulateThresholdSuper = freezed,
    Object? baseBillFirst = freezed,
    Object? baseBillSecond = freezed,
    Object? baseBillThired = freezed,
    Object? powerBillFrist = freezed,
    Object? powerBillSecond = freezed,
    Object? powerBillThird = freezed,
    Object? powerBillSuper = freezed,
  }) {
    return _then(_$_PowerBillInfoDTO(
      powerAccumulateThresholdFirst: powerAccumulateThresholdFirst == freezed
          ? _value.powerAccumulateThresholdFirst
          : powerAccumulateThresholdFirst // ignore: cast_nullable_to_non_nullable
              as int,
      powerAccumulateThresholdSecond: powerAccumulateThresholdSecond == freezed
          ? _value.powerAccumulateThresholdSecond
          : powerAccumulateThresholdSecond // ignore: cast_nullable_to_non_nullable
              as int,
      powerAccumulateThresholdSuper: powerAccumulateThresholdSuper == freezed
          ? _value.powerAccumulateThresholdSuper
          : powerAccumulateThresholdSuper // ignore: cast_nullable_to_non_nullable
              as int,
      baseBillFirst: baseBillFirst == freezed
          ? _value.baseBillFirst
          : baseBillFirst // ignore: cast_nullable_to_non_nullable
              as int,
      baseBillSecond: baseBillSecond == freezed
          ? _value.baseBillSecond
          : baseBillSecond // ignore: cast_nullable_to_non_nullable
              as int,
      baseBillThired: baseBillThired == freezed
          ? _value.baseBillThired
          : baseBillThired // ignore: cast_nullable_to_non_nullable
              as int,
      powerBillFrist: powerBillFrist == freezed
          ? _value.powerBillFrist
          : powerBillFrist // ignore: cast_nullable_to_non_nullable
              as double,
      powerBillSecond: powerBillSecond == freezed
          ? _value.powerBillSecond
          : powerBillSecond // ignore: cast_nullable_to_non_nullable
              as double,
      powerBillThird: powerBillThird == freezed
          ? _value.powerBillThird
          : powerBillThird // ignore: cast_nullable_to_non_nullable
              as double,
      powerBillSuper: powerBillSuper == freezed
          ? _value.powerBillSuper
          : powerBillSuper // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PowerBillInfoDTO implements _PowerBillInfoDTO {
  _$_PowerBillInfoDTO(
      {@JsonKey(name: "power_accumulate_threshold_first")
          required this.powerAccumulateThresholdFirst,
      @JsonKey(name: "power_accumulate_threshold_second")
          required this.powerAccumulateThresholdSecond,
      @JsonKey(name: "power_accumulate_threshold_super")
          required this.powerAccumulateThresholdSuper,
      @JsonKey(name: "base_bill_first")
          required this.baseBillFirst,
      @JsonKey(name: "base_bill_second")
          required this.baseBillSecond,
      @JsonKey(name: "base_bill_third")
          required this.baseBillThired,
      @JsonKey(name: "power_bill_first")
          required this.powerBillFrist,
      @JsonKey(name: "power_bill_second")
          required this.powerBillSecond,
      @JsonKey(name: "power_bill_third")
          required this.powerBillThird,
      @JsonKey(name: "power_bill_super")
          required this.powerBillSuper});

  factory _$_PowerBillInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PowerBillInfoDTOFromJson(json);

  @override
  @JsonKey(name: "power_accumulate_threshold_first")
  final int powerAccumulateThresholdFirst;
  @override
  @JsonKey(name: "power_accumulate_threshold_second")
  final int powerAccumulateThresholdSecond;
  @override
  @JsonKey(name: "power_accumulate_threshold_super")
  final int powerAccumulateThresholdSuper;
  @override
  @JsonKey(name: "base_bill_first")
  final int baseBillFirst;
  @override
  @JsonKey(name: "base_bill_second")
  final int baseBillSecond;
  @override
  @JsonKey(name: "base_bill_third")
  final int baseBillThired;
  @override
  @JsonKey(name: "power_bill_first")
  final double powerBillFrist;
  @override
  @JsonKey(name: "power_bill_second")
  final double powerBillSecond;
  @override
  @JsonKey(name: "power_bill_third")
  final double powerBillThird;
  @override
  @JsonKey(name: "power_bill_super")
  final double powerBillSuper;

  @override
  String toString() {
    return 'PowerBillInfoDTO(powerAccumulateThresholdFirst: $powerAccumulateThresholdFirst, powerAccumulateThresholdSecond: $powerAccumulateThresholdSecond, powerAccumulateThresholdSuper: $powerAccumulateThresholdSuper, baseBillFirst: $baseBillFirst, baseBillSecond: $baseBillSecond, baseBillThired: $baseBillThired, powerBillFrist: $powerBillFrist, powerBillSecond: $powerBillSecond, powerBillThird: $powerBillThird, powerBillSuper: $powerBillSuper)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PowerBillInfoDTO &&
            const DeepCollectionEquality().equals(
                other.powerAccumulateThresholdFirst,
                powerAccumulateThresholdFirst) &&
            const DeepCollectionEquality().equals(
                other.powerAccumulateThresholdSecond,
                powerAccumulateThresholdSecond) &&
            const DeepCollectionEquality().equals(
                other.powerAccumulateThresholdSuper,
                powerAccumulateThresholdSuper) &&
            const DeepCollectionEquality()
                .equals(other.baseBillFirst, baseBillFirst) &&
            const DeepCollectionEquality()
                .equals(other.baseBillSecond, baseBillSecond) &&
            const DeepCollectionEquality()
                .equals(other.baseBillThired, baseBillThired) &&
            const DeepCollectionEquality()
                .equals(other.powerBillFrist, powerBillFrist) &&
            const DeepCollectionEquality()
                .equals(other.powerBillSecond, powerBillSecond) &&
            const DeepCollectionEquality()
                .equals(other.powerBillThird, powerBillThird) &&
            const DeepCollectionEquality()
                .equals(other.powerBillSuper, powerBillSuper));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(powerAccumulateThresholdFirst),
      const DeepCollectionEquality().hash(powerAccumulateThresholdSecond),
      const DeepCollectionEquality().hash(powerAccumulateThresholdSuper),
      const DeepCollectionEquality().hash(baseBillFirst),
      const DeepCollectionEquality().hash(baseBillSecond),
      const DeepCollectionEquality().hash(baseBillThired),
      const DeepCollectionEquality().hash(powerBillFrist),
      const DeepCollectionEquality().hash(powerBillSecond),
      const DeepCollectionEquality().hash(powerBillThird),
      const DeepCollectionEquality().hash(powerBillSuper));

  @JsonKey(ignore: true)
  @override
  _$$_PowerBillInfoDTOCopyWith<_$_PowerBillInfoDTO> get copyWith =>
      __$$_PowerBillInfoDTOCopyWithImpl<_$_PowerBillInfoDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PowerBillInfoDTOToJson(
      this,
    );
  }
}

abstract class _PowerBillInfoDTO implements PowerBillInfoDTO {
  factory _PowerBillInfoDTO(
      {@JsonKey(name: "power_accumulate_threshold_first")
          required final int powerAccumulateThresholdFirst,
      @JsonKey(name: "power_accumulate_threshold_second")
          required final int powerAccumulateThresholdSecond,
      @JsonKey(name: "power_accumulate_threshold_super")
          required final int powerAccumulateThresholdSuper,
      @JsonKey(name: "base_bill_first")
          required final int baseBillFirst,
      @JsonKey(name: "base_bill_second")
          required final int baseBillSecond,
      @JsonKey(name: "base_bill_third")
          required final int baseBillThired,
      @JsonKey(name: "power_bill_first")
          required final double powerBillFrist,
      @JsonKey(name: "power_bill_second")
          required final double powerBillSecond,
      @JsonKey(name: "power_bill_third")
          required final double powerBillThird,
      @JsonKey(name: "power_bill_super")
          required final double powerBillSuper}) = _$_PowerBillInfoDTO;

  factory _PowerBillInfoDTO.fromJson(Map<String, dynamic> json) =
      _$_PowerBillInfoDTO.fromJson;

  @override
  @JsonKey(name: "power_accumulate_threshold_first")
  int get powerAccumulateThresholdFirst;
  @override
  @JsonKey(name: "power_accumulate_threshold_second")
  int get powerAccumulateThresholdSecond;
  @override
  @JsonKey(name: "power_accumulate_threshold_super")
  int get powerAccumulateThresholdSuper;
  @override
  @JsonKey(name: "base_bill_first")
  int get baseBillFirst;
  @override
  @JsonKey(name: "base_bill_second")
  int get baseBillSecond;
  @override
  @JsonKey(name: "base_bill_third")
  int get baseBillThired;
  @override
  @JsonKey(name: "power_bill_first")
  double get powerBillFrist;
  @override
  @JsonKey(name: "power_bill_second")
  double get powerBillSecond;
  @override
  @JsonKey(name: "power_bill_third")
  double get powerBillThird;
  @override
  @JsonKey(name: "power_bill_super")
  double get powerBillSuper;
  @override
  @JsonKey(ignore: true)
  _$$_PowerBillInfoDTOCopyWith<_$_PowerBillInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
