import 'package:VALTO/pages/splash_page.dart';
import 'package:VALTO/routes/routes.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

//import 'package:VALTO/pages/home.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}
class _MyApp extends   State<MyApp> {
  //const MyApp() : super(key: key);
   

   
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VÁLTÓ',

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:   const SplashScreen(),//const Home(),
      debugShowCheckedModeBanner: false ,
      routes:getAplicationRoutes(),
    );
  }
}

