import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_electric_application/src/data/dto/AiPredictionDTO.dart';
import 'package:smart_electric_application/src/data/dto/AiReportDTO.dart';
import 'package:smart_electric_application/src/data/dto/CalculateBillDTO.dart';

part 'AiRetrofit.g.dart';

@RestApi(baseUrl: "https://api.smartelectric.kr/ai")
abstract class AiRetrofit {
  factory AiRetrofit(Dio dio, {String baseUrl}) = _AiRetrofit;

  @GET("/report/issue")
  Future<AiReportDTO> requestAiReport(@Query("custNo") String customerNumber);

  @GET("/prediction")
  Future<AiPredictionDTO> requestAiPrediction(
      @Query("custNo") String customerNumber);

  @GET("/calculator")
  Future<CalculateBillDTO> requestCalculateBill(
      @Query("custNo") String customerNumber,
      @Query("powerUsageQuantity") double powerUsageQuantity);
}
