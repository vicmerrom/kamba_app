import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:mobx_prueba/services/class.dart';
import 'package:mobx_prueba/services/services.dart';
import 'package:postgres/postgres.dart';
import 'home_tareas.dart';
        
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController myControllerUser = TextEditingController();
  TextEditingController myControllerPass = TextEditingController();
  List<dynamic> listaUserAuth = [];
  
  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    myControllerUser.dispose();
    myControllerPass.dispose();
    super.dispose();
  }

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: FlatButton(
        onPressed: (){ },
        child:  CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 70.0,
          child: Image.asset('assets/logo.png',),
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: myControllerUser,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Usuario',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(25.7),
          ),
      ),
    );

    final password = TextFormField(
      controller: myControllerPass,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        filled: true,
        fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(25.7),
          ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () => logearUsuario(myControllerUser.text, myControllerPass.text),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Iniciar Sesión', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text('¿Has olvidado tu contraseña?',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 30.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 20.0),
              loginButton,
              forgotLabel
            ],
          ),
        ),
      ),
    );
  }

  String mainCrypto(String e) {
    var bytes = utf8.encode(e); // datos que están siendo procesados
    var digest = md5.convert(bytes);
    return "$digest";
  }



  void logearUsuario(usuario, password) async {
    consultaUsuarios(password).then((res) {
      for (var item in res) {
        if (res.length > 0) {
          item.contrasena == password 
          ? Navigator.push(context, MaterialPageRoute(builder: (context) => HomeTareasPage(res)))
          : EdgeAlert.show(context, title: 'Incorrecto', description: 'Nombre de usuario o contraseña incorrecta.', backgroundColor: Colors.red, duration: 2, icon: Icons.warning, gravity: EdgeAlert.TOP);  
        } else {
          EdgeAlert.show(context, title: 'Error', description: 'No se ha podido establecer conexion con el servidor.', backgroundColor: Colors.red, duration: 2, icon: Icons.error, gravity: EdgeAlert.TOP);
        }
      }
    });
  }

    //for (var i = 0; i < listaUserAuth.length; i++) {
         
    //} 
  //}


}//