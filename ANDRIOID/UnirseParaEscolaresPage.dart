import 'package:flutter/material.dart';

class UnirseParaEscolaresPage extends StatelessWidget {
  const UnirseParaEscolaresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unirse a Paraescolares'),
        backgroundColor: const Color.fromARGB(255, 42, 198, 37),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 224, 224, 224),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Formulario para Unirse a Actividades Paraescolares',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF48040D),
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Nombre Completo',
              hintText: 'Ingrese su nombre completo',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Correo Electrónico',
              hintText: 'Ingrese su correo electrónico',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Teléfono',
              hintText: 'Ingrese su número de teléfono',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Matrícula',
              hintText: 'Ingrese su matrícula de estudiante',
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              label: 'Seleccione la Actividad Paraescolar',
              items: [
                'Fútbol',
                'Basquetbol',
                'Voleibol',
                'Danza',
                'Tiro con arco',
                'Otros',
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para enviar el formulario
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Formulario enviado')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 8, 124, 41),
              ),
              child: const Text('Unirse'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required List<String> items,
  }) {
    String? selectedItem;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        DropdownButton<String>(
          value: selectedItem,
          hint: const Text('Seleccione una opción'),
          onChanged: (String? newValue) {
            // Actualiza el estado si es necesario
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
