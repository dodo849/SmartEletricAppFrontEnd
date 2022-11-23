import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_electric_application/src/data/dto/AccountEmailValidationDTO.dart';
import 'package:smart_electric_application/src/data/dto/AccountRegistrationDTO.dart';

part 'AccountRetrofit.g.dart';

@RestApi(baseUrl: "https://api.smartelectric.kr/account")
abstract class AccountRetrofit {
  factory AccountRetrofit(Dio dio, {String baseUrl}) = _AccountRetrofit;

  @POST("/user/signup")
  Future<String> registerNewAcoount(
      @Body() AccountRegistrationDTO accountRegistrationDTO);

  @GET("/user/search")
  Future<AccountRegistrationDTO> getAccountRegistration(
      @Query("email") String email);

  @GET("/email/validation")
  Future<AccountEmailValidationDTO> getEmailValidation(
      @Query("email") String email);

    @GET("/user/activate")
  Future<AccountEmailValidationDTO> activateUser(
      @Query("email") String email);
}
