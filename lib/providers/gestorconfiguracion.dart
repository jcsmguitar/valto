import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:VALTO/providers/servicios.dart';

Future<List<dynamic>> getCatalogoSexo() async {
  final url = servicios['consultasexo'];
  try {
    final response = await http.post(Uri.parse(url!));

    if (response.statusCode == 200) {
      // La solicitud fue exitosa, retorna el identificador único
      List<dynamic> responseData = json.decode(response.body);
      return responseData ;
    } else {
      // La solicitud no fue exitosa, manejar el error aquí
      print('Error: ${response.statusCode}');
      throw Exception('Error al obtener el identificador único');
    }
  } catch (e) {
    // Hubo un error al realizar la solicitud
    print('Error: $e');
    throw Exception('Error al obtener el identificador único');
  }
}

