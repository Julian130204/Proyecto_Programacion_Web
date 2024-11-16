import 'package:flutter/material.dart';
import 'package:test01/principal.dart'; // Principal view for the user
import 'package:test01/profesor.dart'; // Profesor view

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio de Sesión',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Método para validar matrícula y contraseña
  void validarFormulario() {
    String matricula = matriculaController.text;
    String password = passwordController.text;

    if (matricula == '201') {
      // Redirigir a la vista de profesor
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfesorApp()),
      );
    } else if (matricula.length == 8 && password.length >= 6) {
      // Redirigir a la vista principal
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Principal()),
      );
    } else {
      // Mostrar alerta si es inválido
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
            'Matrícula o contraseña inválidas. '
            'Asegúrate de que la matrícula tenga 8 caracteres y la contraseña al menos 6.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5ab507),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo superior
              Image.network(
                'https://uptrepregionponiente.edu.mx/img/logo.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              // Tarjeta de inicio de sesión
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Icono de usuario
                    const CircleAvatar(
                      backgroundImage: NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
                      radius: 40,
                    ),
                    const SizedBox(height: 15),
                    // Título de la tarjeta
                    const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campo de Matrícula
                    TextField(
                      controller: matriculaController,
                      decoration: InputDecoration(
                        labelText: 'Matrícula (Ej: 22SIC001)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      maxLength: 8,
                    ),
                    const SizedBox(height: 10),
                    // Campo de Contraseña
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Botón de Inicio de Sesión
                    ElevatedButton(
                      onPressed: validarFormulario,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF66c00b),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text('Entrar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
