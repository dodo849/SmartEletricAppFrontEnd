// import 'dart:io';

// import 'package:http/http.dart' as http;

// class NetworkManager {
//   String baseURL;
//   HTTPMethod method;
//   String path;
//   RequestParams? param;


//   NetworkManager(this.baseURL, this.method, this.path);

//   void networking() async {
//     // Request URL
//     var urlString;
//     if (param != null){
//       urlString = baseURL + path;
//     }
//     else if ()
//       var url = Uri.parse(
//         baseURL + path,
//       );

//     // Header
//     var headers = {
//       HttpHeaders.authorizationHeader: 'Token $token',
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };

//     var response;
//     switch (method) {
//       case HTTPMethod.GET:
//         response = await http.get(url);
//         break;
//       case HTTPMethod.POST:
//         response = await http.post(url, body);
//         break;
//     }
//     response = await http.get(url);
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');

//     // url = Uri.parse('https://reqbin.com/sample/post/json');
//     // response = await http.post(url, body: {
//     //   'key': 'value',
//     // });
//     // print('Response status: ${response.statusCode}');
//     // print('Response body: ${response.body}');
//   }
// }



// enum RequestParams { query, body, both }
