import 'package:smart_electric_application/src/data/dto/BillDateDTO.dart';

abstract class BillRepositoryInterface {
Future<BillDateDTO> requestBillDate(String customerNumber);
}
