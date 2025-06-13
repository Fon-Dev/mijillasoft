import 'package:flutter/material.dart';
import 'portada_screen.dart'; // 1. Importa tu nueva pantalla

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MijillaSoft',
      theme: ThemeData(
        primarySwatch: Colors.blue, // O el color primario que prefieras
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 2. Establece PortadaScreen como la pantalla de inicio
      home: const PortadaScreen(),
      debugShowCheckedModeBanner:
          false, // Opcional: para quitar el banner de debug
    );
  }
}
