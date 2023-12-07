
import 'package:flutter/material.dart';
import 'package:VALTO/pages/cromatic.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
        backgroundColor:getColorCromatic()
      ),
       
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Nombre de usuario',
                focusColor: getColorCromatic()
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                focusColor: getColorCromatic(),
                
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: getColorCromatic(), // Cambiar el color de fondo aquí
              ), 
              onPressed: () {
                // Lógica para iniciar sesión
                // String username = _usernameController.text;
                // String password = _passwordController.text;
                // Puedes agregar aquí la lógica para autenticar al usuario
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}