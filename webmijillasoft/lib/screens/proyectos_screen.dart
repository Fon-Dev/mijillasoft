import 'package:flutter/material.dart';
// Asegúrate de que las rutas de tus imports sean correctas
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
            // --- CAMBIO AQUÍ: Añadimos las rutas de navegación ---
            const projectWindows = [
              _ProjectWindow(
                icon: Icons.calculate,
                title: 'I.G.A.',
                description:
                    'Programa CRM para la gestión de IBERCOPY (clientes, presupuestos, inventario, etc.).',
                routeName: '/proyecto-iga', // Ruta para el primer proyecto
              ),
              _ProjectWindow(
                icon: Icons.home,
                title: 'Geoffrey',
                description:
                    'Proyecto I.A. para la domotización del hogar.(gestion de luces, persianas, entrada, etc.)',
                routeName:
                    '/proyecto-geoffrey', // Ruta para el segundo proyecto
              ),
              _ProjectWindow(
                icon: Icons.car_crash_rounded,
                title: 'K.I.T.T.',
                description:
                    'Proyecto I.A. aplicada a los vehiculos.(gestion de luces, climatización, apertura, etc.)',
                routeName: '/proyecto-kitt', // Ruta para el tercer proyecto
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
              return const SingleChildScrollView(
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
  final IconData icon;
  final String title;
  final String description;
  final String routeName; // --- NUEVO: Propiedad para la ruta ---

  const _ProjectWindow({
    required this.icon,
    required this.title,
    required this.description,
    required this.routeName, // --- NUEVO: Requerimos la ruta en el constructor ---
  });

  @override
  Widget build(BuildContext context) {
    // --- CAMBIO AQUÍ: Envolvemos el Container con InkWell ---
    return InkWell(
      onTap: () {
        // Acción que se ejecuta al pulsar
        Navigator.pushNamed(context, routeName);
      },
      // Esto hace que el efecto ripple tenga los bordes redondeados
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
            color: const Color.fromRGBO(184, 212, 166, 1),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 60.0,
              color: const Color.fromRGBO(156, 98, 173, 1),
            ),
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


/*
import 'package:flutter/material.dart';
// Asegúrate de que las rutas de tus imports sean correctas
import 'package:webmijillasoft/widgets/footer.dart';
import 'package:webmijillasoft/widgets/top_bar.dart';

class ProyectosScreen extends StatelessWidget {
  const ProyectosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MijillaSoftAppBar(),
      // Añadimos el widget Center como padre principal del body
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Si la pantalla es ancha (como en un PC), usamos una fila (Row)
            if (constraints.maxWidth > 700) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: _ProjectWindow(
                      icon: Icons.calculate,
                      title: 'I.G.A. ',
                      description:
                          'Programa CRM para la gestión de IBERCOPY (clientes, presupuestos, inventario, etc.).',
                    ),
                  ),
                  Expanded(
                    child: _ProjectWindow(
                      icon: Icons.home,
                      title: 'Geoffrey',
                      description:
                          'Proyecto I.A. para la domotización del hogar.(gestion de luces, persianas, entrada, etc.)',
                    ),
                  ),
                  Expanded(
                    child: _ProjectWindow(
                      icon: Icons.car_crash_rounded,
                      title: 'K.I.T.T.',
                      description:
                          'Proyecto I.A. aplicada a los vehiculos.(gestion de luces, climatización, apertura, etc.)',
                    ),
                  ),
                ],
              );
            } else {
              // Si la pantalla es estrecha (como en un móvil), usamos una columna (Column)
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center, // Centra verticalmente en el espacio del scroll
                  children: const [
                    _ProjectWindow(
                      icon: Icons.calculate,
                      title: 'I.G.A.',
                      description:
                          'Programa CRM para la gestión de IBERCOPY (clientes, presupuestos, inventario, etc.).',
                    ),
                    _ProjectWindow(
                      icon: Icons.draw,
                      title: 'Geoffrey',
                      description:
                          'Proyecto I.A. para la domotización del hogar.(gestion de luces, persianas, entrada, etc.)',
                    ),
                    _ProjectWindow(
                      icon: Icons.data_usage,
                      title: 'K.I.T.T.',
                      description:
                          'Proyecto I.A. aplicada a los vehiculos.(gestion de luces, climatización, apertura, etc.)',
                    ),
                  ],
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

/// Widget reutilizable para cada "ventana" de proyecto (sin cambios)
class _ProjectWindow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ProjectWindow({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          color: const Color.fromRGBO(184, 212, 166, 1),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 60.0, color: const Color.fromRGBO(156, 98, 173, 1)),
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
    );
  }
}
*/