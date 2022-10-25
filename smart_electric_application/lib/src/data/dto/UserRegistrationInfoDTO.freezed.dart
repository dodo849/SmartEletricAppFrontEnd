// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'UserRegistrationInfoDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRegistrationInfoDTO _$UserRegistrationInfoDTOFromJson(
    Map<String, dynamic> json) {
  return _UserRegistrationInfoDTO.fromJson(json);
}

/// @nodoc
mixin _$UserRegistrationInfoDTO {
  String get firebaseUid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get customerNumber => throw _privateConstructorUsedError;
  String get firebaseMessageToken => throw _privateConstructorUsedError;
  bool get isSmartMeter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegistrationInfoDTOCopyWith<UserRegistrationInfoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegistrationInfoDTOCopyWith<$Res> {
  factory $UserRegistrationInfoDTOCopyWith(UserRegistrationInfoDTO value,
          $Res Function(UserRegistrationInfoDTO) then) =
      _$UserRegistrationInfoDTOCopyWithImpl<$Res>;
  $Res call(
      {String firebaseUid,
      String name,
      String email,
      String customerNumber,
      String firebaseMessageToken,
      bool isSmartMeter});
}

/// @nodoc
class _$UserRegistrationInfoDTOCopyWithImpl<$Res>
    implements $UserRegistrationInfoDTOCopyWith<$Res> {
  _$UserRegistrationInfoDTOCopyWithImpl(this._value, this._then);

  final UserRegistrationInfoDTO _value;
  // ignore: unused_field
  final $Res Function(UserRegistrationInfoDTO) _then;

  @override
  $Res call({
    Object? firebaseUid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? customerNumber = freezed,
    Object? firebaseMessageToken = freezed,
    Object? isSmartMeter = freezed,
  }) {
    return _then(_value.copyWith(
      firebaseUid: firebaseUid == freezed
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      customerNumber: customerNumber == freezed
          ? _value.customerNumber
          : customerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseMessageToken: firebaseMessageToken == freezed
          ? _value.firebaseMessageToken
          : firebaseMessageToken // ignore: cast_nullable_to_non_nullable
              as String,
      isSmartMeter: isSmartMeter == freezed
          ? _value.isSmartMeter
          : isSmartMeter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_UserRegistrationInfoDTOCopyWith<$Res>
    implements $UserRegistrationInfoDTOCopyWith<$Res> {
  factory _$$_UserRegistrationInfoDTOCopyWith(_$_UserRegistrationInfoDTO value,
          $Res Function(_$_UserRegistrationInfoDTO) then) =
      __$$_UserRegistrationInfoDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firebaseUid,
      String name,
      String email,
      String customerNumber,
      String firebaseMessageToken,
      bool isSmartMeter});
}

/// @nodoc
class __$$_UserRegistrationInfoDTOCopyWithImpl<$Res>
    extends _$UserRegistrationInfoDTOCopyWithImpl<$Res>
    implements _$$_UserRegistrationInfoDTOCopyWith<$Res> {
  __$$_UserRegistrationInfoDTOCopyWithImpl(_$_UserRegistrationInfoDTO _value,
      $Res Function(_$_UserRegistrationInfoDTO) _then)
      : super(_value, (v) => _then(v as _$_UserRegistrationInfoDTO));

  @override
  _$_UserRegistrationInfoDTO get _value =>
      super._value as _$_UserRegistrationInfoDTO;

  @override
  $Res call({
    Object? firebaseUid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? customerNumber = freezed,
    Object? firebaseMessageToken = freezed,
    Object? isSmartMeter = freezed,
  }) {
    return _then(_$_UserRegistrationInfoDTO(
      firebaseUid: firebaseUid == freezed
          ? _value.firebaseUid
          : firebaseUid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      customerNumber: customerNumber == freezed
          ? _value.customerNumber
          : customerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseMessageToken: firebaseMessageToken == freezed
          ? _value.firebaseMessageToken
          : firebaseMessageToken // ignore: cast_nullable_to_non_nullable
              as String,
      isSmartMeter: isSmartMeter == freezed
          ? _value.isSmartMeter
          : isSmartMeter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRegistrationInfoDTO implements _UserRegistrationInfoDTO {
  _$_UserRegistrationInfoDTO(
      {required this.firebaseUid,
      required this.name,
      required this.email,
      required this.customerNumber,
      required this.firebaseMessageToken,
      required this.isSmartMeter});

  factory _$_UserRegistrationInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserRegistrationInfoDTOFromJson(json);

  @override
  final String firebaseUid;
  @override
  final String name;
  @override
  final String email;
  @override
  final String customerNumber;
  @override
  final String firebaseMessageToken;
  @override
  final bool isSmartMeter;

  @override
  String toString() {
    return 'UserRegistrationInfoDTO(firebaseUid: $firebaseUid, name: $name, email: $email, customerNumber: $customerNumber, firebaseMessageToken: $firebaseMessageToken, isSmartMeter: $isSmartMeter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRegistrationInfoDTO &&
            const DeepCollectionEquality()
                .equals(other.firebaseUid, firebaseUid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.customerNumber, customerNumber) &&
            const DeepCollectionEquality()
                .equals(other.firebaseMessageToken, firebaseMessageToken) &&
            const DeepCollectionEquality()
                .equals(other.isSmartMeter, isSmartMeter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firebaseUid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(customerNumber),
      const DeepCollectionEquality().hash(firebaseMessageToken),
      const DeepCollectionEquality().hash(isSmartMeter));

  @JsonKey(ignore: true)
  @override
  _$$_UserRegistrationInfoDTOCopyWith<_$_UserRegistrationInfoDTO>
      get copyWith =>
          __$$_UserRegistrationInfoDTOCopyWithImpl<_$_UserRegistrationInfoDTO>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRegistrationInfoDTOToJson(
      this,
    );
  }
}

abstract class _UserRegistrationInfoDTO implements UserRegistrationInfoDTO {
  factory _UserRegistrationInfoDTO(
      {required final String firebaseUid,
      required final String name,
      required final String email,
      required final String customerNumber,
      required final String firebaseMessageToken,
      required final bool isSmartMeter}) = _$_UserRegistrationInfoDTO;

  factory _UserRegistrationInfoDTO.fromJson(Map<String, dynamic> json) =
      _$_UserRegistrationInfoDTO.fromJson;

  @override
  String get firebaseUid;
  @override
  String get name;
  @override
  String get email;
  @override
  String get customerNumber;
  @override
  String get firebaseMessageToken;
  @override
  bool get isSmartMeter;
  @override
  @JsonKey(ignore: true)
  _$$_UserRegistrationInfoDTOCopyWith<_$_UserRegistrationInfoDTO>
      get copyWith => throw _privateConstructorUsedError;
}
