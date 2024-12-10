import 'package:dinosaurs/models/dinosaurio.dart';
import 'package:dinosaurs/repo/dinosaur_repo.dart';

class DinoController {

  final dinoRepo = DinoRepo();

  Future<List<Dinosaurio>>getDinos() async {
    final response = await dinoRepo.getDinos();
    List<Dinosaurio> dinos = [];

    for(dynamic dinoJson in response){
      dinos.add(Dinosaurio.fromJson(dinoJson));
    }

    return dinos;
  }
}