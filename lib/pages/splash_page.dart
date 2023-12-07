import 'dart:async';

//import 'package:VALTO/pages/cromatic.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:VALTO/pages/home.dart';
import 'package:flutter/material.dart';
//import 'package:VALTO/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

   late AnimationController animationController;
   late Animation<double> animation;

  startTime() async  {
    var duration =  const Duration(seconds: 2);
    return  Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    /*final route = MaterialPageRoute(builder: (context)=>   const Home());
                          Navigator.push(context, route);*/
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }
  @override
  void dispose() {
    animationController.dispose(); // Detener y liberar el Ticker
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 2, 39, 63),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Image.asset(
                'assets/icon/icon.png',
                width: animation.value * 200,
                height: animation.value * 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}