import 'package:flutter/material.dart';
class ComicLabelSeleccion extends StatelessWidget {
  final String text;
  final String avatarImage; // Ruta de la imagen de avatar
  final VoidCallback onTap; // Función a ejecutar cuando se toque
  final String transparente;
  final bool bold;
  final bool textoblanco;
  final double  fontSize;
  ComicLabelSeleccion({required this.text, required this.avatarImage, required this.onTap, required this.transparente,required this.bold,required this.textoblanco,required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Asigna la función onTap al GestureDetector
      child:
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
CircleAvatar(
              backgroundImage: AssetImage(avatarImage), // Imagen de avatar
              radius: 60, // Tamaño del avatar
            ),
Text(
                text,
                style: TextStyle(color: textoblanco?Colors.white : Colors.black, fontSize: fontSize),
              )
          ],)
          
        ],
      ),
    );
  }
}