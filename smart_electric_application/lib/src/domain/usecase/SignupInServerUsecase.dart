import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/data/dto/AccountRegistrationDTO.dart';
import 'package:smart_electric_application/src/data/dto/BillDateDTO.dart';
import 'package:smart_electric_application/src/domain/usecase/LoginUseCase.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AccountRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/AuthRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/BillRepositoryInterface.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

///
class SignupInServerUsecase {
  // DI
  final FirebaseRepositoryInterface firebaseRepository =
      GetIt.I.get<FirebaseRepositoryInterface>();
  final AuthRepositoryInterface authRepository =
      GetIt.I.get<AuthRepositoryInterface>();
  final AccountRepositoryInterface accountRepository =
      GetIt.I.get<AccountRepositoryInterface>();
  final billRepository = GetIt.I.get<BillRepositoryInterface>();

  // Usecase
  final loginUseCase = LoginUsecase();

  Future<Result<bool, String>> execute(
      {required String customerNumber,
      required String name,
      required String email,
      required String password,
      required bool isSmartMeter}) async {
    // 파이어베이스 uid 가져오기
    var firebaseUidResult = await firebaseRepository.getUid();
    if (firebaseUidResult.status == ResultStatus.error) {
      return Result.failure(firebaseUidResult.error.toString());
    }

    // message token 가져오기
    String messageToken;
    try {
      messageToken = await firebaseRepository.getMessageToken();
    } catch (error) {
      return Result.failure(error.toString());
    }

    // Account 서버에 회원가입
    Result<bool, String> requestRegisterAccountResult =
        await accountRepository.requestRegisterAccount(
            accountRegistrationDTO: AccountRegistrationDTO(
                customerNumber: customerNumber,
                email: email,
                firebaseMessageToken: messageToken,
                firebaseUid: firebaseUidResult.value!,
                isSmartMeter: isSmartMeter,
                name: name));

    if (requestRegisterAccountResult.status == ResultStatus.error) {
      // 이미 한번 가입한 이메일이라서 403뜰 경우 유저 활성화하기 => 그냥 유저 delete로 바꾸어서 user 삭제됨
      if (requestRegisterAccountResult.error == '403') {
        await accountRepository.requestActivateUser(email: email);
      } else {
        return Result.failure(requestRegisterAccountResult.error.toString());
      }
    }

    // 청구정보 받아오기
    BillDateDTO billDateDTO;
    try {
      billDateDTO = await billRepository.requestBillDate(customerNumber);
    } catch (error) {
      return Result.failure(error.toString());
    }

    // 유저 정보 내부 DB에 저장
    Result<bool, String> saveUserResult = await authRepository.saveUser(
        customerNumber: customerNumber,
        name: name,
        email: email,
        isSmartMeter: isSmartMeter,
        billDate: billDateDTO.result);

    if (saveUserResult.status == ResultStatus.error) {
      return saveUserResult;
    }

    // 모든 과정 성공 시 true Result 반환
    return const Result.success(true);
  }
}
