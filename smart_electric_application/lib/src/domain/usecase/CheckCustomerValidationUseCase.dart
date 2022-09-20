import 'dart:convert';

import 'package:http/http.dart' as http;

/// 사용자 정보 제공 동의 확인 UseCase
class CheckInfoAgreementUseCase {
  void excute() async {
    var url = Uri.parse(
      'https://api.smartelectric.kr/info/specific-user/validation?custNo=0130392270',
    );
    var response = await http.get(url);
    print('Response status: ${response.body}');
    var jsonsDataString = response.body.toString();
    var data = jsonDecode(jsonsDataString);
    print('Response body: ${data}');

    // url = Uri.parse('https://reqbin.com/sample/post/json');
    // response = await http.(url, body: {
    //   {
    //     "joinYn": String,
    //     "agreeYn": String,
    //     "infoYn": String,
    //     "exp_agre_dd": String,
    //     "prvd_agre_dd": String
    //   }
    // });
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }
}
