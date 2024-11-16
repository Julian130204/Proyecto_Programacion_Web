// TODO Implement this library.
import 'package:flutter/material.dart';

class ValidarConstanciaPage extends StatefulWidget {
  const ValidarConstanciaPage({super.key});

  @override
  _ValidarConstanciaPageState createState() => _ValidarConstanciaPageState();
}

class _ValidarConstanciaPageState extends State<ValidarConstanciaPage> {
  // Lista de alumnos
  final List<String> alumnos = ['Juan Pérez', 'María López'];

  // Lista de constancias y estado de validación
  final Map<String, List<String>> constancias = {
    'Juan Pérez': ['Constancia de 1er cuatri', 'Constancia de 2er cuatri', 'Constancia de 3er cuatri'],
    'María López': ['Constancia de 1er cuatri'],
  };

  // Función para eliminar una constancia validada
  void validarConstancia(String alumno, String constancia) {
    setState(() {
      constancias[alumno]?.remove(constancia);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5ab507),
        title: const Text('Validar Constancia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: alumnos.length,
          itemBuilder: (context, index) {
            String alumno = alumnos[index];
            List<String>? constanciasAlumno = constancias[alumno];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ExpansionTile(
                title: Text(alumno),
                children: constanciasAlumno!.map((constancia) {
                  return ListTile(
                    title: Text(constancia),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Validar constancia
                        validarConstancia(alumno, constancia);

                        // Mostrar mensaje de validación
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$constancia de $alumno ha sido validada.'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: const Text('Validar'),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
