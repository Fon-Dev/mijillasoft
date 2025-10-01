import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Necesario para los enlaces
import 'package:webmijillasoft/widgets/footer.dart';
import 'package:webmijillasoft/widgets/top_bar.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MijillaSoftAppBar(),
      // HEMOS REEMPLAZADO EL BODY ORIGINAL POR ESTE SINGLECHILDSCROLLVIEW
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ), // Ancho máximo para el contenido
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(), // Foto, Nombre, Título y Contacto
                const SizedBox(height: 24),
                _buildSectionTitle('Perfil'),
                const Text(
                  'Desde siempre he tenido pasión por todo lo relacionado con la informática. Empecé muy joven programando en BASIC con un Spectrum ZX y en un i286. Al final, decidí estudiar desarrollo de aplicaciones multiplataforma para afianzar los conocimientos en software y ampliar mis capacidades. Soy una persona activa y responsable con ganas de aprender y realizar nuevos proyectos.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                const Divider(height: 48),
                _buildSectionTitle('Experiencia Laboral'),
                _buildExperienceItem(
                  date: '2022-2025',
                  company: 'Ibercopy soluciones digitales',
                  role: 'Técnico informático',
                  description:
                      'Reparación e instalación de equipos informáticos, redes y programación sistema gestión almacén.',
                ),
                const SizedBox(height: 16),
                _buildExperienceItem(
                  date: '2020-2022',
                  company: 'Anovo Comlink España',
                  role: 'Especialista',
                  description:
                      'Reparación de ordenadores, efectos personales y artículos de uso doméstico.',
                ),
                const Divider(height: 48),
                _buildSectionTitle('Formación Académica'),
                _buildEducationItem(
                  date: '2023-2025',
                  degree:
                      'Ciclo Formativo Grado Superior - Desarrollo de Aplicaciones Multiplataforma',
                  institution: 'C.D.P. MEDAC Málaga',
                ),
                const SizedBox(height: 16),
                _buildEducationItem(
                  date: '2018-2020',
                  degree:
                      'Ciclo Formativo Grado Medio - Sistemas Microinformáticos y Redes',
                  institution: 'I.E.S. Ciudad Jardin',
                ),
                const Divider(height: 48),
                _buildSectionTitle('Competencias'),
                _buildSkills(),
                const Divider(height: 48),
                _buildSectionTitle('Cursos Adicionales'),
                _buildCourseItem(
                  date: 'Mayo 2020 (80 Horas)',
                  title: 'Curso introducción al desarrollo web I y II',
                  institution: 'Google actívate',
                ),
                _buildCourseItem(
                  date: 'Marzo 2009-Julio 2009 (250 Horas)',
                  title:
                      'Desarrollo de aplicaciones para dispositivos móviles Java ME 1.0',
                  institution: 'Confederación de empresarios de Andalucía',
                ),
                _buildCourseItem(
                  date: 'Junio 2008 - Julio 2008 (50 Horas)',
                  title: 'Administración y explotación MYSQL',
                  institution: 'Confederación de empresarios de Andalucía',
                ),
                const Divider(height: 48),
                _buildSectionTitle('Otros Datos'),
                _buildOtherInfoItem(
                  Icons.directions_car,
                  'Permiso de conducir B',
                ),
                _buildOtherInfoItem(Icons.commute, 'Vehículo propio'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MijillaSoftFooter(),
    );
  }

  // AQUÍ COMIENZAN LAS FUNCIONES AUXILIARES PARA CONSTRUIR CADA SECCIÓN
  // Las he añadido dentro de la clase para mantener todo organizado.

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
            'assets/profile_picture.jpg',
          ), // ¡Asegúrate que esta ruta es correcta!
          backgroundColor: Colors.grey,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Alfonso Sepúlveda García',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D47A1),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'DESARROLLADOR DE SOFTWARE',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 12),
              _buildContactInfo(
                Icons.email,
                'alfonso.sepulveda.garcia@gmail.com',
                'mailto:alfonso.sepulveda.garcia@gmail.com',
              ),
              const SizedBox(height: 4),
              _buildContactInfo(Icons.phone, '669 447 883', 'tel:+34669447883'),
              const SizedBox(height: 4),
              _buildContactInfo(
                Icons.language,
                'www.mijillasoft.com',
                'http://www.mijillasoft.com',
              ),
              const SizedBox(height: 4),
              _buildContactInfo(Icons.location_on, 'Málaga, España', null),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0D47A1),
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildExperienceItem({
    required String date,
    required String company,
    required String role,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$date | $company',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(
          role,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.grey[700],
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(description, style: const TextStyle(fontSize: 15)),
      ],
    );
  }

  Widget _buildEducationItem({
    required String date,
    required String degree,
    required String institution,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(degree, style: const TextStyle(fontSize: 15)),
        const SizedBox(height: 4),
        Text(
          institution,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.grey[700],
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildCourseItem({
    required String date,
    required String title,
    required String institution,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            '$institution ($date)',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey[700],
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkills() {
    final skills = [
      'Java',
      'Flutter',
      'C++',
      'Python',
      'HTML',
      'CSS',
      'MySQL',
      'Git',
      'Figma',
      'Jira',
      'Android Studio',
      'Visual Studio',
      'Windows',
      'Linux',
      'Android',
      'Mac OS',
      'GIMP',
    ];
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children:
          skills
              .map(
                (skill) => Chip(
                  label: Text(skill),
                  backgroundColor: Colors.blue[50],
                  labelStyle: TextStyle(color: Colors.blue[800]),
                  side: BorderSide(color: Colors.blue[200]!),
                ),
              )
              .toList(),
    );
  }

  Widget _buildContactInfo(IconData icon, String text, String? url) {
    return InkWell(
      onTap:
          url != null
              ? () async {
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              }
              : null,
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[800], size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: url != null ? Colors.blue[700] : Colors.black,
              decoration:
                  url != null ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherInfoItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700], size: 18),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 15)),
        ],
      ),
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