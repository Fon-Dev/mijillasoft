import 'package:flutter/material.dart';
import 'package:webmijillasoft/widgets/footer.dart';


class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

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
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Lógica de navegación basada en la opción seleccionada
              switch (result) {
                case 'opcion1':
                  // Navegar a PortadaScreen. Si ya estás aquí, puedes optar por no hacer nada
                  // o usar pushReplacementNamed si quieres "reiniciar" la pantalla
                  // en el historial de navegación (útil si vienes de otro lado).
                  // Para este caso, si ya estás en la Portada, no es estrictamente necesario navegar.
                  // Si el usuario llega a la Portada desde otra página y selecciona 'Inicio',
                  // entonces sí que querrías navegar de vuelta.
                  // Aquí un simple pop hasta la primera ruta para asegurar que no se apilan portadas
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                  break;
                case 'opcion2':
                  Navigator.pushNamed(
                    context,
                    '/proyectos',
                  ); // Navega a la ruta de Proyectos
                  break;
                case 'opcion3':
                  Navigator.pushNamed(
                    context,
                    '/curriculum',
                  ); // Navega a la ruta de Curriculum
                  break;
              }
            },
            itemBuilder:
                (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'opcion1', // Asigna un valor a cada opción
                    child: Text('Inicio'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'opcion2',
                    child: Text('Proyectos'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'opcion3',
                    child: Text('Curriculum'),
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
