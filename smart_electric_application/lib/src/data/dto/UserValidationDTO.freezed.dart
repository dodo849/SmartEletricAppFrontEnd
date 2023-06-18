// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'UserValidationDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserValidationDTO _$UserValidationDTOFromJson(Map<String, dynamic> json) {
  return _UserValidationDTO.fromJson(json);
}

/// @nodoc
mixin _$UserValidationDTO {
  String get joinYn => throw _privateConstructorUsedError;
  String get infoYn => throw _privateConstructorUsedError;
  @JsonKey(name: "exp_agre_dd")
  String get expAgreeDate => throw _privateConstructorUsedError;
  @JsonKey(name: "prvd_agre_dd")
  String get provideAgreeDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserValidationDTOCopyWith<UserValidationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserValidationDTOCopyWith<$Res> {
  factory $UserValidationDTOCopyWith(
          UserValidationDTO value, $Res Function(UserValidationDTO) then) =
      _$UserValidationDTOCopyWithImpl<$Res, UserValidationDTO>;
  @useResult
  $Res call(
      {String joinYn,
      String infoYn,
      @JsonKey(name: "exp_agre_dd") String expAgreeDate,
      @JsonKey(name: "prvd_agre_dd") String provideAgreeDate});
}

/// @nodoc
class _$UserValidationDTOCopyWithImpl<$Res, $Val extends UserValidationDTO>
    implements $UserValidationDTOCopyWith<$Res> {
  _$UserValidationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinYn = null,
    Object? infoYn = null,
    Object? expAgreeDate = null,
    Object? provideAgreeDate = null,
  }) {
    return _then(_value.copyWith(
      joinYn: null == joinYn
          ? _value.joinYn
          : joinYn // ignore: cast_nullable_to_non_nullable
              as String,
      infoYn: null == infoYn
          ? _value.infoYn
          : infoYn // ignore: cast_nullable_to_non_nullable
              as String,
      expAgreeDate: null == expAgreeDate
          ? _value.expAgreeDate
          : expAgreeDate // ignore: cast_nullable_to_non_nullable
              as String,
      provideAgreeDate: null == provideAgreeDate
          ? _value.provideAgreeDate
          : provideAgreeDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserValidationDTOCopyWith<$Res>
    implements $UserValidationDTOCopyWith<$Res> {
  factory _$$_UserValidationDTOCopyWith(_$_UserValidationDTO value,
          $Res Function(_$_UserValidationDTO) then) =
      __$$_UserValidationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String joinYn,
      String infoYn,
      @JsonKey(name: "exp_agre_dd") String expAgreeDate,
      @JsonKey(name: "prvd_agre_dd") String provideAgreeDate});
}

/// @nodoc
class __$$_UserValidationDTOCopyWithImpl<$Res>
    extends _$UserValidationDTOCopyWithImpl<$Res, _$_UserValidationDTO>
    implements _$$_UserValidationDTOCopyWith<$Res> {
  __$$_UserValidationDTOCopyWithImpl(
      _$_UserValidationDTO _value, $Res Function(_$_UserValidationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinYn = null,
    Object? infoYn = null,
    Object? expAgreeDate = null,
    Object? provideAgreeDate = null,
  }) {
    return _then(_$_UserValidationDTO(
      joinYn: null == joinYn
          ? _value.joinYn
          : joinYn // ignore: cast_nullable_to_non_nullable
              as String,
      infoYn: null == infoYn
          ? _value.infoYn
          : infoYn // ignore: cast_nullable_to_non_nullable
              as String,
      expAgreeDate: null == expAgreeDate
          ? _value.expAgreeDate
          : expAgreeDate // ignore: cast_nullable_to_non_nullable
              as String,
      provideAgreeDate: null == provideAgreeDate
          ? _value.provideAgreeDate
          : provideAgreeDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserValidationDTO implements _UserValidationDTO {
  _$_UserValidationDTO(
      {required this.joinYn,
      required this.infoYn,
      @JsonKey(name: "exp_agre_dd") required this.expAgreeDate,
      @JsonKey(name: "prvd_agre_dd") required this.provideAgreeDate});

  factory _$_UserValidationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserValidationDTOFromJson(json);

  @override
  final String joinYn;
  @override
  final String infoYn;
  @override
  @JsonKey(name: "exp_agre_dd")
  final String expAgreeDate;
  @override
  @JsonKey(name: "prvd_agre_dd")
  final String provideAgreeDate;

  @override
  String toString() {
    return 'UserValidationDTO(joinYn: $joinYn, infoYn: $infoYn, expAgreeDate: $expAgreeDate, provideAgreeDate: $provideAgreeDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserValidationDTO &&
            (identical(other.joinYn, joinYn) || other.joinYn == joinYn) &&
            (identical(other.infoYn, infoYn) || other.infoYn == infoYn) &&
            (identical(other.expAgreeDate, expAgreeDate) ||
                other.expAgreeDate == expAgreeDate) &&
            (identical(other.provideAgreeDate, provideAgreeDate) ||
                other.provideAgreeDate == provideAgreeDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, joinYn, infoYn, expAgreeDate, provideAgreeDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserValidationDTOCopyWith<_$_UserValidationDTO> get copyWith =>
      __$$_UserValidationDTOCopyWithImpl<_$_UserValidationDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserValidationDTOToJson(
      this,
    );
  }
}

abstract class _UserValidationDTO implements UserValidationDTO {
  factory _UserValidationDTO(
      {required final String joinYn,
      required final String infoYn,
      @JsonKey(name: "exp_agre_dd")
          required final String expAgreeDate,
      @JsonKey(name: "prvd_agre_dd")
          required final String provideAgreeDate}) = _$_UserValidationDTO;

  factory _UserValidationDTO.fromJson(Map<String, dynamic> json) =
      _$_UserValidationDTO.fromJson;

  @override
  String get joinYn;
  @override
  String get infoYn;
  @override
  @JsonKey(name: "exp_agre_dd")
  String get expAgreeDate;
  @override
  @JsonKey(name: "prvd_agre_dd")
  String get provideAgreeDate;
  @override
  @JsonKey(ignore: true)
  _$$_UserValidationDTOCopyWith<_$_UserValidationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
