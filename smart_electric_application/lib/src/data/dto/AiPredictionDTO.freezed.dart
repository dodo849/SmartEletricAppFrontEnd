// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'AiPredictionDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AiPredictionDTO _$AiPredictionDTOFromJson(Map<String, dynamic> json) {
  return _AiPredictionDTO.fromJson(json);
}

/// @nodoc
mixin _$AiPredictionDTO {
  List<DailyPrediction> get prediction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AiPredictionDTOCopyWith<AiPredictionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiPredictionDTOCopyWith<$Res> {
  factory $AiPredictionDTOCopyWith(
          AiPredictionDTO value, $Res Function(AiPredictionDTO) then) =
      _$AiPredictionDTOCopyWithImpl<$Res>;
  $Res call({List<DailyPrediction> prediction});
}

/// @nodoc
class _$AiPredictionDTOCopyWithImpl<$Res>
    implements $AiPredictionDTOCopyWith<$Res> {
  _$AiPredictionDTOCopyWithImpl(this._value, this._then);

  final AiPredictionDTO _value;
  // ignore: unused_field
  final $Res Function(AiPredictionDTO) _then;

  @override
  $Res call({
    Object? prediction = freezed,
  }) {
    return _then(_value.copyWith(
      prediction: prediction == freezed
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as List<DailyPrediction>,
    ));
  }
}

/// @nodoc
abstract class _$$_AiPredictionDTOCopyWith<$Res>
    implements $AiPredictionDTOCopyWith<$Res> {
  factory _$$_AiPredictionDTOCopyWith(
          _$_AiPredictionDTO value, $Res Function(_$_AiPredictionDTO) then) =
      __$$_AiPredictionDTOCopyWithImpl<$Res>;
  @override
  $Res call({List<DailyPrediction> prediction});
}

/// @nodoc
class __$$_AiPredictionDTOCopyWithImpl<$Res>
    extends _$AiPredictionDTOCopyWithImpl<$Res>
    implements _$$_AiPredictionDTOCopyWith<$Res> {
  __$$_AiPredictionDTOCopyWithImpl(
      _$_AiPredictionDTO _value, $Res Function(_$_AiPredictionDTO) _then)
      : super(_value, (v) => _then(v as _$_AiPredictionDTO));

  @override
  _$_AiPredictionDTO get _value => super._value as _$_AiPredictionDTO;

  @override
  $Res call({
    Object? prediction = freezed,
  }) {
    return _then(_$_AiPredictionDTO(
      prediction: prediction == freezed
          ? _value._prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as List<DailyPrediction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AiPredictionDTO implements _AiPredictionDTO {
  _$_AiPredictionDTO({required final List<DailyPrediction> prediction})
      : _prediction = prediction;

  factory _$_AiPredictionDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AiPredictionDTOFromJson(json);

  final List<DailyPrediction> _prediction;
  @override
  List<DailyPrediction> get prediction {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prediction);
  }

  @override
  String toString() {
    return 'AiPredictionDTO(prediction: $prediction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AiPredictionDTO &&
            const DeepCollectionEquality()
                .equals(other._prediction, _prediction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_prediction));

  @JsonKey(ignore: true)
  @override
  _$$_AiPredictionDTOCopyWith<_$_AiPredictionDTO> get copyWith =>
      __$$_AiPredictionDTOCopyWithImpl<_$_AiPredictionDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AiPredictionDTOToJson(
      this,
    );
  }
}

abstract class _AiPredictionDTO implements AiPredictionDTO {
  factory _AiPredictionDTO({required final List<DailyPrediction> prediction}) =
      _$_AiPredictionDTO;

  factory _AiPredictionDTO.fromJson(Map<String, dynamic> json) =
      _$_AiPredictionDTO.fromJson;

  @override
  List<DailyPrediction> get prediction;
  @override
  @JsonKey(ignore: true)
  _$$_AiPredictionDTOCopyWith<_$_AiPredictionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyPrediction _$DailyPredictionFromJson(Map<String, dynamic> json) {
  return __DailyPrediction.fromJson(json);
}

/// @nodoc
mixin _$DailyPrediction {
  String get dateTimeKr => throw _privateConstructorUsedError;
  double get powerUsageQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyPredictionCopyWith<DailyPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyPredictionCopyWith<$Res> {
  factory $DailyPredictionCopyWith(
          DailyPrediction value, $Res Function(DailyPrediction) then) =
      _$DailyPredictionCopyWithImpl<$Res>;
  $Res call({String dateTimeKr, double powerUsageQuantity});
}

/// @nodoc
class _$DailyPredictionCopyWithImpl<$Res>
    implements $DailyPredictionCopyWith<$Res> {
  _$DailyPredictionCopyWithImpl(this._value, this._then);

  final DailyPrediction _value;
  // ignore: unused_field
  final $Res Function(DailyPrediction) _then;

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
abstract class _$$__DailyPredictionCopyWith<$Res>
    implements $DailyPredictionCopyWith<$Res> {
  factory _$$__DailyPredictionCopyWith(
          _$__DailyPrediction value, $Res Function(_$__DailyPrediction) then) =
      __$$__DailyPredictionCopyWithImpl<$Res>;
  @override
  $Res call({String dateTimeKr, double powerUsageQuantity});
}

/// @nodoc
class __$$__DailyPredictionCopyWithImpl<$Res>
    extends _$DailyPredictionCopyWithImpl<$Res>
    implements _$$__DailyPredictionCopyWith<$Res> {
  __$$__DailyPredictionCopyWithImpl(
      _$__DailyPrediction _value, $Res Function(_$__DailyPrediction) _then)
      : super(_value, (v) => _then(v as _$__DailyPrediction));

  @override
  _$__DailyPrediction get _value => super._value as _$__DailyPrediction;

  @override
  $Res call({
    Object? dateTimeKr = freezed,
    Object? powerUsageQuantity = freezed,
  }) {
    return _then(_$__DailyPrediction(
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
class _$__DailyPrediction implements __DailyPrediction {
  _$__DailyPrediction(
      {required this.dateTimeKr, required this.powerUsageQuantity});

  factory _$__DailyPrediction.fromJson(Map<String, dynamic> json) =>
      _$$__DailyPredictionFromJson(json);

  @override
  final String dateTimeKr;
  @override
  final double powerUsageQuantity;

  @override
  String toString() {
    return 'DailyPrediction(dateTimeKr: $dateTimeKr, powerUsageQuantity: $powerUsageQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$__DailyPrediction &&
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
  _$$__DailyPredictionCopyWith<_$__DailyPrediction> get copyWith =>
      __$$__DailyPredictionCopyWithImpl<_$__DailyPrediction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$__DailyPredictionToJson(
      this,
    );
  }
}

abstract class __DailyPrediction implements DailyPrediction {
  factory __DailyPrediction(
      {required final String dateTimeKr,
      required final double powerUsageQuantity}) = _$__DailyPrediction;

  factory __DailyPrediction.fromJson(Map<String, dynamic> json) =
      _$__DailyPrediction.fromJson;

  @override
  String get dateTimeKr;
  @override
  double get powerUsageQuantity;
  @override
  @JsonKey(ignore: true)
  _$$__DailyPredictionCopyWith<_$__DailyPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}
