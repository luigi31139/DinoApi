import 'package:dinosaurs/controllers/dinosaur_controller.dart';
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
      appBar: AppBar(centerTitle: true,title: const Text('DinoList'),backgroundColor: Colors.green,),
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
                    mainAxisSpacing: 20,
                  ),
                  itemCount: dinos.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap:(){
                
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 25),
                          width: 200,
                          height: 230,
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
                                  width: 130,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(dinos[index].nombre),
                              Text(dinos[index].periodo)
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