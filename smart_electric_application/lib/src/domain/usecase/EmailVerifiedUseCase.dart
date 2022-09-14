import 'package:smart_electric_application/src/data/repository/firebase/FirebaseRepository.dart';

class EmailVerifiedUseCase {
  // 나중에 email, password 로컬 DB에서 가져오는 걸로 바꾸기
  Future<bool> execute(email, password) async {
    // 파이어베이스 레포지토리 인스턴스 생성
    FirebaseRepository firebaseRepository = FirebaseRepository();

    // 인증 이메일 보내기
    await firebaseRepository.emailVerified();

    // 이메일 인증 후 로그아웃 -> 재로그인 과정 필요
    await firebaseRepository.logout();

    await firebaseRepository.login(email, password);

    print(firebaseRepository.getUser());
    print("Singup UseCase");

    // 과정 성공 시 true 반환
    return true;
  }
}
