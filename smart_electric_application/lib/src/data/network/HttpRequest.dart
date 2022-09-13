// // 'HttpRequest' receives a 'HttpRequestProtocol' object with all the request's information.
// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:http/http.dart';
// import 'package:smart_electric_application/src/data/network/ContentEncoding.dart';
// import 'package:smart_electric_application/src/data/network/HttpRequestProtocol.dart';

// class HttpRequest extends Request {
//   final HttpRequestProtocol service;

//   HttpRequest(this.service)
//       : super(
//             service.method.toString(),
//             Uri.parse(
//                 '${service.baseUrl}${service.path}${service.queryParameters}'));

//   @override
//   Map<String, String> get headers => this.service.headers;

//   @override
//   String get body => json.encode(this.service.parameters);

//   @override
//   Uint8List get bodyBytes {
//     if (service.parameters == null) {
//       return new Uint8List(0);
//     }

//     if (service.contentEncoding == ContentEncoding.url) {
//       final queryParameters = Uri(queryParameters: service.parameters);
//       List<int> bodyBytes = utf8.encode(queryParameters.query);

//       return bodyBytes;
//     } else {
//       final encodedBody = Utf8Codec().encode(body);
//       return Uint8List.fromList(encodedBody);
//     }
//   }

//   @override
//   MediaType get _contentType {
//     var contentType = headers['content-type'];
//     if (contentType == null) return null;
//     return new MediaType.parse(contentType);
//   }
// }