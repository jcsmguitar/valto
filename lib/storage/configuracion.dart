
import 'package:VALTO/providers/servicios.dart';
import 'package:VALTO/storage/sqlite.dart';
import 'package:VALTO/utils/utilitarios.dart';

import '../providers/gestorconfiguracion.dart';

Future <void> catalogoSexo()async {
  //verificamos si existe información en sqlite
  List<Map<String, dynamic>> sexo = await getSexo();
  if (sexo.isNotEmpty)
  {
    for (var element in sexo) {
      String imageUrl = recursos["imagenesserver"]! + element["Imagen"]; // Reemplaza con la URL de la imagen a descargar
      String imageassetPath = assetPath+element["Imagen"]; // Ruta del asset donde guardar la imagen

      bool imageExists = await assetExists(imageassetPath);
      if (!imageExists) {
        try {
          await downloadAndSaveImage(imageUrl, assetPath);
        } catch (e) {
          print('Error al descargar y guardar la imagen: $e');
        }
      } 
      bool sexoExists = await isSexoExistsInSQLite(element["IdSexo"]);
      
      if(!sexoExists)
      {
          insertSexo(element["IdSexo"], element["Nombre"], element["Imagen"]);
      }
      else{
        updateSexo(element["IdSexo"], element["Nombre"], element["Imagen"]);
      }
    }
  }
  else{
    List<dynamic> sexoBase = (await getCatalogoSexo()) as List<dynamic>;
    if(sexoBase.isNotEmpty)
    {
      for (var element in sexoBase) {
          String imageUrl = recursos["imagenesserver"]! + element["Imagen"]; // Reemplaza con la URL de la imagen a descargar
          String imageassetPath = assetPath+element["Imagen"]; // Ruta del asset donde guardar la imagen
          bool imageExists = await assetExists(imageassetPath);
          if (!imageExists) {
            try {
              await downloadAndSaveImage(imageUrl, assetPath);
            } catch (e) {
              print('Error al descargar y guardar la imagen: $e');
            }
          } 
          //insertSexo(element["IdSexo"], element["Nombre"], element["Imagen"]);
           bool sexoExists = await isSexoExistsInSQLite(element["IdSexo"]);
      
            if(!sexoExists)
            {
                insertSexo(element["IdSexo"], element["Nombre"], element["Imagen"]);
            }
            else{
              updateSexo(element["IdSexo"], element["Nombre"], element["Imagen"]);
            }
      }}
    
  }
}


