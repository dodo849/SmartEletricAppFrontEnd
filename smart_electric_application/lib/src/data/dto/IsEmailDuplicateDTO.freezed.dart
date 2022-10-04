// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'IsEmailDuplicateDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IsEmailDuplicateDTO _$IsEmailDuplicateDTOFromJson(Map<String, dynamic> json) {
  return _IsEmailDuplicateDTO.fromJson(json);
}

/// @nodoc
mixin _$IsEmailDuplicateDTO {
  @JsonKey(name: "email-duplicated")
  bool get isEmailDuplicated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IsEmailDuplicateDTOCopyWith<IsEmailDuplicateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsEmailDuplicateDTOCopyWith<$Res> {
  factory $IsEmailDuplicateDTOCopyWith(
          IsEmailDuplicateDTO value, $Res Function(IsEmailDuplicateDTO) then) =
      _$IsEmailDuplicateDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "email-duplicated") bool isEmailDuplicated});
}

/// @nodoc
class _$IsEmailDuplicateDTOCopyWithImpl<$Res>
    implements $IsEmailDuplicateDTOCopyWith<$Res> {
  _$IsEmailDuplicateDTOCopyWithImpl(this._value, this._then);

  final IsEmailDuplicateDTO _value;
  // ignore: unused_field
  final $Res Function(IsEmailDuplicateDTO) _then;

  @override
  $Res call({
    Object? isEmailDuplicated = freezed,
  }) {
    return _then(_value.copyWith(
      isEmailDuplicated: isEmailDuplicated == freezed
          ? _value.isEmailDuplicated
          : isEmailDuplicated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_IsEmailDuplicateDTOCopyWith<$Res>
    implements $IsEmailDuplicateDTOCopyWith<$Res> {
  factory _$$_IsEmailDuplicateDTOCopyWith(_$_IsEmailDuplicateDTO value,
          $Res Function(_$_IsEmailDuplicateDTO) then) =
      __$$_IsEmailDuplicateDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "email-duplicated") bool isEmailDuplicated});
}

/// @nodoc
class __$$_IsEmailDuplicateDTOCopyWithImpl<$Res>
    extends _$IsEmailDuplicateDTOCopyWithImpl<$Res>
    implements _$$_IsEmailDuplicateDTOCopyWith<$Res> {
  __$$_IsEmailDuplicateDTOCopyWithImpl(_$_IsEmailDuplicateDTO _value,
      $Res Function(_$_IsEmailDuplicateDTO) _then)
      : super(_value, (v) => _then(v as _$_IsEmailDuplicateDTO));

  @override
  _$_IsEmailDuplicateDTO get _value => super._value as _$_IsEmailDuplicateDTO;

  @override
  $Res call({
    Object? isEmailDuplicated = freezed,
  }) {
    return _then(_$_IsEmailDuplicateDTO(
      isEmailDuplicated: isEmailDuplicated == freezed
          ? _value.isEmailDuplicated
          : isEmailDuplicated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IsEmailDuplicateDTO implements _IsEmailDuplicateDTO {
  _$_IsEmailDuplicateDTO(
      {@JsonKey(name: "email-duplicated") required this.isEmailDuplicated});

  factory _$_IsEmailDuplicateDTO.fromJson(Map<String, dynamic> json) =>
      _$$_IsEmailDuplicateDTOFromJson(json);

  @override
  @JsonKey(name: "email-duplicated")
  final bool isEmailDuplicated;

  @override
  String toString() {
    return 'IsEmailDuplicateDTO(isEmailDuplicated: $isEmailDuplicated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IsEmailDuplicateDTO &&
            const DeepCollectionEquality()
                .equals(other.isEmailDuplicated, isEmailDuplicated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isEmailDuplicated));

  @JsonKey(ignore: true)
  @override
  _$$_IsEmailDuplicateDTOCopyWith<_$_IsEmailDuplicateDTO> get copyWith =>
      __$$_IsEmailDuplicateDTOCopyWithImpl<_$_IsEmailDuplicateDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IsEmailDuplicateDTOToJson(
      this,
    );
  }
}

abstract class _IsEmailDuplicateDTO implements IsEmailDuplicateDTO {
  factory _IsEmailDuplicateDTO(
      {@JsonKey(name: "email-duplicated")
          required final bool isEmailDuplicated}) = _$_IsEmailDuplicateDTO;

  factory _IsEmailDuplicateDTO.fromJson(Map<String, dynamic> json) =
      _$_IsEmailDuplicateDTO.fromJson;

  @override
  @JsonKey(name: "email-duplicated")
  bool get isEmailDuplicated;
  @override
  @JsonKey(ignore: true)
  _$$_IsEmailDuplicateDTOCopyWith<_$_IsEmailDuplicateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
