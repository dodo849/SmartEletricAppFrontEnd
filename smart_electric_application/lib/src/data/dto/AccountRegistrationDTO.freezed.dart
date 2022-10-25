// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'AccountRegistrationDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountRegistrationDTO _$AccountRegistrationDTOFromJson(
    Map<String, dynamic> json) {
  return _AccountRegistrationDTO.fromJson(json);
}

/// @nodoc
mixin _$AccountRegistrationDTO {
  String get firebaseUid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get customerNumber => throw _privateConstructorUsedError;
  String get firebaseMessageToken => throw _privateConstructorUsedError;
  bool get isSmartMeter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountRegistrationDTOCopyWith<AccountRegistrationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountRegistrationDTOCopyWith<$Res> {
  factory $AccountRegistrationDTOCopyWith(AccountRegistrationDTO value,
          $Res Function(AccountRegistrationDTO) then) =
      _$AccountRegistrationDTOCopyWithImpl<$Res>;
  $Res call(
      {String firebaseUid,
      String name,
      String email,
      String customerNumber,
      String firebaseMessageToken,
      bool isSmartMeter});
}

/// @nodoc
class _$AccountRegistrationDTOCopyWithImpl<$Res>
    implements $AccountRegistrationDTOCopyWith<$Res> {
  _$AccountRegistrationDTOCopyWithImpl(this._value, this._then);

  final AccountRegistrationDTO _value;
  // ignore: unused_field
  final $Res Function(AccountRegistrationDTO) _then;

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
abstract class _$$_AccountRegistrationDTOCopyWith<$Res>
    implements $AccountRegistrationDTOCopyWith<$Res> {
  factory _$$_AccountRegistrationDTOCopyWith(_$_AccountRegistrationDTO value,
          $Res Function(_$_AccountRegistrationDTO) then) =
      __$$_AccountRegistrationDTOCopyWithImpl<$Res>;
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
class __$$_AccountRegistrationDTOCopyWithImpl<$Res>
    extends _$AccountRegistrationDTOCopyWithImpl<$Res>
    implements _$$_AccountRegistrationDTOCopyWith<$Res> {
  __$$_AccountRegistrationDTOCopyWithImpl(_$_AccountRegistrationDTO _value,
      $Res Function(_$_AccountRegistrationDTO) _then)
      : super(_value, (v) => _then(v as _$_AccountRegistrationDTO));

  @override
  _$_AccountRegistrationDTO get _value =>
      super._value as _$_AccountRegistrationDTO;

  @override
  $Res call({
    Object? firebaseUid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? customerNumber = freezed,
    Object? firebaseMessageToken = freezed,
    Object? isSmartMeter = freezed,
  }) {
    return _then(_$_AccountRegistrationDTO(
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
class _$_AccountRegistrationDTO implements _AccountRegistrationDTO {
  _$_AccountRegistrationDTO(
      {required this.firebaseUid,
      required this.name,
      required this.email,
      required this.customerNumber,
      required this.firebaseMessageToken,
      required this.isSmartMeter});

  factory _$_AccountRegistrationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AccountRegistrationDTOFromJson(json);

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
    return 'AccountRegistrationDTO(firebaseUid: $firebaseUid, name: $name, email: $email, customerNumber: $customerNumber, firebaseMessageToken: $firebaseMessageToken, isSmartMeter: $isSmartMeter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountRegistrationDTO &&
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
  _$$_AccountRegistrationDTOCopyWith<_$_AccountRegistrationDTO> get copyWith =>
      __$$_AccountRegistrationDTOCopyWithImpl<_$_AccountRegistrationDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountRegistrationDTOToJson(
      this,
    );
  }
}

abstract class _AccountRegistrationDTO implements AccountRegistrationDTO {
  factory _AccountRegistrationDTO(
      {required final String firebaseUid,
      required final String name,
      required final String email,
      required final String customerNumber,
      required final String firebaseMessageToken,
      required final bool isSmartMeter}) = _$_AccountRegistrationDTO;

  factory _AccountRegistrationDTO.fromJson(Map<String, dynamic> json) =
      _$_AccountRegistrationDTO.fromJson;

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
  _$$_AccountRegistrationDTOCopyWith<_$_AccountRegistrationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
