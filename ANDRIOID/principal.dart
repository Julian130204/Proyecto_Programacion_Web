import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'UnirseParaEscolaresPage.dart'; // Importa la página de unirse a paraescolares
import 'login.dart'; // Importa el archivo donde está LoginPage
import 'paraescolares_screen.dart'; // Importa la pantalla Paraescolares
import 'perfil_usuario_page.dart'; // Importa la página de perfil del usuario
import 'solicitar_constancia_page.dart'; // Importa la página para solicitar constancia

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vista Principal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
      routes: {
        '/paraescolares': (context) => const ParaescolaresScreen(
              paraescolar: 'Fútbol',
              clasesPasadas: ['Clase 1', 'Clase 2'],
              clasesFuturas: ['Clase 3', 'Clase 4'],
            ),
        '/perfil': (context) => const PerfilUsuarioPage(),
        '/unirse_paraescolar': (context) => const UnirseParaEscolaresPage(),
        '/solicitar_constancia': (context) => const SolicitarConstanciaPage(), // Ruta para solicitar constancia
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_2),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pushNamed(context, '/perfil'); // Redirige al perfil
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Extraescolar'),
              onTap: () {
                Navigator.pushNamed(context, '/paraescolares');
              },
            ),
            ListTile(
              leading: const Icon(Icons.document_scanner),
              title: const Text('Solicitud de Constancia'),
              onTap: () {
                Navigator.pushNamed(context, '/solicitar_constancia'); // Redirige a la solicitud de constancia
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
                  'https://via.placeholder.com/800x400?text=Imagen+1',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, color: Colors.grey);
                  },
                ),
                Image.network(
                  'assets/images/descargar.jpeg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, color: Colors.grey);
                  },
                ),
                Image.network(
                  'assets/images/MUNICIPIO.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, color: Colors.grey);
                  },
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
                '¡Bienvenido al sistema de la UPTrep!',
                style: TextStyle(fontSize: 24, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/unirse_paraescolar',
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
                'Únete a una paraescolar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
