import 'package:flutter/material.dart';

class ParaescolaresScreen extends StatelessWidget {
  final String paraescolar;
  final List<String> clasesPasadas;
  final List<String> clasesFuturas;

  const ParaescolaresScreen({
    super.key,
    this.paraescolar = "Sin paraescolar",
    this.clasesPasadas = const [],
    this.clasesFuturas = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Paraescolares'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Extraescolar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              paraescolar,
              style: TextStyle(
                fontSize: 16,
                color: paraescolar == "Sin paraescolar" ? Colors.grey : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/unirse_paraescolar');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Elegir extraescolar'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Calendario de Clases',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...clasesPasadas.map(
                    (clase) => ListTile(
                      title: Text(clase),
                      subtitle: const Text('Pasada'),
                      trailing: const Icon(Icons.check, color: Colors.green),
                    ),
                  ),
                  ...clasesFuturas.map(
                    (clase) => ListTile(
                      title: Text(clase),
                      subtitle: const Text('Pendiente'),
                      trailing: const Icon(Icons.hourglass_empty, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
