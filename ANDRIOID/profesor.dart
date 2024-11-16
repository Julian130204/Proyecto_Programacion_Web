import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'perfil_usuario_page.dart'; // Importa la página de perfil del usuario
import 'lista_asistencia_page.dart'; // Importa la página de lista de asistencia
import 'validar_constancias_page.dart'; // Importa la página para validar constancias
import 'login.dart'; // Importa la página de inicio de sesión

void main() {
  runApp(const ProfesorApp());
}

class ProfesorApp extends StatelessWidget {
  const ProfesorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vista Profesor',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ProfesorHomePage(),
      routes: {
        '/perfil': (context) => const PerfilUsuarioPage(),
        '/lista_asistencia': (context) => const ListaAsistenciaPage(),
        '/validar_constancias': (context) => const ValidarConstanciaPage(),
      },
    );
  }
}

class ValidarConstanciasPage {
  const ValidarConstanciasPage();
}

class ProfesorHomePage extends StatefulWidget {
  const ProfesorHomePage({super.key});

  @override
  _ProfesorHomePageState createState() => _ProfesorHomePageState();
}

class _ProfesorHomePageState extends State<ProfesorHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5ab507),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.network(
              'https://uptrepregionponiente.edu.mx/img/logo.png',
              width: 50,
              height: 50,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red);
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF5ab507),
              ),
              child: Text(
                'Menú Profesor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pushNamed(context, '/perfil'); // Redirige al perfil
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist),
              title: const Text('Lista de asistencia'),
              onTap: () {
                Navigator.pushNamed(context, '/lista_asistencia'); // Redirige a lista de asistencia
              },
            ),
            ListTile(
              leading: const Icon(Icons.verified),
              title: const Text('Validar constancias'),
              onTap: () {
                Navigator.pushNamed(context, '/validar_constancias'); // Redirige a validar constancias
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CarouselSlider(
              items: [
                Image.network(
                  'https://via.placeholder.com/800x400?text=Profesor+1',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, color: Colors.grey);
                  },
                ),
                Image.asset(
                  'assets/images/descargar.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/MUNICIPIO.png',
                  fit: BoxFit.cover,
                ),
              ],
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '¡Bienvenido, Profesor!',
                style: TextStyle(fontSize: 24, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/perfil');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Perfil',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lista_asistencia');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Lista de Asistencia',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/validar_constancias');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Validar Constancias',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
