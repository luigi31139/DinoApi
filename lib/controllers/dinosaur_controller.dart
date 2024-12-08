import 'dart:convert';
import 'package:dinosaurs/models/dinosaurio.dart';
import 'package:dinosaurs/repo/dinosaur_repo.dart';

class DinoController {

  final dinoRepo = DinoRepo();

  Future<List<Dinosaurio>>getDinos() async {
    final response = await dinoRepo.getDinos();
    final data = jsonDecode(response.body);
    List<Dinosaurio> dinos = [];
    final dinosJson = data['record']['dinosaurios'];
    //print(dinosJson);

    for(dynamic dinoJson in dinosJson){
      dinos.add(Dinosaurio.fromJson(dinoJson));
    }

    return dinos;
  }
}