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
    // Para los emails, usamos un esquema diferente
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
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
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
            Expanded(
              // Usamos Wrap para que el texto se ajuste en pantallas pequeñas
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text(
                    'Creado por Alfonso Sepúlveda García, con Tecnologia Flutter. ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // Envolvemos el icono y el texto en un InkWell para hacerlo interactivo
                  InkWell(
                    onTap:
                        () => _launchURL('mailto:fonsgdev@gmail.com', context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.email,
                          color: Colors.black87,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'fonsgdev@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[800], // Color de enlace
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            PopupMenuButton<String>(
              icon: const Icon(Icons.person, color: Colors.white),
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
