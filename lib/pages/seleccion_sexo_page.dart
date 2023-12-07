
import 'package:flutter/material.dart';
import 'package:VALTO/pages/cromatic.dart';
import 'package:VALTO/pages/formulario_consulta_page.dart';
import 'package:VALTO/storage/sqlite.dart';

import '../components/ComicLebelSeleccion.dart';

class seleccionSexoPage extends StatefulWidget {
  seleccionSexoPage({Key? key}) : super(key: key);

  @override
  State<seleccionSexoPage> createState() => _seleccionSexoPageState();
}

class _seleccionSexoPageState extends State<seleccionSexoPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: getColorCromaticScafold(), // Color sólido como fondo
      appBar: AppBar(
        title: Text("Seleccione"),
        backgroundColor:getColorCromatic() , elevation:0.0
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getSexo(),
        builder:  (context, snapshot) {
          List<Map<String, dynamic>>? datos = snapshot.data;
          return  _obtenerSexo(datos) ;
        },
      ),
     
      );
    
  }
  
   Widget _obtenerSexo(List<Map<String, dynamic>>? listaSexo)  {
    List<Widget> objRetorno =[];
     if( listaSexo != null && listaSexo.isNotEmpty) {
      for (var element in listaSexo) { 
        String image= 'assets/${element["Imagen"]}';
        objRetorno.add(
            SizedBox(
                //width: MediaQuery.of(context).size.width - 2 * 16.0, // Tamaño específico para el botón
                //height: 150,
                child: ComicLabelSeleccion(text: element["Nombre"], avatarImage: image, onTap: (){

                    insertSexoPerfil(element["IdSexo"]);
                    final route = MaterialPageRoute(builder: (context)=> FormularioConsultaPage());
                    Navigator.push(context, route);
                  },
                  transparente: "SI"                  ,bold: false, fontSize: 24,textoblanco: true
                  ),
              ),
        );
        objRetorno.add(const SizedBox(height: 16));
      }
     }
     
     return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center (
            child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Centrar horizontalmente
            mainAxisAlignment: MainAxisAlignment.center,
            children: objRetorno
          ),
        ));
        
       
  }
}
