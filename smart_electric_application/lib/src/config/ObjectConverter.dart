// import 'dart:convert';

// class ObjectConverter<T> {
//     static String encode(List<T> musics) => json.encode(
//         musics
//             .map<Map<String, dynamic>>(
//                 (music) => T.toMap(music))
//             .toList(),
//       );

//   static List<T> decode(String billSimulationProducts) =>
//       (json.decode(billSimulationProducts) as List<dynamic>)
//           .map<T>(
//               (item) => T.fromJson(item))
//           .toList();

// }