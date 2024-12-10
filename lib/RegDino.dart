import 'package:audioplayers/audioplayers.dart';
import 'package:dinosaurs/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';

class RegDino extends StatefulWidget {
  const RegDino({super.key});

  @override
  State<RegDino> createState() => _RegDinoState();
}

class _RegDinoState extends State<RegDino> {
  
  TextEditingController nombre = TextEditingController();
  TextEditingController periodo = TextEditingController();
  TextEditingController dieta= TextEditingController();
  TextEditingController longitud= TextEditingController();
  TextEditingController peso= TextEditingController();
  TextEditingController imagenUrl= TextEditingController();

  OutlineInputBorder border = const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register New Dinosaur'),
        leading: IconButton(onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false,
                  );
                }, 
          icon: const Icon(Icons.logout)),
          backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/background.jpg',fit: BoxFit.cover,)),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: imagenUrl.text.isNotEmpty
                    ? Image.network(
                      imagenUrl.text,
                      width: 230,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/claw.png', width: 230, height: 200);
                      },
                    )
                  : Image.asset('assets/claw.png', width: 230, height: 200),
            ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: imagenUrl,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'URL imagen ejemplo: https://miimagen.com',
                        hintStyle: const TextStyle(color: Colors.white),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: nombre,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
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
                      style: const TextStyle(color: Colors.white),
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
                      style: const TextStyle(color: Colors.white),
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
                      style: const TextStyle(color: Colors.white),
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
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'peso en kg: ejemplo 2000',
                        hintStyle: const TextStyle(color: Colors.white),
                        focusedBorder: border,
                        enabledBorder: border
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
                      onPressed: () async{
                        FocusScope.of(context).unfocus();
                        final response = await http.post(
                          Uri.parse('http://10.100.0.222/proyects/dinosaurs/regdinos.php'),
                          body: {
                            'nombre': nombre.text,
                            'periodo': periodo.text,
                            'dieta': dieta.text,
                            'longitud': longitud.text,
                            'peso': peso.text,
                            'imagenurl': imagenUrl.text,
                          },
                        );
                        if (response.statusCode == 200) {
                          setState(() {});
                          nombre.clear();
                          periodo.clear();
                          dieta.clear();
                          longitud.clear();
                          peso.clear();
                          imagenUrl.clear();
                          AudioPlayer().play(AssetSource('dinobird.mp3'),volume: 0.8);
                          QuickAlert.show(
                          context: context,
                          title: 'Error',
                          text: "Dinosaurio Registrado",
                          type: QuickAlertType.success,
                        );
                        } else {
                          QuickAlert.show(
                          context: context,
                          title: 'Error',
                          text: "Dinosaurio No Registrado",
                          type: QuickAlertType.error,
                        );
                        }
                      },
                     child: const Text('Registrar',style: TextStyle(color: Colors.white),),
                   ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}