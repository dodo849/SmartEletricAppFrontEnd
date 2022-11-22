// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'BillDateDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BillDateDTO _$BillDateDTOFromJson(Map<String, dynamic> json) {
  return _BillDateDTO.fromJson(json);
}

/// @nodoc
mixin _$BillDateDTO {
  String get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillDateDTOCopyWith<BillDateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillDateDTOCopyWith<$Res> {
  factory $BillDateDTOCopyWith(
          BillDateDTO value, $Res Function(BillDateDTO) then) =
      _$BillDateDTOCopyWithImpl<$Res>;
  $Res call({String result});
}

/// @nodoc
class _$BillDateDTOCopyWithImpl<$Res> implements $BillDateDTOCopyWith<$Res> {
  _$BillDateDTOCopyWithImpl(this._value, this._then);

  final BillDateDTO _value;
  // ignore: unused_field
  final $Res Function(BillDateDTO) _then;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BillDateDTOCopyWith<$Res>
    implements $BillDateDTOCopyWith<$Res> {
  factory _$$_BillDateDTOCopyWith(
          _$_BillDateDTO value, $Res Function(_$_BillDateDTO) then) =
      __$$_BillDateDTOCopyWithImpl<$Res>;
  @override
  $Res call({String result});
}

/// @nodoc
class __$$_BillDateDTOCopyWithImpl<$Res> extends _$BillDateDTOCopyWithImpl<$Res>
    implements _$$_BillDateDTOCopyWith<$Res> {
  __$$_BillDateDTOCopyWithImpl(
      _$_BillDateDTO _value, $Res Function(_$_BillDateDTO) _then)
      : super(_value, (v) => _then(v as _$_BillDateDTO));

  @override
  _$_BillDateDTO get _value => super._value as _$_BillDateDTO;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$_BillDateDTO(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BillDateDTO implements _BillDateDTO {
  _$_BillDateDTO({required this.result});

  factory _$_BillDateDTO.fromJson(Map<String, dynamic> json) =>
      _$$_BillDateDTOFromJson(json);

  @override
  final String result;

  @override
  String toString() {
    return 'BillDateDTO(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BillDateDTO &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$_BillDateDTOCopyWith<_$_BillDateDTO> get copyWith =>
      __$$_BillDateDTOCopyWithImpl<_$_BillDateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BillDateDTOToJson(
      this,
    );
  }
}

abstract class _BillDateDTO implements BillDateDTO {
  factory _BillDateDTO({required final String result}) = _$_BillDateDTO;

  factory _BillDateDTO.fromJson(Map<String, dynamic> json) =
      _$_BillDateDTO.fromJson;

  @override
  String get result;
  @override
  @JsonKey(ignore: true)
  _$$_BillDateDTOCopyWith<_$_BillDateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
