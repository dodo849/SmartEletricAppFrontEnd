// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'BillSimulationProductsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BillSimulationProductsModel _$BillSimulationProductsModelFromJson(
    Map<String, dynamic> json) {
  return _BillSimulationProductsModel.fromJson(json);
}

/// @nodoc
mixin _$BillSimulationProductsModel {
  List<BillSimulationProductModel> get billSimulationProducts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillSimulationProductsModelCopyWith<BillSimulationProductsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillSimulationProductsModelCopyWith<$Res> {
  factory $BillSimulationProductsModelCopyWith(
          BillSimulationProductsModel value,
          $Res Function(BillSimulationProductsModel) then) =
      _$BillSimulationProductsModelCopyWithImpl<$Res>;
  $Res call({List<BillSimulationProductModel> billSimulationProducts});
}

/// @nodoc
class _$BillSimulationProductsModelCopyWithImpl<$Res>
    implements $BillSimulationProductsModelCopyWith<$Res> {
  _$BillSimulationProductsModelCopyWithImpl(this._value, this._then);

  final BillSimulationProductsModel _value;
  // ignore: unused_field
  final $Res Function(BillSimulationProductsModel) _then;

  @override
  $Res call({
    Object? billSimulationProducts = freezed,
  }) {
    return _then(_value.copyWith(
      billSimulationProducts: billSimulationProducts == freezed
          ? _value.billSimulationProducts
          : billSimulationProducts // ignore: cast_nullable_to_non_nullable
              as List<BillSimulationProductModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_BillSimulationProductsModelCopyWith<$Res>
    implements $BillSimulationProductsModelCopyWith<$Res> {
  factory _$$_BillSimulationProductsModelCopyWith(
          _$_BillSimulationProductsModel value,
          $Res Function(_$_BillSimulationProductsModel) then) =
      __$$_BillSimulationProductsModelCopyWithImpl<$Res>;
  @override
  $Res call({List<BillSimulationProductModel> billSimulationProducts});
}

/// @nodoc
class __$$_BillSimulationProductsModelCopyWithImpl<$Res>
    extends _$BillSimulationProductsModelCopyWithImpl<$Res>
    implements _$$_BillSimulationProductsModelCopyWith<$Res> {
  __$$_BillSimulationProductsModelCopyWithImpl(
      _$_BillSimulationProductsModel _value,
      $Res Function(_$_BillSimulationProductsModel) _then)
      : super(_value, (v) => _then(v as _$_BillSimulationProductsModel));

  @override
  _$_BillSimulationProductsModel get _value =>
      super._value as _$_BillSimulationProductsModel;

  @override
  $Res call({
    Object? billSimulationProducts = freezed,
  }) {
    return _then(_$_BillSimulationProductsModel(
      billSimulationProducts: billSimulationProducts == freezed
          ? _value._billSimulationProducts
          : billSimulationProducts // ignore: cast_nullable_to_non_nullable
              as List<BillSimulationProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BillSimulationProductsModel implements _BillSimulationProductsModel {
  _$_BillSimulationProductsModel(
      {required final List<BillSimulationProductModel> billSimulationProducts})
      : _billSimulationProducts = billSimulationProducts;

  factory _$_BillSimulationProductsModel.fromJson(Map<String, dynamic> json) =>
      _$$_BillSimulationProductsModelFromJson(json);

  final List<BillSimulationProductModel> _billSimulationProducts;
  @override
  List<BillSimulationProductModel> get billSimulationProducts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billSimulationProducts);
  }

  @override
  String toString() {
    return 'BillSimulationProductsModel(billSimulationProducts: $billSimulationProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BillSimulationProductsModel &&
            const DeepCollectionEquality().equals(
                other._billSimulationProducts, _billSimulationProducts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_billSimulationProducts));

  @JsonKey(ignore: true)
  @override
  _$$_BillSimulationProductsModelCopyWith<_$_BillSimulationProductsModel>
      get copyWith => __$$_BillSimulationProductsModelCopyWithImpl<
          _$_BillSimulationProductsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BillSimulationProductsModelToJson(
      this,
    );
  }
}

abstract class _BillSimulationProductsModel
    implements BillSimulationProductsModel {
  factory _BillSimulationProductsModel(
      {required final List<BillSimulationProductModel>
          billSimulationProducts}) = _$_BillSimulationProductsModel;

  factory _BillSimulationProductsModel.fromJson(Map<String, dynamic> json) =
      _$_BillSimulationProductsModel.fromJson;

  @override
  List<BillSimulationProductModel> get billSimulationProducts;
  @override
  @JsonKey(ignore: true)
  _$$_BillSimulationProductsModelCopyWith<_$_BillSimulationProductsModel>
      get copyWith => throw _privateConstructorUsedError;
}
