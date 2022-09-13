// import 'package:smart_electric_application/src/data/network/HTTPMethod.dart';

// /// 'HttpRequestProtocol' encapsulates the entire data necessary to create our requests.
// /// It will be helper to create our Request object of 'http.dart' package.


// abstract class HttpRequestProtocol {
//   String get baseUrl;
//   String get path;
//   HttpMethod get method;
//   Map<String, String> get headers;
//   Map<String, dynamic> get parameters;
//   ContentEncoding get contentEncoding;
  
//   /// Do not override this getter. Whenever the method's request is GET,
//   /// the layer will concatenate the parameters into the query.
//   String get queryParameters {
//     if (method == HttpMethod.GET && parameters != null) {
//       final jsonString = Uri(queryParameters: parameters);
//       return '?${jsonString.query}';
//     }

//     return '';
//   }
// }