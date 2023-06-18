// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'AccountEmailValidationDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountEmailValidationDTO _$AccountEmailValidationDTOFromJson(
    Map<String, dynamic> json) {
  return _AccountEmailValidationDTO.fromJson(json);
}

/// @nodoc
mixin _$AccountEmailValidationDTO {
  bool get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountEmailValidationDTOCopyWith<AccountEmailValidationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEmailValidationDTOCopyWith<$Res> {
  factory $AccountEmailValidationDTOCopyWith(AccountEmailValidationDTO value,
          $Res Function(AccountEmailValidationDTO) then) =
      _$AccountEmailValidationDTOCopyWithImpl<$Res, AccountEmailValidationDTO>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class _$AccountEmailValidationDTOCopyWithImpl<$Res,
        $Val extends AccountEmailValidationDTO>
    implements $AccountEmailValidationDTOCopyWith<$Res> {
  _$AccountEmailValidationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountEmailValidationDTOCopyWith<$Res>
    implements $AccountEmailValidationDTOCopyWith<$Res> {
  factory _$$_AccountEmailValidationDTOCopyWith(
          _$_AccountEmailValidationDTO value,
          $Res Function(_$_AccountEmailValidationDTO) then) =
      __$$_AccountEmailValidationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_AccountEmailValidationDTOCopyWithImpl<$Res>
    extends _$AccountEmailValidationDTOCopyWithImpl<$Res,
        _$_AccountEmailValidationDTO>
    implements _$$_AccountEmailValidationDTOCopyWith<$Res> {
  __$$_AccountEmailValidationDTOCopyWithImpl(
      _$_AccountEmailValidationDTO _value,
      $Res Function(_$_AccountEmailValidationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_AccountEmailValidationDTO(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountEmailValidationDTO implements _AccountEmailValidationDTO {
  _$_AccountEmailValidationDTO({required this.result});

  factory _$_AccountEmailValidationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AccountEmailValidationDTOFromJson(json);

  @override
  final bool result;

  @override
  String toString() {
    return 'AccountEmailValidationDTO(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountEmailValidationDTO &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountEmailValidationDTOCopyWith<_$_AccountEmailValidationDTO>
      get copyWith => __$$_AccountEmailValidationDTOCopyWithImpl<
          _$_AccountEmailValidationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountEmailValidationDTOToJson(
      this,
    );
  }
}

abstract class _AccountEmailValidationDTO implements AccountEmailValidationDTO {
  factory _AccountEmailValidationDTO({required final bool result}) =
      _$_AccountEmailValidationDTO;

  factory _AccountEmailValidationDTO.fromJson(Map<String, dynamic> json) =
      _$_AccountEmailValidationDTO.fromJson;

  @override
  bool get result;
  @override
  @JsonKey(ignore: true)
  _$$_AccountEmailValidationDTOCopyWith<_$_AccountEmailValidationDTO>
      get copyWith => throw _privateConstructorUsedError;
}
