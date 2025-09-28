import 'package:flutter/material.dart';

class MijillaSoftFooter extends StatelessWidget {
  const MijillaSoftFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(184, 212, 166, 1.0),
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
