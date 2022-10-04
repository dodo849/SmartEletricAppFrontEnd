// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'SaveEmailDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SaveEmailDTO _$SaveEmailDTOFromJson(Map<String, dynamic> json) {
  return _SaveEmailDTO.fromJson(json);
}

/// @nodoc
mixin _$SaveEmailDTO {
  bool get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaveEmailDTOCopyWith<SaveEmailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveEmailDTOCopyWith<$Res> {
  factory $SaveEmailDTOCopyWith(
          SaveEmailDTO value, $Res Function(SaveEmailDTO) then) =
      _$SaveEmailDTOCopyWithImpl<$Res>;
  $Res call({bool updated});
}

/// @nodoc
class _$SaveEmailDTOCopyWithImpl<$Res> implements $SaveEmailDTOCopyWith<$Res> {
  _$SaveEmailDTOCopyWithImpl(this._value, this._then);

  final SaveEmailDTO _value;
  // ignore: unused_field
  final $Res Function(SaveEmailDTO) _then;

  @override
  $Res call({
    Object? updated = freezed,
  }) {
    return _then(_value.copyWith(
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SaveEmailDTOCopyWith<$Res>
    implements $SaveEmailDTOCopyWith<$Res> {
  factory _$$_SaveEmailDTOCopyWith(
          _$_SaveEmailDTO value, $Res Function(_$_SaveEmailDTO) then) =
      __$$_SaveEmailDTOCopyWithImpl<$Res>;
  @override
  $Res call({bool updated});
}

/// @nodoc
class __$$_SaveEmailDTOCopyWithImpl<$Res>
    extends _$SaveEmailDTOCopyWithImpl<$Res>
    implements _$$_SaveEmailDTOCopyWith<$Res> {
  __$$_SaveEmailDTOCopyWithImpl(
      _$_SaveEmailDTO _value, $Res Function(_$_SaveEmailDTO) _then)
      : super(_value, (v) => _then(v as _$_SaveEmailDTO));

  @override
  _$_SaveEmailDTO get _value => super._value as _$_SaveEmailDTO;

  @override
  $Res call({
    Object? updated = freezed,
  }) {
    return _then(_$_SaveEmailDTO(
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SaveEmailDTO implements _SaveEmailDTO {
  _$_SaveEmailDTO({required this.updated});

  factory _$_SaveEmailDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SaveEmailDTOFromJson(json);

  @override
  final bool updated;

  @override
  String toString() {
    return 'SaveEmailDTO(updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveEmailDTO &&
            const DeepCollectionEquality().equals(other.updated, updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(updated));

  @JsonKey(ignore: true)
  @override
  _$$_SaveEmailDTOCopyWith<_$_SaveEmailDTO> get copyWith =>
      __$$_SaveEmailDTOCopyWithImpl<_$_SaveEmailDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SaveEmailDTOToJson(
      this,
    );
  }
}

abstract class _SaveEmailDTO implements SaveEmailDTO {
  factory _SaveEmailDTO({required final bool updated}) = _$_SaveEmailDTO;

  factory _SaveEmailDTO.fromJson(Map<String, dynamic> json) =
      _$_SaveEmailDTO.fromJson;

  @override
  bool get updated;
  @override
  @JsonKey(ignore: true)
  _$$_SaveEmailDTOCopyWith<_$_SaveEmailDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
