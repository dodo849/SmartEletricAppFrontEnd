import 'package:http/http.dart' as http;

class NetworkManager {
  
    void callAPI() async {
    var url = Uri.parse(
      '3.35.60.53:8080/info/specific-user/validation?custNo=0130392270',
    );
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    url = Uri.parse('https://reqbin.com/sample/post/json');
    response = await http.post(url, body: {
      'key': 'value',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}