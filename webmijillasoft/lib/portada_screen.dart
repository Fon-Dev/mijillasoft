// lib/portada_screen.dart
import 'package:flutter/material.dart';

class PortadaScreen extends StatelessWidget {
  const PortadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = kToolbarHeight * 2;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        title: const Text(''), // El título sigue vacío
        // Eliminamos backgroundColor para que el flexibleSpace controle el fondo
        // backgroundColor: Color.fromRGBO(184, 212, 166, 0.83),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color inicial (el original, ajustado a opacidad 1.0 si quieres)
                Color.fromRGBO(184, 212, 166, 1.0),
                // Color final (un verde más oscuro, puedes ajustarlo)
                Color.fromRGBO(156, 98, 173, 1),
                // Puedes añadir más colores si quieres
              ],
              begin: Alignment.topLeft, // Inicio del degradado
              end: Alignment.bottomRight, // Fin del degradado
              // stops: [0.0, 1.0], // Opcional: puntos de parada para los colores
            ),
          ),
          // Colocamos la imagen como hijo del Container con degradado
          // Puedes ajustar el alignment o padding si es necesario
          child: Align(
            alignment:
                Alignment.center, // Centra la imagen en el espacio flexible
            child: Padding(
              padding: const EdgeInsets.only(
                top: kToolbarHeight * 0.2,
              ), // Ajusta el padding superior si es necesario
              child: Image.asset(
                "assets/images/logonombre.png",
                fit: BoxFit.contain, // Ajusta cómo se muestra la imagen
                // Podrías querer limitar la altura de la imagen también
                // height: kToolbarHeight * 0.8,
              ),
            ),
          ),
        ),

        actions: <Widget>[
          // Botón de menú (sin cambios)
          PopupMenuButton<String>(
            onSelected: (value) {
              // Aquí iría la lógica para cada opción seleccionada
              print('Opción seleccionada: $value');
            },
            itemBuilder:
                (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'opcion1', // Asigna un valor a cada opción
                    child: Text('Opción 1'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'opcion2',
                    child: Text('Opción 2'),
                  ),
                ],
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.home, // Un icono de ejemplo
              size: 100.0,
              color: Color.fromRGBO(184, 212, 166, 0.83),
            ),
            SizedBox(height: 20),
            Text(
              '¡Bienvenido!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Esta es la pantalla de portada.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
