import 'dart:convert';
import 'package:http/http.dart' as http;


class DinoRepo {

 Future<List<dynamic>> getDinos() async {
    final url = Uri.parse('http://10.100.0.222/proyects/dinosaurs/getdinos.php');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> dinos = json.decode(response.body);
        print(response.body);
        return dinos;
      } else {
        throw Exception('Failed to load dinosaurs');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}