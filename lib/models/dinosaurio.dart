import 'dart:convert';

Dinosaurio dinosaurioFromJson(String str) => Dinosaurio.fromJson(json.decode(str));

String dinosaurioToJson(Dinosaurio data) => json.encode(data.toJson());

class Dinosaurio {
    final int id;
    final String nombre;
    final String periodo;
    final String dieta;
    final double longitudMetros;
    final double pesoKg;
    final String imagenUrl;

    Dinosaurio({
        required this.id,
        required this.nombre,
        required this.periodo,
        required this.dieta,
        required this.longitudMetros,
        required this.pesoKg,
        required this.imagenUrl,
    });

    factory Dinosaurio.fromJson(Map<String, dynamic> json) => Dinosaurio(
        id: json["id"],
        nombre: json["nombre"],
        periodo: json["periodo"],
        dieta: json["dieta"],
        longitudMetros: json["longitud_metros"]?.toDouble(),
        pesoKg: json["peso_kg"]?.toDouble(),
        imagenUrl: json["imagen_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "periodo": periodo,
        "dieta": dieta,
        "longitud_metros": longitudMetros,
        "peso_kg": pesoKg,
        "imagen_url": imagenUrl,
    };
}
