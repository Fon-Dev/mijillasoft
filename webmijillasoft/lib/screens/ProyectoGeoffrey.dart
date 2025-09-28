import 'package:flutter/material.dart';
import 'package:webmijillasoft/widgets/footer.dart';
import 'package:webmijillasoft/widgets/top_bar.dart';

class ProyectoGeoffrey extends StatelessWidget {
  const ProyectoGeoffrey({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MijillaSoftAppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person, // Un icono de ejemplo
              size: 100.0,
              color: Color.fromRGBO(184, 212, 166, 0.83),
            ),
            SizedBox(height: 20),
            Text(
              '¡Proyecto Geoffrey!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Proximamente actualizaremos.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MijillaSoftFooter(),
    );
  }
}
