//import 'dart:js_interop';

import 'dart:io';

import 'package:VALTO/pages/terminos_condiciones_page.dart';
import 'package:VALTO/providers/gestorconsulta.dart';
//import 'package:admob_flutter/admob_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:VALTO/pages/cromatic.dart';
import 'package:VALTO/storage/sqlite.dart';
import 'package:flutter_html/flutter_html.dart';
import '../components/CommicLebel.dart';

class FormularioConsultaPage extends StatefulWidget {
  @override
  _FormularioConsultaPageState createState() => _FormularioConsultaPageState();
}

class _FormularioConsultaPageState extends State<FormularioConsultaPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //late AdmobInterstitial  interstitialAd;
  InterstitialAd? _interstitialAd;
  String? _email;
  String? _title;
  String? _text;
  int _idperfil = 0;
  //List<PlatformFile>? _attachments;
  bool _terminosycondiciones=false;
//InterstitialAd? _interstitialAd;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
    ? 'ca-app-pub-3940256099942544/1033173712'
    : 'ca-app-pub-3940256099942544/4411468910';



 @override
  initState(){
    super.initState();
    _obtenerPerfil();
    // interstitialAd=AdmobInterstitial(
    //   adUnitId: 'ca-app-pub-3940256099942544/1033173712',
    //   listener: ( event ,  args){
    //       if(event == AdmobAdEvent.closed)
    //       {
    //          Map<String, dynamic> jsonData = {
    //                           'key': 'value1',
    //                           'email': _email,
    //                            'asunto': _title,
    //                            'mensaje': _text,
    //                            'IdAvatar':_idperfil
    //                           // Agrega más datos según sea necesario
    //                       };
    //                       setProcesarConsulta(jsonData);
    //                       Navigator.of(context).pop();
    //                       Navigator.pushNamedAndRemoveUntil(context, 'gracias', (route) => false);  
    //         interstitialAd.load();
    //       }
    //   });
    //   //interstitialAd.load();

    //   _interstitiaAd.show();
    loadAd();
  }

