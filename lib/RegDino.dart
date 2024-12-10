import 'package:flutter/material.dart';

class RegDino extends StatefulWidget {
  const RegDino({super.key});

  @override
  State<RegDino> createState() => _RegDinoState();
}

class _RegDinoState extends State<RegDino> {
  TextEditingController nombre = TextEditingController();
  TextEditingController periodo = TextEditingController();
  TextEditingController  dieta= TextEditingController();
  TextEditingController  longitud= TextEditingController();
  TextEditingController  peso= TextEditingController();
  TextEditingController  imagenUrl= TextEditingController();

  OutlineInputBorder border = const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/background.jpg',fit: BoxFit.cover,)),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ColoredBox(color: Colors.white, child: SizedBox(height: 300,width: 250,),),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        controller: nombre,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Nombre dinosaurio',
                          hintStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        controller: periodo,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Periodo: ejemplo jurásico',
                          hintStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        controller: dieta,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Dieta: ejemplo carnívoro',
                          hintStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        controller: longitud,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Longitud: ejemplo 12',
                          hintStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        controller: peso,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'peso en kg: ejemplo 2000',
                          hintStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        controller: imagenUrl,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'URL imagen ejemplo: https://miimagen.com',
                          hintStyle: const TextStyle(color: Colors.white),
                          focusedBorder: border,
                          enabledBorder: border,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                     decoration: BoxDecoration(
                         color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                          height: 42,
                          width: 107,
                      child: RawMaterialButton(
                        onPressed: () {
                        },
                       child: const Text('Login',style: TextStyle(color: Colors.white),),
                     ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}