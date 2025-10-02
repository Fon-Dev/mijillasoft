import 'package:flutter/material.dart';

import 'package:webmijillasoft/screens/portada_screen.dart'; // Importa las distintas pantallas
import 'package:webmijillasoft/screens/proyectos_screen.dart';
import 'package:webmijillasoft/screens/curriculum_screen.dart';
import 'package:webmijillasoft/screens/ProyectoIGA.dart';
import 'package:webmijillasoft/screens/ProyectoGeoffrey.dart';
import 'package:webmijillasoft/screens/ProyectoKitt.dart';
import 'package:webmijillasoft/screens/ProyectoEduprimari.dart';
import 'package:webmijillasoft/screens/ProyectoValdi.dart';

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

      initialRoute: '/',
      routes: {
        '/':
            (context) =>
                const PortadaScreen(), // Ruta para la pantalla principal
        '/proyectos':
            (context) => const ProyectosScreen(), // Ruta para Proyectos
        '/curriculum':
            (context) => const CurriculumScreen(), // Ruta para Curriculum
        //------------------------ Rutas a los distintos proyectos--------------------
        '/proyecto-iga': (context) => const ProyectoIGA(),
        '/proyecto-geoffrey': (context) => const ProyectoGeoffrey(),
        '/proyecto-kitt': (context) => const ProyectoKitt(),
        '/proyecto-eduprimari': (context) => const ProyectoEduprimari(),
        '/proyecto-valdi': (context) => const ProyectoValdi(),
      },
    );
  }
}
