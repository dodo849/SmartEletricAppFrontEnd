import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/JwtTokenDTO.dart';
import 'package:smart_electric_application/src/data/repository/AuthRepository.dart';
import 'package:smart_electric_application/src/domain/model/UserModel.dart';

class AuthMockRepository implements AuthRepository {
  @override
  Future<Result<bool, String>> checkEmailDuplicate(String email) {
    // TODO: implement checkEmailDuplicate
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, String>> checkLogin() async {
    // TODO: implement checkLogin
    return const Result.success(true);
  }

  @override
  Future<Result<String?, String>> getAddress() async {
    return const Result.success('서울시 강남구');
  }

  @override
  Future<Result<String, String>> getCustomerNumber() async {
    return const Result.success('12345678910');
  }

  @override
  Future<Result<String, String>> getEmail() {
    // TODO: implement getEmail
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, String>> getIsSmartMeter() {
    // TODO: implement getIsSmartMeter
    throw UnimplementedError();
  }

  @override
  Future<Result<JwtTokenDTO, String>> getJwt() {
    // TODO: implement getJwt
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Result<String, String>> getUserName() async {
    return const Result.success('홍길동');
  }

  @override
  Future<Result<bool, String>> removeEmail(email) {
    // TODO: implement removeEmail
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, String>> removeJwt() {
    // TODO: implement removeJwt
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, String>> removeUser() {
    // TODO: implement removeUser
    throw UnimplementedError();
  }

  @override
  Future<Result<JwtTokenDTO, String>> requestJwt(String firebaseIdToken) {
    // TODO: implement requestJwt
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, String>> saveAddress(String address) {
    // TODO: implement saveAddress
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, String>> saveEmail(String email) {
    // TODO: implement saveEmail
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, String>> saveJwt(JwtTokenDTO tokens) {
    // TODO: implement saveJwt
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, String>> saveUser(
      {required String customerNumber,
      required String name,
      required String email,
      required bool isSmartMeter,
      required String billDate}) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, String>> setLogin() {
    // TODO: implement setLogin
    throw UnimplementedError();
  }
}
