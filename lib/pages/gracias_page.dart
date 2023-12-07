import 'package:flutter/material.dart';
import 'package:VALTO/pages/cromatic.dart';
import 'package:VALTO/pages/home.dart';
class GraciasScreen extends StatelessWidget {
  const GraciasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  getColorCromaticScafold(), // Color sólido como fondo
      /*
      appBar: AppBar(
        title: const Text('Gracias'),
        backgroundColor:getColorCromatic()
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             const Icon(
                    Icons.check_circle, // Ícono de marca de verificación (puedes cambiarlo)
                    color: Colors.green, // Color del ícono
                    size: 64.0, // Tamaño del ícono
                  ),
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 const SizedBox(width: 8.0), // Espacio entre el ícono y el texto
                  const Text(
                    '¡Gracias por enviarnos tu consulta!',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      
                    ),
                  ),
                  const SizedBox(height: 16.0), // Espacio entre el ícono y el texto
                  const Text(
                    'Responderemos lo más pronto posible, por favor debes estar atento a tu correo electrónico!',
                    
                    textAlign: TextAlign.center, // Texto centrado
                    
                    style: TextStyle(
                      color: Colors.white,
                    fontSize: 20,  
                    ),
                  ),
                   
                ],
              ),
            ),
            const SizedBox(height: 16.0),
           ElevatedButton(
                 onPressed: () {
                          // Cerrar el diálogo cuando se toca "Cerrar"
                          Navigator.of(context).pop();
                          final route = MaterialPageRoute(builder: (context)=>   const Home());
                          Navigator.push(context, route);
                          
                        },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue), // Color de fondo del botón
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Esquinas más circulares
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(200, 50)), // Tamaño mínimo del botón
                ),
                child: const Text(
                  'Volver',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Estilo del texto del botón
                ),
              )
          ],
        ),
      ),
    );
  }
}