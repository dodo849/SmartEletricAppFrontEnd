import 'package:flutter/material.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/CheckIsSmartMeter.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/CheckPassword.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/EmailVerification.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/EnterCustomerNumber.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/EnterUserEmail.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/EnterUserName.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/EnterUserPassword.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/ExplanationOfInfoAgreement.dart';
import 'package:smart_electric_application/src/presentation/view/module/signup/KepcoSingupMenual.dart';

/// #### 회원가입 하위 페이지 -> 정의된 순서대로 페이지 전환
enum EnterUserInfoPage {
  enterCustomerNumber(EnterCustomerNumber()),
  checkIsSmartMeter(CheckIsSmartMeter()),
  enterUserName(EnterUserName()),
  enterUserEmail(EnterUserEmail()),
  enterUserPassword(EnterUserPassword()),
  checkPassword(CheckPassword()),
  emailVerification(EmailVerification()),
  explanationOfInfoAgreement(ExplanationOfInfoAgreement()),
  kepcoSingupMenual(KepcoSingupMenual());

  // final int index;
  final Widget page;
  const EnterUserInfoPage(this.page);
}