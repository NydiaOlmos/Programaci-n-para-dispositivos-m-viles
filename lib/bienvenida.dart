import 'package:flutter/material.dart';

class Bienvenida extends StatefulWidget {
  // const Bienvenida({super.key});
  // Recibimos el nombre del usuario del primer activity
  final String name;
  const Bienvenida(this.name, {super.key});

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 235, 245),
      appBar: AppBar(
        title: const Text("Bienvenida"),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Bienvenido:${widget.name}',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "rbold",
              ),
            ),
          ),
          SizedBox(
            width: 80, // ancho deseado
            height: 40, // alto deseado // alto deseado
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Color de fondo ámbar
                elevation: 5, // button elevation
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Esquinas cuadradas
                ),
              ),
              label: const Text(
                "Regresar",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // Regresamos a la página anterior
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.add_to_home_screen),
            ),
          ),
        ],
      )
    );
  }
}
