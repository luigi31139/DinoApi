import 'dart:convert';

Dinosaurio dinosaurioFromJson(String str) => Dinosaurio.fromJson(json.decode(str));

String dinosaurioToJson(Dinosaurio data) => json.encode(data.toJson());

class Dinosaurio {
    final String id;
    final String nombre;
    final String periodo;
    final String dieta;
    final String longitudMetros;
    final String pesoKg;
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
        longitudMetros: json["longitud_metros"],
        pesoKg: json["peso_kg"],
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
