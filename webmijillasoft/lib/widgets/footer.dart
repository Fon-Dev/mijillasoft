import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MijillaSoftFooter extends StatelessWidget {
  const MijillaSoftFooter({super.key});

  final Map<String, String> _urls = const {
    'Ver GitHub': 'https://github.com/fon-dev',
    'Perfil de LinkedIn':
        'https://linkedin.com/in/alfonso-sepúlveda-garcía-62106038',
  };

  Future<void> _launchURL(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo abrir la URL: $url')));
    }
  }

  @override
  Widget build(BuildContext context) {
    const endColor = Color.fromRGBO(146, 148, 144, 1);

    return BottomAppBar(
      padding: EdgeInsets.zero,
      child: Container(
        height: 50.0,
        decoration: const BoxDecoration(
          // --- CAMBIO AQUÍ: Degradado invertido ---
          gradient: LinearGradient(
            // El degradado empieza en la izquierda...
            begin: Alignment.centerLeft,
            // ...y termina en la derecha.
            end: Alignment.centerRight,
            // Lista de colores: del blanco al color que tenías.
            colors: [Colors.white, endColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Text(
                'Creado por Alfonso Sepúlveda García, con Tecnologia Flutter. Email fonsgdev@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // El color oscuro funciona bien sobre la parte blanca del degradado
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 8),
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.person,
                // Cambiamos el color a blanco para que contraste sobre la parte oscura
                color: Colors.white,
              ),
              tooltip: 'Redes Sociales',
              onSelected: (String url) {
                _launchURL(url, context);
              },
              itemBuilder: (BuildContext context) {
                return _urls.entries.map((entry) {
                  return PopupMenuItem<String>(
                    value: entry.value,
                    child: Text(entry.key),
                  );
                }).toList();
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
import 'package:url_launcher/url_launcher.dart';

class MijillaSoftFooter extends StatelessWidget {
  const MijillaSoftFooter({super.key});

  // Define un mapa con los nombres y las URLs.
  // ¡Aquí es donde añado y modifico los enlaces!
  final Map<String, String> _urls = const {
    'Ver GitHub': 'https://github.com/fon-dev', // URL primera
    'Perfil de LinkedIn':
        'https://linkedin.com/in/alfonso-sepúlveda-garcía-62106038', // URL segunda
  };

  // Función auxiliar para lanzar la URL
  Future<void> _launchURL(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Muestra un error si no se puede abrir la URL
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('No se pudo abrir la URL: $url')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(146, 148, 144, 1),
      elevation: 8.0,
      child: SizedBox(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Text(
                'Creado por Alfonso Sepúlveda García, con Tecnologia Flutter. Email fonsgdev@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 8),

            // Reemplazamos IconButton por PopupMenuButton para mostrar varias opciones
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ), // Mismo icono
              tooltip: 'Redes Sociales', // Mensaje de ayuda actualizado
              onSelected: (String url) {
                // Cuando se selecciona un item, se llama a nuestra función para abrir la URL
                _launchURL(url, context);
              },
              itemBuilder: (BuildContext context) {
                // Construimos la lista de opciones a partir de nuestro mapa de URLs
                return _urls.entries.map((entry) {
                  return PopupMenuItem<String>(
                    value:
                        entry
                            .value, // El valor que se pasará a onSelected (la URL)
                    child: Text(
                      entry.key,
                    ), // El texto que se mostrará (el nombre)
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/
