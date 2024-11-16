import 'package:flutter/material.dart';

class SolicitarConstanciaPage extends StatefulWidget {
  const SolicitarConstanciaPage({super.key});

  @override
  _SolicitarConstanciaPageState createState() =>
      _SolicitarConstanciaPageState();
}

class _SolicitarConstanciaPageState extends State<SolicitarConstanciaPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _motivoController = TextEditingController();
  
  int _cuatrimestre = 1;
  bool _constancia1 = false;
  bool _constancia2 = false;
  bool _constancia3 = false;
  
  bool _isMotivoRequired = false;  // Flag to show/hide the "Motivo" field

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_cuatrimestre > 3 && _motivoController.text.isEmpty) {
        // Solicita el motivo si el cuatrimestre es mayor que 3
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Es necesario ingresar un motivo para descargar la constancia.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
        return;
      }

      // Lógica para continuar con la solicitud
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Solicitud Enviada'),
          content: const Text('Tu solicitud ha sido enviada correctamente.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitar Constancia'),
        backgroundColor: const Color(0xFF5ab507),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text('Por favor ingresa los datos para solicitar la constancia.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              
              TextFormField(
                controller: _nombresController,
                decoration: const InputDecoration(
                  labelText: 'Nombres',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _apellidosController,
                decoration: const InputDecoration(
                  labelText: 'Apellidos',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tus apellidos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _matriculaController,
                decoration: const InputDecoration(
                  labelText: 'Matrícula',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu matrícula';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              DropdownButtonFormField<int>(
                value: _cuatrimestre,
                decoration: const InputDecoration(
                  labelText: 'Cuatrimestre',
                  border: OutlineInputBorder(),
                ),
                items: List.generate(7, (index) {
                  return DropdownMenuItem(
                    value: index + 1,
                    child: Text('Cuatrimestre ${index + 1}'),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    _cuatrimestre = value!;
                    // Bloquear opciones según el cuatrimestre seleccionado
                    if (_cuatrimestre == 1) {
                      _constancia1 = false;
                      _constancia2 = false;
                      _constancia3 = false;
                    } else if (_cuatrimestre == 2) {
                      _constancia2 = false;
                      _constancia3 = false;
                    } else if (_cuatrimestre == 3) {
                      _constancia1 = false;
                      _constancia3 = false;
                    } else {
                      // Si es mayor a 3, se activa la opción de justificar
                      _isMotivoRequired = true;
                    }
                  });
                },
              ),
              const SizedBox(height: 16),
              
              CheckboxListTile(
                value: _constancia1,
                onChanged: _cuatrimestre <= 3
                    ? (value) {
                        setState(() {
                          _constancia1 = value!;
                        });
                      }
                    : null,
                title: const Text('Constancia 1'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                value: _constancia2,
                onChanged: _cuatrimestre <= 2
                    ? (value) {
                        setState(() {
                          _constancia2 = value!;
                        });
                      }
                    : null,
                title: const Text('Constancia 2'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                value: _constancia3,
                onChanged: _cuatrimestre <= 1
                    ? (value) {
                        setState(() {
                          _constancia3 = value!;
                        });
                      }
                    : null,
                title: const Text('Constancia 3'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (_isMotivoRequired) ...[
                const SizedBox(height: 16),
                TextFormField(
                  controller: _motivoController,
                  decoration: const InputDecoration(
                    labelText: 'Motivo de la Solicitud',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el motivo';
                    }
                    return null;
                  },
                ),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Solicitar Constancia',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
