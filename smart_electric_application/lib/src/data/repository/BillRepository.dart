import 'package:smart_electric_application/src/data/dto/BillDateDTO.dart';
import 'package:smart_electric_application/src/data/retrofit/BillRetrofit.dart';
import 'package:smart_electric_application/src/data/retrofit/config/getInterceptorDio.dart';
import 'package:smart_electric_application/src/domain/usecase/interface/BillRepositoryInterface.dart';

class BillRepository implements BillRepositoryInterface {
  @override
  Future<BillDateDTO> requestBillDate(String customerNumber) async {
    try {
      final dio = await getInterceptorDio(); // Provide a dio instance
      final retrofit = BillRetrofit(dio);

      BillDateDTO billDateDTO =
          await retrofit.getBillDate(customerNumber);

      return billDateDTO;
    } catch (err) {
      rethrow;
    }
  }
}
