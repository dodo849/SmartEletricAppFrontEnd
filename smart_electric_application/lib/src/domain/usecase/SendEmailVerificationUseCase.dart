import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/data/repository/FirebaseRepository.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/FirebaseRepositoryInterface.dart';

class SendEmailVerificationUsecase {
  // DI
  final FirebaseRepositoryInterface firebaseRepository =
      GetIt.I.get<FirebaseRepositoryInterface>();

  // 나중에 email, password 로컬 DB에서 가져오는 걸로 바꾸기
  Future<bool> execute(email, password) async {
    // 인증 이메일 보내기
    await firebaseRepository.sendEmailVerification();
    // 과정 성공 시 true 반환
    return true;
  }
}
