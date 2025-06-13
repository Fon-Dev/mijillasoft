// lib/main.dart
import 'package:flutter/material.dart';
import 'package:webmijillasoft/screens/portada_screen.dart';
import 'package:webmijillasoft/screens/proyectos_screen.dart'; // Importa la nueva pantalla
import 'package:webmijillasoft/screens/curriculum_screen.dart'; // Importa la nueva pantalla

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MijillaSoft',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const PortadaScreen(),
        '/proyectos':
            (context) => const ProyectosScreen(), // Ruta para Proyectos
        '/curriculum':
            (context) => const CurriculumScreen(), // Ruta para Curriculum
      },
    );
  }
}
