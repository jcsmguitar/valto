import 'package:flutter/material.dart';


class ComicLabel extends StatelessWidget {
  final String text;
  final String avatarImage; // Ruta de la imagen de avatar
  final VoidCallback onTap; // Función a ejecutar cuando se toque
  final String transparente;
  final bool bold;
  final bool textoblanco;
  final double  fontSize;
  ComicLabel({required this.text, required this.avatarImage, required this.onTap, required this.transparente,required this.bold,required this.textoblanco,required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Asigna la función onTap al GestureDetector
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),//EdgeInsets.only(right: 8.0), // Espacio entre la imagen y el texto
            child: CircleAvatar(
              backgroundImage: AssetImage(avatarImage), // Imagen de avatar
              radius: 60, // Tamaño del avatar
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(16.0), // Ajusta el espacio interior
              decoration: BoxDecoration(
                color: (transparente=="SI") ?  Colors.transparent: Colors.amber.shade100, // Color del fondo del globo de texto
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
              ),
              
              child: Text(
                text,
                style: TextStyle(color: textoblanco?Colors.white : Colors.black, fontSize: fontSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}