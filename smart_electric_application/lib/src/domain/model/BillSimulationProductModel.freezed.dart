// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'BillSimulationProductModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BillSimulationProductModel _$BillSimulationProductModelFromJson(
    Map<String, dynamic> json) {
  return _BillSimulationProductModel.fromJson(json);
}

/// @nodoc
mixin _$BillSimulationProductModel {
  int get order => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get modelName => throw _privateConstructorUsedError;
  ProductTypeModel get productType => throw _privateConstructorUsedError;
  double get monthPowerUsage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillSimulationProductModelCopyWith<BillSimulationProductModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillSimulationProductModelCopyWith<$Res> {
  factory $BillSimulationProductModelCopyWith(BillSimulationProductModel value,
          $Res Function(BillSimulationProductModel) then) =
      _$BillSimulationProductModelCopyWithImpl<$Res>;
  $Res call(
      {int order,
      String productName,
      String modelName,
      ProductTypeModel productType,
      double monthPowerUsage});

  $ProductTypeModelCopyWith<$Res> get productType;
}

/// @nodoc
class _$BillSimulationProductModelCopyWithImpl<$Res>
    implements $BillSimulationProductModelCopyWith<$Res> {
  _$BillSimulationProductModelCopyWithImpl(this._value, this._then);

  final BillSimulationProductModel _value;
  // ignore: unused_field
  final $Res Function(BillSimulationProductModel) _then;

  @override
  $Res call({
    Object? order = freezed,
    Object? productName = freezed,
    Object? modelName = freezed,
    Object? productType = freezed,
    Object? monthPowerUsage = freezed,
  }) {
    return _then(_value.copyWith(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      modelName: modelName == freezed
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      productType: productType == freezed
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductTypeModel,
      monthPowerUsage: monthPowerUsage == freezed
          ? _value.monthPowerUsage
          : monthPowerUsage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $ProductTypeModelCopyWith<$Res> get productType {
    return $ProductTypeModelCopyWith<$Res>(_value.productType, (value) {
      return _then(_value.copyWith(productType: value));
    });
  }
}

/// @nodoc
abstract class _$$_BillSimulationProductModelCopyWith<$Res>
    implements $BillSimulationProductModelCopyWith<$Res> {
  factory _$$_BillSimulationProductModelCopyWith(
          _$_BillSimulationProductModel value,
          $Res Function(_$_BillSimulationProductModel) then) =
      __$$_BillSimulationProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int order,
      String productName,
      String modelName,
      ProductTypeModel productType,
      double monthPowerUsage});

  @override
  $ProductTypeModelCopyWith<$Res> get productType;
}

/// @nodoc
class __$$_BillSimulationProductModelCopyWithImpl<$Res>
    extends _$BillSimulationProductModelCopyWithImpl<$Res>
    implements _$$_BillSimulationProductModelCopyWith<$Res> {
  __$$_BillSimulationProductModelCopyWithImpl(
      _$_BillSimulationProductModel _value,
      $Res Function(_$_BillSimulationProductModel) _then)
      : super(_value, (v) => _then(v as _$_BillSimulationProductModel));

  @override
  _$_BillSimulationProductModel get _value =>
      super._value as _$_BillSimulationProductModel;

  @override
  $Res call({
    Object? order = freezed,
    Object? productName = freezed,
    Object? modelName = freezed,
    Object? productType = freezed,
    Object? monthPowerUsage = freezed,
  }) {
    return _then(_$_BillSimulationProductModel(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      modelName: modelName == freezed
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String,
      productType: productType == freezed
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductTypeModel,
      monthPowerUsage: monthPowerUsage == freezed
          ? _value.monthPowerUsage
          : monthPowerUsage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BillSimulationProductModel implements _BillSimulationProductModel {
  _$_BillSimulationProductModel(
      {required this.order,
      required this.productName,
      required this.modelName,
      required this.productType,
      required this.monthPowerUsage});

  factory _$_BillSimulationProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_BillSimulationProductModelFromJson(json);

  @override
  final int order;
  @override
  final String productName;
  @override
  final String modelName;
  @override
  final ProductTypeModel productType;
  @override
  final double monthPowerUsage;

  @override
  String toString() {
    return 'BillSimulationProductModel(order: $order, productName: $productName, modelName: $modelName, productType: $productType, monthPowerUsage: $monthPowerUsage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BillSimulationProductModel &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality().equals(other.modelName, modelName) &&
            const DeepCollectionEquality()
                .equals(other.productType, productType) &&
            const DeepCollectionEquality()
                .equals(other.monthPowerUsage, monthPowerUsage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(modelName),
      const DeepCollectionEquality().hash(productType),
      const DeepCollectionEquality().hash(monthPowerUsage));

  @JsonKey(ignore: true)
  @override
  _$$_BillSimulationProductModelCopyWith<_$_BillSimulationProductModel>
      get copyWith => __$$_BillSimulationProductModelCopyWithImpl<
          _$_BillSimulationProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BillSimulationProductModelToJson(
      this,
    );
  }
}

abstract class _BillSimulationProductModel
    implements BillSimulationProductModel {
  factory _BillSimulationProductModel(
      {required final int order,
      required final String productName,
      required final String modelName,
      required final ProductTypeModel productType,
      required final double monthPowerUsage}) = _$_BillSimulationProductModel;

  factory _BillSimulationProductModel.fromJson(Map<String, dynamic> json) =
      _$_BillSimulationProductModel.fromJson;

  @override
  int get order;
  @override
  String get productName;
  @override
  String get modelName;
  @override
  ProductTypeModel get productType;
  @override
  double get monthPowerUsage;
  @override
  @JsonKey(ignore: true)
  _$$_BillSimulationProductModelCopyWith<_$_BillSimulationProductModel>
      get copyWith => throw _privateConstructorUsedError;
}
