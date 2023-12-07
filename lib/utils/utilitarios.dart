import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


Future<bool> assetExists(String assetPath) async {
  try {
    // Intenta cargar la imagen como un asset
    await rootBundle.load(assetPath);
    return true; // Si no lanza una excepción, la imagen existe
  } catch (_) {
    return false; // Si ocurre una excepción, la imagen no existe
  }
}

Future<void> downloadAndSaveImage(String url, String assetPath) async {
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    // Guardar la imagen descargada en tus assets
    File file = File(assetPath);
    await file.writeAsBytes(response.bodyBytes);
  } else {
    throw Exception('Error al descargar la imagen');
  }
}