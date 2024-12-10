import 'package:audioplayers/audioplayers.dart';
import 'package:dinosaurs/controllers/dinosaur_controller.dart';
import 'package:dinosaurs/details.dart';
import 'package:dinosaurs/login.dart';
import 'package:flutter/material.dart';

class DinoList extends StatefulWidget {
  const DinoList({super.key});

  @override
  State<DinoList> createState() => _DinoListState();
}

class _DinoListState extends State<DinoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DinoList'),
        leading: IconButton(onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false,
                  );
                }, 
          icon: const Icon(Icons.logout)),
          backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: DinoController().getDinos(), 
        builder: (context,snapshot){
          snapshot.data;

          if(snapshot.data == null){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final dinos = snapshot.data!;

          return Stack(
            children: [
              Positioned.fill(child: Image.asset('assets/background.jpg',fit: BoxFit.cover,)),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: dinos.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap:(){
                        AudioPlayer().play(AssetSource('dinoroar.mp3'),volume: 0.8);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailView(dino: [dinos[index]],)));
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 25),
                          width: 180,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white54,
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/claw.png',
                                  image: dinos[index].imagenUrl,
                                  width: 150,
                                  height: 130,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(dinos[index].nombre),
                            ],
                          ),
                        ),
                      )
                    );
                  },
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}