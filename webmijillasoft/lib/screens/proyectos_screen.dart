import 'package:flutter/material.dart';
import 'package:webmijillasoft/widgets/footer.dart';
import 'package:webmijillasoft/widgets/top_bar.dart';

class ProyectosScreen extends StatelessWidget {
  const ProyectosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MijillaSoftAppBar(),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Ahora pasamos un Widget completo (Icon o Image) a cada _ProjectWindow.
            final projectWindows = [
              _ProjectWindow(
                // Usamos Image.asset para el logo personalizado
                displayWidget: Image.asset(
                  'assets/images/icon.png', // <-- ¡IMPORTANTE!
                  width: 100.0,
                  height: 100.0,
                ),
                title: 'Eduprimari',
                description:
                    'Proyecto realizado para mejorar el aprendizaje de las tablas de multiplicar.',
                routeName:
                    '/proyecto-eduprimari', // Ruta para el primer proyecto
              ),
              _ProjectWindow(
                displayWidget: Image.asset(
                  'assets/images/logo_valdi.png', // <-- ¡IMPORTANTE!
                  width: 100.0,
                  height: 100.0,
                ),
                title: 'Valdi',
                description:
                    'Proyecto realizado para la gestion de pedidos on-line de una empresa de comida a domicilio',
                routeName: '/proyecto-valdi', // Ruta para el segundo proyecto
              ),
              _ProjectWindow(
                displayWidget: Image.asset(
                  'assets/images/logo_ibercopy.png', // <-- ¡IMPORTANTE!
                  width: 200.0,
                  height: 70.0,
                ),
                title: 'I.G.A.',
                description:
                    'Programa CRM-ERP para la gestión de la empresa IBERCOPY (clientes, presupuestos, inventario, etc.).',
                routeName: '/proyecto-iga', // Ruta para el tercer proyecto
              ),
              _ProjectWindow(
                displayWidget: Image.asset(
                  'assets/images/logo_geoffrey.png', // <-- ¡IMPORTANTE!
                  width: 100.0,
                  height: 100.0,
                ),
                title: 'Geoffrey',
                description:
                    'Proyecto I.A. para la domotización del hogar.(gestion de luces, persianas, entrada, etc.)',
                routeName: '/proyecto-geoffrey', // Ruta para el cuarto proyecto
              ),
              _ProjectWindow(
                displayWidget: Image.asset(
                  'assets/images/logo_kitt.png', // <-- ¡IMPORTANTE!
                  width: 100.0,
                  height: 100.0,
                ),
                title: 'K.I.T.T.',
                description:
                    'Proyecto I.A. aplicada a los vehiculos.(gestion de luces, climatización, apertura, etc.)',
                routeName: '/proyecto-kitt', // Ruta para el quinto proyecto
              ),
            ];

            if (constraints.maxWidth > 700) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                // Mapeamos la lista a widgets Expanded
                children:
                    projectWindows
                        .map((proj) => Expanded(child: proj))
                        .toList(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: projectWindows,
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: const MijillaSoftFooter(),
    );
  }
}

/// Widget reutilizable para cada "ventana" de proyecto
class _ProjectWindow extends StatelessWidget {
  // --- CAMBIO AQUÍ: Cambiamos 'IconData icon' por 'Widget displayWidget' ---
  // Esto nos permite pasar cualquier widget, ya sea un Icon, una Image, etc.
  final Widget displayWidget;
  final String title;
  final String description;
  final String routeName;

  const _ProjectWindow({
    required this.displayWidget, // Requerimos el nuevo widget
    required this.title,
    required this.description,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(
            color: const Color.fromRGBO(146, 148, 144, 1),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- CAMBIO AQUÍ: Usamos directamente el widget que nos pasaron ---
            displayWidget, // Simplemente colocamos el widget aquí
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
