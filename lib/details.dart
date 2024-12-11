import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.dino});

  final List dino;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.dino[0].nombre),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/background.jpg',fit: BoxFit.cover,)),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(widget.dino[0].imagenUrl,width: 250,height: 250,fit: BoxFit.contain,),
                ),
                const SizedBox(height: 30),
                Text('Nombre: ${widget.dino[0].nombre}',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                Text('Periodo: ${widget.dino[0].periodo}',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                Text('Dieta: ${widget.dino[0].dieta}',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                Text('Longitud: ${widget.dino[0].longitudMetros} mts',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                Text('Peso: ${widget.dino[0].pesoKg} Kg',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                const SizedBox(height: 20),
                Image.asset('assets/claw.png',width: 150,height: 150,fit: BoxFit.contain,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}