import 'dart:io';
import 'package:VALTO/pages/terminos_condiciones_page.dart';
//import 'package:admob_flutter/admob_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:VALTO/pages/cromatic.dart';
import 'package:VALTO/pages/seleccion_sexo_page.dart';
import 'package:VALTO/storage/configuracion.dart';
import 'package:VALTO/storage/sqlite.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  //AdmobBannerSize? bannerSize;
  //late AdmobReward rewardAd;
  BannerAd? _bannerAd;
  //bool _isLoaded = false;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
    ? 'ca-app-pub-1637229802444039/3641901575'
    : 'ca-app-pub-3940256099942544/2934735716';

   @override
  initState()  {
    super.initState();
    catalogoSexo();
    insertUserIfNotExists();
    loadAd();
    // rewardAd = AdmobReward(
    //   adUnitId: getRewardBasedVideoAdUnitId()!,
    //   listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
    //     if (event == AdmobAdEvent.closed) rewardAd.load();
    //     //handleEvent(event, args, 'Reward');
    //   },
    // );
    // rewardAd.load();
   
   }
  @override


 Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: getColorCromaticScafold(), // Color sólido como fondo
      
      appBar: AppBar(backgroundColor:getColorCromatic() , elevation:0.0, actions:   <Widget>[
          
          // Container(
          //   margin: const EdgeInsets.only(right: 10.0),
          //   child:  CircleAvatar(
          //           // ignore: sort_child_properties_last
          //           child:  TextButton(
          //             child: Icon(Icons.account_circle,color: Colors.amber.shade50, size: 40.0,),
          //             onPressed:(){
          //               //final route = MaterialPageRoute(builder: (context)=>   const PerfilUsuarioPage());
          //                //Navigator.push(context, route);
          //             },),
          //           backgroundColor:getColorCromatic() ,
          //   ),
          // )
        ],
        ),
      body: Align(
      alignment: Alignment.topCenter,
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _logo(),
           const SizedBox(height: 16.0),
          _central(),
            const SizedBox(height: 20), // Espacio entre el botón y el espacio publicitario
            // Espacio para publicidad
          _listPublicidad()
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(), // Forma del AppBar inferior
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: <Widget>[
      //       IconButton(
      //         icon: Icon(Icons.settings),
      //         onPressed: () {
      //           borrarDatabase();
      //           catalogoSexo();
      //           insertUserIfNotExists();
      //         },
      //       ),
           
      //     ],
      //   ),
      // ),
      drawer: Drawer( // Define el Drawer lateral aquí
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: getColorCromatic() ,
              ),
              child: Text(
                'Menú Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                 final route = MaterialPageRoute(builder: (context)=>   const Home());
                          Navigator.push(context, route);// Acción al seleccionar "Inicio" en el menú
              },
            ),
            ListTile(
              leading: Icon(Icons.clear),
              title: Text('Limpiar cache'),
              onTap: () {
                // Acción al seleccionar "Configuración" en el menú
                borrarDatabase();
                catalogoSexo();
                insertUserIfNotExists();
              },
            ),
             ListTile(
              leading:  Icon(Icons.settings),
              title: Text('Términos y condiciones'),
              onTap: () {
                final route = MaterialPageRoute(builder: (context)=>   TerminosCondicionesPage());
                          Navigator.push(context, route);
              },
            ),
            // Agrega más elementos de menú aquí según tus necesidades
          ],
        ),
      ),
      
    );
  }


  _logo() {
    return Container(
         decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0.4,
                1.0,
              ],
              colors: [
                getColorCromatic(),
                 const Color.fromARGB(50, 5, 109, 206)//Color.fromARGB(255, 6, 24, 37),
              ]),
            color: getColorCromatic(),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50.0)
            ), 
           
        ),
                    margin: const EdgeInsets.all(.0),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 40.00,right: 75.0,left: 75.0),
                      child: const Image(image: AssetImage('assets/main_image.png')))
                      
                      )
       ;
  }
  _central(){
  //double screenWidth = MediaQuery.of(context).size.width;


                
          //       return Container(color: Color.fromARGB(255, 2, 39, 63), // Fondo
          //        child:ListTile(
          //   title: Text('Realizar consulta', style: TextStyle(color: Colors.white, fontSize:25.0 )), // Texto blanco),
          //   trailing: Container(
          //   margin: const EdgeInsets.only(right: 10.0,bottom:15.0),
          //   child:  CircleAvatar(
          //           // ignore: sort_child_properties_last
          //           child:  TextButton(
          //             child: Icon(Icons.add_comment_sharp,color: Colors.amber.shade50, size: 40.0,),
          //             onPressed:(){
          //               //final route = MaterialPageRoute(builder: (context)=>   const PerfilUsuarioPage());
          //                //Navigator.push(context, route);
          //             },),
          //           backgroundColor:getColorCromatic() ,
          //   ),
          // ), 
          //   onTap: () {
          //     // Navegar a la página seleccionSexoPage() cuando se toque el elemento
          //      final route = MaterialPageRoute(builder: (context)=> seleccionSexoPage());
          //                Navigator.push(context, route);
          //   },
          // ));
  return Container(
      margin: const EdgeInsets.only(bottom: 50.00,top: 25.0,right: 25.0,left: 25.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
        const SizedBox(height: 10.00,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
          
          const SizedBox(width: 50.00,),
          Expanded(
            child: TextButton(
                       onPressed: (){
                         // Navegar a la página seleccionSexoPage() cuando se toque el elemento
                          final route = MaterialPageRoute(builder: (context)=> seleccionSexoPage());
                          Navigator.push(context, route);
                       }, 
                       child: Column(children:  <Widget>[Icon(Icons.add_comment_sharp,size: 50.0,color:Colors.amber.shade50),Text('Realizar consulta',style: TextStyle(color:Colors.amber.shade50,fontSize: 25.0))],)),
          ),
          const SizedBox(width: 50.00,)
        ],),
    
      ],),
    );
}
  

  _listPublicidad(){
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
            child: ListView(
               scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                
               Container(
              width: screenWidth, 
              
              height: 200, // Alto del espacio publicitario
              decoration: BoxDecoration(
                //backgroundColor,
                color:Colors.transparent,// Colors.grey[200], // Color de fondo
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
              child:  Center(
                child:Align(
    alignment: Alignment.bottomCenter,
    child: SafeArea(
      child: SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    ),
  )//AdmobBanner(adUnitId:getBannerAdUnitId_1(), adSize: AdmobBannerSize.FULL_BANNER)
              ),
              
            ),
            //const SizedBox(height: 10),
              Container(
              //width: screenWidth, 
              height: 200, // Alto del espacio publicitario
              decoration: BoxDecoration(
                //color:Colors.transparent,// Colors.grey[200], // Color de fondo
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
              
              child:  Align(
    alignment: Alignment.bottomCenter,
    child: SafeArea(
      child: SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    ),
  )
            ),  // Agrega más elementos al ListView según tus necesidades
              ],
            ),
          );
  }
  void showSnackBar(String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }
  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            //_isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  // _listPublicidad(){
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   return Expanded(
  //           child: ListView(
  //              scrollDirection: Axis.horizontal,
  //             shrinkWrap: true,
  //             children: <Widget>[
                
  //              Container(
  //             width: screenWidth, 
              
  //             //height: 200, // Alto del espacio publicitario
  //             decoration: BoxDecoration(
  //               //backgroundColor,
  //               color:Colors.transparent,// Colors.grey[200], // Color de fondo
  //               borderRadius: BorderRadius.circular(10), // Bordes redondeados
  //             ),
  //             child:  Center(
  //               child:Image.network(
  //                 'https://i.imgur.com/ADuWsKv.png'
  //         ,
  //         //width: 200, // Tamaño de la imagen
  //         //height: 200,
  //         fit: BoxFit.cover, // Ajuste de la imagen
  //       ),
  //             ),
              
  //           ),
  //           const SizedBox(height: 10),
  //             Container(
  //             width: screenWidth, 
  //             //height: 200, // Alto del espacio publicitario
  //             decoration: BoxDecoration(
  //               color:Colors.transparent,// Colors.grey[200], // Color de fondo
  //               borderRadius: BorderRadius.circular(10), // Bordes redondeados
  //             ),
  //             child:  Center(
  //               child: Image.network(
  //         'https://media.tenor.com/Kp79NdDZsFYAAAAC/goodbye-august-hello-september-september.gif'
  //         ,
  //         //width: 200, // Tamaño de la imagen
  //         //height: 200,
  //         fit: BoxFit.cover, // Ajuste de la imagen
  //       ),
  //             ),
              
  //           ),  // Agrega más elementos al ListView según tus necesidades
  //             ],
  //           ),
  //         );
  // }

   
}

String getBannerAdUnitId_1() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-1637229802444039/3641901575';
  }
  return "";
}
String getBannerAdUnitId_2() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    //return 'ca-app-pub-3940256099942544/6300978111';
    return 'ca-app-pub-1637229802444039/3641901575';
  }
  return "";
}

String getInterstitialAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/4411468910';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-1637229802444039/3641901575';
  }
  return "";
}

String? getRewardBasedVideoAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/1712485313';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-1637229802444039/3641901575';
  }
  return null;
}