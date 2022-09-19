import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_electric_application/src/data/retrofit/InfoRetrofit.dart';

class InfoRepository {

  Future<bool> checkInfoValidation() async {
    final dio = Dio(); // Provide a dio instance
    final retrofit = InfoRetrofit(dio);

    return false;
    
  }
}
