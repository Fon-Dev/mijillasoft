import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart'; //paquete para ver pdf
import 'package:webmijillasoft/widgets/footer.dart';
import 'package:webmijillasoft/widgets/top_bar.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MijillaSoftAppBar(),

      // SfPdfViewer.asset carga el PDF desde la carpeta 'assets' que configuraste.
      body: SfPdfViewer.asset(
        'assets/pdf/cv.pdf', // Asegúrate de que esta ruta sea correcta
      ),

      //<--------------------- Pie de aplicación ------------------------------>
      bottomNavigationBar: const MijillaSoftFooter(),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:webmijillasoft/widgets/footer.dart';
import 'package:webmijillasoft/widgets/top_bar.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

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
              '¡Aqui va el Curriculum!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Aqui pondre el curriculum.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      bottomNavigationBar: const MijillaSoftFooter(),
    );
  }
}
*/