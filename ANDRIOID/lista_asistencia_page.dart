import 'package:flutter/material.dart';

class ListaAsistenciaPage extends StatefulWidget {
  const ListaAsistenciaPage({super.key});

  @override
  _ListaAsistenciaPageState createState() => _ListaAsistenciaPageState();
}

class _ListaAsistenciaPageState extends State<ListaAsistenciaPage> {
  // Lista de paraescolares
  final List<String> actividades = [
    'Fútbol',
    'Basquetbol',
    'Voleibol',
    'Danza',
    'Tiro con arco',
  ];

  // Estudiantes (simulación de una lista)
  final List<String> estudiantes = [
    'Juan Pérez',
    'María López',
    'Carlos Gómez',
    'Ana Torres',
    'Luis Hernández',
  ];

  // Variable para la actividad seleccionada
  String? actividadSeleccionada;

  // Mapa para registrar la asistencia (clave: nombre del estudiante, valor: si está presente)
  Map<String, bool> asistencia = {};

  @override
  void initState() {
    super.initState();
    // Inicializamos el estado de asistencia en "false" para todos los estudiantes
    for (var estudiante in estudiantes) {
      asistencia[estudiante] = false;
    }
  }

  // Método para cambiar la asistencia de un estudiante
  void toggleAsistencia(String estudiante) {
    setState(() {
      asistencia[estudiante] = !(asistencia[estudiante] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5ab507),
        title: const Text('Registrar Asistencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            const Text(
              'Selecciona la actividad paraescolar:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Dropdown para seleccionar la actividad
            DropdownButton<String>(
              value: actividadSeleccionada,
              hint: const Text('Selecciona una actividad'),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  actividadSeleccionada = newValue;
                  // Restablecer la asistencia a "false" cuando cambia la actividad
                  for (var estudiante in estudiantes) {
                    asistencia[estudiante] = false;
                  }
                });
              },
              items: actividades.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Si no se ha seleccionado una actividad, mostrar mensaje
            if (actividadSeleccionada == null)
              const Center(child: Text('Selecciona una actividad para empezar.')),

            // Si se ha seleccionado una actividad, mostrar la lista de estudiantes
            if (actividadSeleccionada != null)
              Expanded(
                child: ListView.builder(
                  itemCount: estudiantes.length,
                  itemBuilder: (context, index) {
                    String estudiante = estudiantes[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(estudiante),
                        trailing: Switch(
                          value: asistencia[estudiante] ?? false,
                          onChanged: (bool value) {
                            toggleAsistencia(estudiante);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),

            const SizedBox(height: 20),

            // Botón para registrar la asistencia
            ElevatedButton(
              onPressed: actividadSeleccionada == null
                  ? null
                  : () {
                      // Aquí se puede guardar o procesar la asistencia
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Asistencia Registrada'),
                            content: const Text('La asistencia ha sido registrada correctamente.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Aceptar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Registrar Asistencia',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
