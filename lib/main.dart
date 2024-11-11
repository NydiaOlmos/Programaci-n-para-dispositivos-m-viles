import 'package:flutter/material.dart';
import 'bienvenida.dart';

void main() {
  runApp(const Primera());
}

class Primera extends StatelessWidget {
  const Primera({super.key});

  // Metodo que cosntruye los widgets de la app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Multiformularios",
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        home: const Pantalla());
  }
}

class Pantalla extends StatefulWidget {
  const Pantalla({super.key});

  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  // Controladores de los campos de texto
  var txtLogin = TextEditingController();
  var txtPassword = TextEditingController();
  // Variables para almacenar los datos ingresados por el usuario
  var nombre = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/fondo.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Multiformularios"),
        ),
        body: ListView(
          // add some widgets
          children: [
            // Agregamos el logo
            Container(
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
              alignment: Alignment.center,
              child: Image.asset("img/UDC.png"),
            ),
            // Agregamos el campo de texto para el Login
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Usuario",
                  hintText: "Ingrese su usuario",
                  icon: Icon(Icons.person),
                ),
                // Id del usuario
                controller: txtLogin,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: "Constraseña",
                  hintText: "Ingrese su constraseña",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                // Id de la contraseña
                controller: txtPassword,
              ),
            ),
            // Agregamos el botón
            Container(
              padding: const EdgeInsets.all(25),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Acción del botón
                  // Leer el contenido de los campos de texto
                  nombre = txtLogin.text;
                  password = txtPassword.text;
      
                  // Validar los datos
                  if (nombre == "admin" && password == "1234") {
                    // Salta al siguiente formulario
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context){
                          // Llamamos al constructor y pasamos el dato
                          return Bienvenida(nombre);
                        }
                      )
                    );
                  } else {
                    // Mostrar un mensaje
                    showDialog(
                      context: context, 
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return  AlertDialog(
                          title: const Text("Error"),
                          content: const SingleChildScrollView(
                            child: ListBody(
                                children: [
                                  Text("Usuario o contraseña incorrectos"),
                                ],
                            ),
                          ),
                          // Botones del AlertDialog
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              }, 
                              child: const Text("Aceptar"),)
                          ],
                        );
                      }
                    ); // showDialog
                  }
                },
                label: const Text("Validar"),
                icon: const Icon(Icons.login),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
