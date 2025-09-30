import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importa el paquete

class MijillaSoftFooter extends StatelessWidget {
  const MijillaSoftFooter({super.key});

  // Define la URL que quieres abrir
  final String _url = 'https://flutter.dev'; // <-- Cambia esto por tu URL

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(146, 148, 144, 1),
      elevation: 8.0,
      child: SizedBox(
        height: 50.0,
        child: Row(
          // Usamos Row para alinear elementos horizontalmente
          mainAxisAlignment:
              MainAxisAlignment.center, // Centramos los elementos
          children: [
            const Text(
              'Creado por Alfonso Sepúlveda García, con Tecnologia Flutter. Email fonsgdev@gmail.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 8,
            ), // Un pequeño espacio entre el texto y el icono
            IconButton(
              icon: const Icon(Icons.public), // Elige el icono que prefieras
              color: Colors.white,
              tooltip:
                  'Visitar página web', // Mensaje que aparece al dejar el cursor encima
              onPressed: () async {
                final Uri uri = Uri.parse(_url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  // Opcional: Muestra un error si no se puede abrir la URL
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('No se pudo abrir la URL: $_url')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

class MijillaSoftFooter extends StatelessWidget {
  const MijillaSoftFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(146, 148, 144, 1),
      elevation: 8.0,
      child: SizedBox(
        height: 50.0,
        child: const Center(
          child: Text(
            'Creado por Alfonso Sepúlveda García, con Tecnologia Flutter. Email fonsgdev@gmail.com',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
*/
