import 'package:flutter/material.dart';
import 'package:webmijillasoft/widgets/footer.dart';
import 'package:webmijillasoft/widgets/top_bar.dart';

class ProyectoValdi extends StatelessWidget {
  const ProyectoValdi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MijillaSoftAppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.fastfood, // Un icono de ejemplo
              size: 100.0,
              color: Color.fromRGBO(184, 212, 166, 0.83),
            ),
            SizedBox(height: 20),
            Text(
              '¡Proyecto Valdi!',
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
