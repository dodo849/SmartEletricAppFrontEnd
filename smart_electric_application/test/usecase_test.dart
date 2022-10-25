import 'package:flutter_test/flutter_test.dart';
import 'package:smart_electric_application/src/config/Result.dart';
import 'package:smart_electric_application/src/domain/usecase/SignupUsecase.dart';

void testUseCase() {
  // Signup Use Case
  group('Signup UseCase', () {
    test('Signup UseCase all clear', () async {
      final signupUseCase = SignupUsecase();

      Result<bool, String> result = await signupUseCase.execute(
          customerNumber: '', email: '', name: '', password: '');
          
      expect(result.value, true);
    });

    // test('test for Counter decrement', () {
    //   final counter = Counter();

    //   counter.decrement();
    //   expect(counter.count, -1);
    // });
  });
}
