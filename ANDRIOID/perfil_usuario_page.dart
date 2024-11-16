import 'package:flutter/material.dart';

class PerfilUsuarioPage extends StatelessWidget {
  const PerfilUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Usuario'),
        backgroundColor: const Color.fromARGB(255, 42, 198, 37),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 224, 224, 224),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Icono de perfil en lugar de imagen
            const Icon(
              Icons.person,
              size: 100,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            
            // Información del usuario en formato de lista
            _buildInfoList(
              label: 'Nombre:',
              content: 'Juan',
            ),
            _buildInfoList(
              label: 'Apellidos:',
              content: 'Pérez Gómez',
            ),
            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Columna 1: Matrícula
                _buildInfoColumn(label: 'Matrícula', content: 'A01234567'),
                // Columna 2: Grado
                _buildInfoColumn(label: 'Grado', content: '3°'),
                // Columna 3: Cuatrimestre
                _buildInfoColumn(label: 'Cuatrimestre', content: '1°'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Actividad extraescolar
            const Text(
              'Extraescolar:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF48040D),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Fútbol',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  // Método para crear la lista de información del usuario (Nombre y Apellidos)
  Widget _buildInfoList({required String label, required String content}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          content,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Método para crear las columnas de información (Matrícula, Grado, Cuatrimestre)
  Widget _buildInfoColumn({required String label, required String content}) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }
}