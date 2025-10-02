import 'package:flutter/material.dart';

class MijillaSoftAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MijillaSoftAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = kToolbarHeight * 2;
    // --- CAMBIO AQUÍ: Guardamos el color en una variable para no repetirlo ---
    const endColor = Color.fromRGBO(146, 148, 144, 1);

    return AppBar(
      toolbarHeight: appBarHeight,
      title: const Text(''),
      flexibleSpace: Container(
        // --- CAMBIO AQUÍ: Se modifica la decoración para usar un degradado ---
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // El degradado empieza en la izquierda...
            begin: Alignment.centerLeft,
            // ...y termina en la derecha.
            end: Alignment.centerRight,
            // Lista de colores: del blanco al color que tenías.
            colors: [Colors.white, endColor],
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight * 0.2),
            child: Image.asset(
              "assets/images/logonombre.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu, size: 35),
          onSelected: (String result) {
            switch (result) {
              case 'opcion1':
                Navigator.popUntil(context, ModalRoute.withName('/'));
                break;
              case 'opcion2':
                Navigator.pushNamed(context, '/proyectos');
                break;
              case 'opcion3':
                Navigator.pushNamed(context, '/curriculum');
                break;
            }
          },
          itemBuilder:
              (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'opcion1',
                  child: Text('Inicio'),
                ),
                const PopupMenuItem<String>(
                  value: 'opcion2',
                  child: Text('Proyectos'),
                ),
                const PopupMenuItem<String>(
                  value: 'opcion3',
                  child: Text('Currículum'),
                ),
              ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}


/*
import 'package:flutter/material.dart';

class MijillaSoftAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MijillaSoftAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = kToolbarHeight * 2;
    return AppBar(
      toolbarHeight: appBarHeight,
      title: const Text(''),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(146, 148, 144, 1),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight * 0.2),
            child: Image.asset(
              "assets/images/logonombre.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu, size: 35),
          onSelected: (String result) {
            switch (result) {
              case 'opcion1':
                Navigator.popUntil(context, ModalRoute.withName('/'));
                break;
              case 'opcion2':
                Navigator.pushNamed(context, '/proyectos');
                break;
              case 'opcion3':
                Navigator.pushNamed(context, '/curriculum');
                break;
            }
          },
          itemBuilder:
              (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'opcion1',
                  child: Text('Inicio'),
                ),
                const PopupMenuItem<String>(
                  value: 'opcion2',
                  child: Text('Proyectos'),
                ),
                const PopupMenuItem<String>(
                  value: 'opcion3',
                  child: Text('Currículum'),
                ),
              ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}
*/