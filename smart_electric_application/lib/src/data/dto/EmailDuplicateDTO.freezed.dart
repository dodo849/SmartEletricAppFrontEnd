// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'EmailDuplicateDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmailDuplicateDTO _$EmailDuplicateDTOFromJson(Map<String, dynamic> json) {
  return _EmailDuplicateDTO.fromJson(json);
}

/// @nodoc
mixin _$EmailDuplicateDTO {
  @JsonKey(name: "email-duplicated")
  bool get isEmailDuplicated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailDuplicateDTOCopyWith<EmailDuplicateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailDuplicateDTOCopyWith<$Res> {
  factory $EmailDuplicateDTOCopyWith(
          EmailDuplicateDTO value, $Res Function(EmailDuplicateDTO) then) =
      _$EmailDuplicateDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "email-duplicated") bool isEmailDuplicated});
}

/// @nodoc
class _$EmailDuplicateDTOCopyWithImpl<$Res>
    implements $EmailDuplicateDTOCopyWith<$Res> {
  _$EmailDuplicateDTOCopyWithImpl(this._value, this._then);

  final EmailDuplicateDTO _value;
  // ignore: unused_field
  final $Res Function(EmailDuplicateDTO) _then;

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
abstract class _$$_EmailDuplicateDTOCopyWith<$Res>
    implements $EmailDuplicateDTOCopyWith<$Res> {
  factory _$$_EmailDuplicateDTOCopyWith(_$_EmailDuplicateDTO value,
          $Res Function(_$_EmailDuplicateDTO) then) =
      __$$_EmailDuplicateDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "email-duplicated") bool isEmailDuplicated});
}

/// @nodoc
class __$$_EmailDuplicateDTOCopyWithImpl<$Res>
    extends _$EmailDuplicateDTOCopyWithImpl<$Res>
    implements _$$_EmailDuplicateDTOCopyWith<$Res> {
  __$$_EmailDuplicateDTOCopyWithImpl(
      _$_EmailDuplicateDTO _value, $Res Function(_$_EmailDuplicateDTO) _then)
      : super(_value, (v) => _then(v as _$_EmailDuplicateDTO));

  @override
  _$_EmailDuplicateDTO get _value => super._value as _$_EmailDuplicateDTO;

  @override
  $Res call({
    Object? isEmailDuplicated = freezed,
  }) {
    return _then(_$_EmailDuplicateDTO(
      isEmailDuplicated: isEmailDuplicated == freezed
          ? _value.isEmailDuplicated
          : isEmailDuplicated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmailDuplicateDTO implements _EmailDuplicateDTO {
  _$_EmailDuplicateDTO(
      {@JsonKey(name: "email-duplicated") required this.isEmailDuplicated});

  factory _$_EmailDuplicateDTO.fromJson(Map<String, dynamic> json) =>
      _$$_EmailDuplicateDTOFromJson(json);

  @override
  @JsonKey(name: "email-duplicated")
  final bool isEmailDuplicated;

  @override
  String toString() {
    return 'EmailDuplicateDTO(isEmailDuplicated: $isEmailDuplicated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailDuplicateDTO &&
            const DeepCollectionEquality()
                .equals(other.isEmailDuplicated, isEmailDuplicated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(isEmailDuplicated));

  @JsonKey(ignore: true)
  @override
  _$$_EmailDuplicateDTOCopyWith<_$_EmailDuplicateDTO> get copyWith =>
      __$$_EmailDuplicateDTOCopyWithImpl<_$_EmailDuplicateDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmailDuplicateDTOToJson(
      this,
    );
  }
}

abstract class _EmailDuplicateDTO implements EmailDuplicateDTO {
  factory _EmailDuplicateDTO(
      {@JsonKey(name: "email-duplicated")
          required final bool isEmailDuplicated}) = _$_EmailDuplicateDTO;

  factory _EmailDuplicateDTO.fromJson(Map<String, dynamic> json) =
      _$_EmailDuplicateDTO.fromJson;

  @override
  @JsonKey(name: "email-duplicated")
  bool get isEmailDuplicated;
  @override
  @JsonKey(ignore: true)
  _$$_EmailDuplicateDTOCopyWith<_$_EmailDuplicateDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
