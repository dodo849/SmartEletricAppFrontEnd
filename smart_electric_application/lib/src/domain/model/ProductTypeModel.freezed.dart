// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ProductTypeModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductTypeModel _$ProductTypeModelFromJson(Map<String, dynamic> json) {
  return _ProductTypeModel.fromJson(json);
}

/// @nodoc
mixin _$ProductTypeModel {
  String get krName => throw _privateConstructorUsedError;
  String get engName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductTypeModelCopyWith<ProductTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTypeModelCopyWith<$Res> {
  factory $ProductTypeModelCopyWith(
          ProductTypeModel value, $Res Function(ProductTypeModel) then) =
      _$ProductTypeModelCopyWithImpl<$Res, ProductTypeModel>;
  @useResult
  $Res call({String krName, String engName});
}

/// @nodoc
class _$ProductTypeModelCopyWithImpl<$Res, $Val extends ProductTypeModel>
    implements $ProductTypeModelCopyWith<$Res> {
  _$ProductTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? krName = null,
    Object? engName = null,
  }) {
    return _then(_value.copyWith(
      krName: null == krName
          ? _value.krName
          : krName // ignore: cast_nullable_to_non_nullable
              as String,
      engName: null == engName
          ? _value.engName
          : engName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductTypeModelCopyWith<$Res>
    implements $ProductTypeModelCopyWith<$Res> {
  factory _$$_ProductTypeModelCopyWith(
          _$_ProductTypeModel value, $Res Function(_$_ProductTypeModel) then) =
      __$$_ProductTypeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String krName, String engName});
}

/// @nodoc
class __$$_ProductTypeModelCopyWithImpl<$Res>
    extends _$ProductTypeModelCopyWithImpl<$Res, _$_ProductTypeModel>
    implements _$$_ProductTypeModelCopyWith<$Res> {
  __$$_ProductTypeModelCopyWithImpl(
      _$_ProductTypeModel _value, $Res Function(_$_ProductTypeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? krName = null,
    Object? engName = null,
  }) {
    return _then(_$_ProductTypeModel(
      krName: null == krName
          ? _value.krName
          : krName // ignore: cast_nullable_to_non_nullable
              as String,
      engName: null == engName
          ? _value.engName
          : engName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductTypeModel implements _ProductTypeModel {
  _$_ProductTypeModel({required this.krName, required this.engName});

  factory _$_ProductTypeModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductTypeModelFromJson(json);

  @override
  final String krName;
  @override
  final String engName;

  @override
  String toString() {
    return 'ProductTypeModel(krName: $krName, engName: $engName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductTypeModel &&
            (identical(other.krName, krName) || other.krName == krName) &&
            (identical(other.engName, engName) || other.engName == engName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, krName, engName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductTypeModelCopyWith<_$_ProductTypeModel> get copyWith =>
      __$$_ProductTypeModelCopyWithImpl<_$_ProductTypeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductTypeModelToJson(
      this,
    );
  }
}

abstract class _ProductTypeModel implements ProductTypeModel {
  factory _ProductTypeModel(
      {required final String krName,
      required final String engName}) = _$_ProductTypeModel;

  factory _ProductTypeModel.fromJson(Map<String, dynamic> json) =
      _$_ProductTypeModel.fromJson;

  @override
  String get krName;
  @override
  String get engName;
  @override
  @JsonKey(ignore: true)
  _$$_ProductTypeModelCopyWith<_$_ProductTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
