import 'package:audioplayers/audioplayers.dart';
import 'package:dinosaurs/list.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

    final trazo = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.green),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 180),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/dino.png',width: 200,height: 200,),
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: username,
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    border: trazo,
                    hintText: 'Nombre Usuario',
                    prefixIcon: const Icon(Icons.person)
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: password,
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    border: trazo,
                    hintText: 'Contraseña',
                    prefixIcon: const Icon(Icons.person)
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF58138D),
                      borderRadius: BorderRadius.circular(10)),
                  height: 42,
                  width: 107,
                  child: RawMaterialButton(
                    onPressed: () {
                      if (username.text == 'luis' &&
                          password.text == 'angel') {
                          username.clear();
                          password.clear();
                          AudioPlayer().play(AssetSource('turtle.mp3'));
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => const DinoList())));
                      } else {
                        username.clear();
                        password.clear();
                        QuickAlert.show(
                          context: context,
                          title: 'Error',
                          text: "Usuario o contraseña incorrecta",
                          type: QuickAlertType.error,
                        );
                      }
                    },
                    child: const Text('Login',style: TextStyle(color: Colors.white),),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}