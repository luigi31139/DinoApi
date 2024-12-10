import 'dart:convert';
import 'package:http/http.dart' as http;


class DinoRepo {


 Future <http.Response> getDinos() async{
    final url = Uri.parse('https://api.jsonbin.io/v3/b/6745f15ce41b4d34e45b0ac5');
    final response = await http.get(url);
    //print(response.body);
    return response;
  }

Future<http.Response> postDino(Map<String, dynamic> dinoData) async {
    final url = Uri.parse('https://api.jsonbin.io/v3/b/6745f15ce41b4d34e45b0ac5');
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(dinoData);
    final response = await http.post(url, headers: headers, body: body);
    return response;
  }

}