void _submitForm() async{
    if (_formKey.currentState!.validate()) {
      
      if(_terminosycondiciones)
      {
          _formKey.currentState!.save();
          //bool s = await interstitialAd.isLoaded==null?false:true;
          //if(s)
          //{
           _interstitialAd?.show();
          //}
        // Aquí puedes realizar las acciones con los datos ingresados en el formulario,
        // como guardar en una base de datos, enviar a un servidor, etc.
        print('Mail: $_title');
        print('Título: $_title');
        print('Texto: $_text');
        print('Texto: $_email');
     
    }
    else{
              showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error de Envío'),
                            content: const Text('Debes aceptar los términos y condiciones antes de enviar.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child:const Text('Cerrar'),
                              ),
                            ],
                          );
                            },
                      );
      }
    }
    
  }
  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
      
  //     if(_terminosycondiciones)
  //     {
  //         _formKey.currentState!.save();
  //         showDialog(
  //               context: context,
  //               builder: (BuildContext context) {
  //                 return AlertDialog(
  //                   title: const Text('Publicidad'),
  //                   content: const Column(
  //                     children: [
  //                       Text('¡Aprovecha nuestras ofertas especiales!'),
  //                       SizedBox(height: 16),
  //                       // Aquí puedes colocar la publicidad, como una imagen o un anuncio
  //                       //Image.asset('assets/advertisement.png'), // Ruta de la imagen de la publicidad
  //                     ],
  //                   ),
  //                   actions: [
  //                     TextButton(
  //                       onPressed: () {
  //                         // Cerrar el diálogo cuando se toca "Cerrar"
  //                         Map<String, dynamic> jsonData = {
  //                             'key': 'value1',
  //                             'email': _email,
  //                              'asunto': _title,
  //                              'mensaje': _text,
  //                              'IdAvatar':_idperfil
  //                             // Agrega más datos según sea necesario
  //                         };
  //                         setProcesarConsulta(jsonData);
  //                         Navigator.of(context).pop();
  //                         Navigator.pushNamedAndRemoveUntil(context, 'gracias', (route) => false);
  //                       },
  //                       child: Text('Cerrar'),
  //                     ),
  //                   ],
  //                 );
  //               },
  //             );

  //     // Aquí puedes realizar las acciones con los datos ingresados en el formulario,
  //     // como guardar en una base de datos, enviar a un servidor, etc.
  //     print('Mail: $_title');
  //     print('Título: $_title');
  //     print('Texto: $_text');
  //     //print('Archivos adjuntos: $_attachments');
  //   }
  //   else{
  //             showDialog(
  //                       context: context,
  //                       builder: (context) {
  //                         return AlertDialog(
  //                           title: const Text('Error de Envío'),
  //                           content: const Text('Debes aceptar los términos y condiciones antes de enviar.'),
  //                           actions: <Widget>[
  //                             TextButton(
  //                               onPressed: () {
  //                                 Navigator.of(context).pop();
  //                               },
  //                               child:const Text('Cerrar'),
  //                             ),
  //                           ],
  //                         );
  //                           },
  //                     );
  //     }
  //   }
    
  // }

  @override
  Widget build(BuildContext context) {
     const htmlContent = """
    <div style="text-align: justify; color:white; font-size:18px; padding: 20px ;
            background-color: #02273F;">
      Ayúdanos a financiar nuestra app, la respuesta a tu consulta es GRATUITA, a cambio solicitamos visualices la publicidad.
    </div>
    """;
    return Scaffold(
      backgroundColor:  getColorCromaticScafold(), // Color sólido como fondo
      appBar: AppBar(
        title: const Text('Realiza tu consulta'),
        backgroundColor:getColorCromatic()
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(

          child:  Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder<List<Map<String, dynamic>>>(
              future: getSexo(),
              builder:  (context, snapshot) {
                  List<Map<String, dynamic>>? datos = snapshot.data;
              return  _obtenerSexo(datos) ;
              },),
              TextFormField(
                style: TextStyle(fontSize: 16.0), // Estilo del texto
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Espacio interior
                  hintText: 'Ingrese e-mail..', // Texto de sugerencia
                  hintStyle: TextStyle(color: Colors.grey), // Estilo del texto de sugerencia
                  filled: true, // Relleno del campo de texto
                  fillColor: Color(0xFFECEFF1), // Color de fondo
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0), // Borde exterior
                    borderSide: BorderSide.none, // Sin borde
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0), // Borde exterior cuando está enfocado
                    borderSide: BorderSide.none, // Sin borde
                  ),
                   errorBorder: OutlineInputBorder( // Borde cuando hay un error
                      borderSide: BorderSide(color: Colors.red), // Color de borde de error
                      borderRadius: BorderRadius.circular(24.0), // Borde exterior cuando está enfocado
                    
                    ),
                    focusedErrorBorder: OutlineInputBorder( // Borde enfocado con error
                      borderSide: BorderSide(color: Colors.red), // Color de borde de error
                      borderRadius: BorderRadius.circular(24.0), // Borde exterior cuando está enfocado
                    ),
                  suffixIcon: Icon(Icons.mail), // Icono en el lado derecho
                  errorStyle: TextStyle(color: Colors.white),// Icono en el lado derecho
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                      return 'Por favor, ingrese su correo electrónico.';
                    }
                    // Expresión regular para validar un formato de correo electrónico
                    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
                    RegExp regex = RegExp(emailPattern);
                    if (!regex.hasMatch(value)) {
                      return 'Por favor, ingrese un correo electrónico válido.';
                    }
                    return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
               style: TextStyle(fontSize: 16.0), // Estilo del texto
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Espacio interior
                  hintText: 'Ingrese asunto..', // Texto de sugerencia
                  hintStyle: TextStyle(color: Colors.grey), // Estilo del texto de sugerencia
                  filled: true, // Relleno del campo de texto
                  fillColor: Color(0xFFECEFF1), // Color de fondo
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0), // Borde exterior
                    borderSide: BorderSide.none, // Sin borde
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0), // Borde exterior cuando está enfocado
                    borderSide: BorderSide.none, // Sin borde
                  ),
                   errorBorder: OutlineInputBorder( // Borde cuando hay un error
                      borderSide: BorderSide(color: Colors.red), // Color de borde de error
                      borderRadius: BorderRadius.circular(24.0), // Borde exterior cuando está enfocado
                    
                    ),
                    focusedErrorBorder: OutlineInputBorder( // Borde enfocado con error
                      borderSide: BorderSide(color: Colors.red), // Color de borde de error
                      borderRadius: BorderRadius.circular(24.0), // Borde exterior cuando está enfocado
                    ),
                  suffixIcon: Icon(Icons.title), 
                  errorStyle: TextStyle(color: Colors.white),// Icono en el lado derecho
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un asunto';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                style: TextStyle(fontSize: 16.0), // Estilo del texto
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Espacio interior
                  hintText: 'Ingrese su consulta..', // Texto de sugerencia
                  hintStyle: TextStyle(color: Colors.grey), // Estilo del texto de sugerencia
                  filled: true, // Relleno del campo de texto
                  fillColor: Color(0xFFECEFF1), // Color de fondo
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0), // Borde exterior
                    borderSide: BorderSide.none, // Sin borde
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0), // Borde exterior cuando está enfocado
                    borderSide: BorderSide.none, // Sin borde
                  ),
                  errorBorder: OutlineInputBorder( // Borde cuando hay un error
                      borderSide: BorderSide(color: Colors.red), // Color de borde de error
                      borderRadius: BorderRadius.circular(24.0), // Borde exterior cuando está enfocado
                    
                    ),
                    focusedErrorBorder: OutlineInputBorder( // Borde enfocado con error
                      borderSide: BorderSide(color: Colors.red), // Color de borde de error
                      borderRadius: BorderRadius.circular(24.0), // Borde exterior cuando está enfocado
                    ),
                  suffixIcon: Icon(Icons.message_sharp), 
                  errorStyle: TextStyle(color: Colors.white),// Icono en el lado derecho// Icono en el lado derecho
                ),
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un texto';
                  }
                  return null;
                },
                onSaved: (value) {
                  _text = value;
                },
              ),
           
              // if (_attachments != null && _attachments!.isNotEmpty)
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: _attachments!.map((file) {
              //       return Text(file.name);
              //     }).toList(),
              //   ),
             const SizedBox(height: 45.0),
             Center(
        child: Html(
          data: htmlContent,
        ),),
            //  const Center(child:Text(
            //         'Ayúdanos a financiar nuestra app, la respuesta a tu consulta es GRATUITA, a cambio solicitamos visualices la publicidad.',
            //         style: TextStyle(
            //           fontSize: 16,
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //           fontStyle: FontStyle.italic,
                      
                      
            //         ),
            //       ))  ,
                  const SizedBox(height: 45.0),
                  _crearAceptarTerminosyCondiciones(),
                  _crearTerminosyCondiciones(context),

             const SizedBox(height: 45.0),
              ElevatedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue), // Color de fondo del botón
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Esquinas más circulares
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(200, 50)), // Tamaño mínimo del botón
                ),
                child: const Text(
                  'Enviar consulta',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Estilo del texto del botón
                ),
              )
            ],
          ),
        ),
        )
        
        
      ),
    );
  }
  
  Widget _obtenerSexo(List<Map<String, dynamic>>? listaSexo)   {
    List<Widget> objRetorno =[];
     if( listaSexo != null && listaSexo.isNotEmpty) {
      for (var element in listaSexo) { 
        String image= 'assets/${element["Imagen"]}';
        if(_idperfil==element["IdSexo"] )
        {
           objRetorno.add(
            SizedBox(
                width: double.infinity, // Tamaño específico para el botón
                height: 150,
                child: ComicLabel( text:"Hola puedes realizar tu consulta, estamos gustosos de ayudarte",avatarImage: image,onTap:() {}, transparente: "No",bold: false, fontSize: 16,textoblanco: false),//const Text("Hola puedes realizar tu consulta, estamos gustosos de ayudarte"),
              ),
        );
        objRetorno.add(const SizedBox(height: 16));   
        }
      }
     }
     return  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: objRetorno
          ),
        );
  }

  
 Widget _crearTerminosyCondiciones(BuildContext context) {
  return  TextButton(
    child: const Text('VER TERMINOS Y CONDICIONES', style: TextStyle(fontSize: 18, color: Colors.amber)),
    onPressed: () {
      final route = MaterialPageRoute(builder: (context)=> TerminosCondicionesPage());
                         Navigator.push(context, route);
    },
  );
 }
 
 Widget _crearAceptarTerminosyCondiciones() {
   return  ListTile(title: TextButton(child: const Text('ACEPTAR TERMINOS Y CONDICIONES',style: TextStyle(fontSize: 14, color: Colors.white)),
                        onPressed:(){
              
          }), trailing:  _crearCheckTerminosyCondiciones()   );
 }

 Widget _crearCheckTerminosyCondiciones() {
   return  Checkbox(
                          value: _terminosycondiciones,
                          onChanged: ( value) {
                            setState((){
                              _terminosycondiciones = value!;
                              
                            });
                          },
                        ); //Checkbox;
 }
 
  Future<void> _obtenerPerfil()
  async {
    List<Map<String, dynamic>> perfil = await  getPerfil();
    _idperfil = perfil[0]["IdSexo"] as int;
  }
  
  void loadAd() {
    InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {},
                // Called when an impression occurs on the ad.
                onAdImpression: (ad) {},
                // Called when the ad failed to show full screen content.
                onAdFailedToShowFullScreenContent: (ad, err) {
                  // Dispose the ad here to free resources.
                  ad.dispose();
                },
                // Called when the ad dismissed full screen content.
                onAdDismissedFullScreenContent: (ad) {

                  

              Map<String, dynamic> jsonData = {
                              'key': 'value1',
                              'email': _email,
                               'asunto': _title,
                               'mensaje': _text,
                               'IdAvatar':_idperfil
                              // Agrega más datos según sea necesario
                          };
                          setProcesarConsulta(jsonData);
                          Navigator.of(context).pop();
                          Navigator.pushNamedAndRemoveUntil(context, 'gracias', (route) => false);  
                  // Dispose the ad here to free resources.
                  ad.dispose();
                },
                // Called when a click is recorded for an ad.
                onAdClicked: (ad) {});
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }
}

/*
class ComicLabelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white // Color del fondo del globo de texto
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - 20, 0) // Flecha del globo de texto
      ..lineTo(size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}*/