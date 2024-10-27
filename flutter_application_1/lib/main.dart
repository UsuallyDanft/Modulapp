import 'package:flutter/material.dart';
import 'registrar_paciente.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/registrar_paciente': (context) => const RegistrarPaciente(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 4, 166, 171),
        title: const Text(
          'Modulapp',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Inicio del Panel 1
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(45),
                border: Border.all(
                  color: const Color.fromARGB(157, 114, 135, 230),
                  width: 3,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/pacientes.png',
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registrar_paciente');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 114, 135, 230),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Registrar paciente',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Fin del Panel 1

          // Inicio del Panel 2
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 251, 251, 251),
                borderRadius: BorderRadius.circular(45),
                border: Border.all(
                  color: const Color.fromARGB(157, 28, 116, 141),
                  width: 3,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/files.png',
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 28, 116, 141),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Operaciones de consultas',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Fin del Panel 2

          // Inicio del Panel 3
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(0, 255, 255, 255),
                borderRadius: BorderRadius.circular(45),
                border: Border.all(
                  color: const Color.fromARGB(157, 250, 97, 130),
                  width: 3,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Mom.png',
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 250, 97, 130),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Maternidad',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Fin del Panel 3
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 4, 166, 171),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[300],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icono_buscar.png')),
                label: 'Buscar',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icono_home.png')),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icono_config.png')),
                label: 'Configuración',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
