import 'package:flutter/material.dart';
import '../data/listdata.dart';
import '../data/listdata2.dart';
import 'cards.dart';
import 'busquedamascota.dart';
import 'formscreen.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> {

  int _selectedIndex = 0;

  //metodo de buscar mascotas
  void _ejecutarBusqueda() {
    final todasLasMascotas = [...mascotas, ...mascotas2];//Lista unificada A1 el "..." es un operador para insetar todos los elementos de una coleccion
    showSearch(
      context: context,
      delegate: BusquedaMascota(todasLasMascotas),
    );
  }

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });
  //se ejecuta el metodo al selccionar el primer icono del menu del navbar
    if (index == 1) {
      _ejecutarBusqueda();
    }

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormScreen(mascota: mascotas[1]),
        ),
      );
    }

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormScreen(mascota: mascotas[2]),
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Adopta una Huella 🐾'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mascotas.length,
                itemBuilder: (context, index) {

                  final mascota = mascotas[index];

                  return Container(
                    width: 160,
                    margin: const EdgeInsets.only(right: 12),
                    child: MascotaCard(mascota: mascota),
                  );

                },
              ),
            ),

            Text(
              "Mascotas Extraviadas",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                itemCount: mascotas2.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return MascotaCard(mascota: mascotas2[index]);
                },
              ),
            ),

          ],
        ),
      ),


      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.pets),
            label: 'Adoptar',
          ),

          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),

          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),

          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),

        ],
      ),
      /// DRAWER
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF6C63FF),
              ),
              accountName: const Text("Usuario"),
              accountEmail: const Text("norma@itdurango.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Inicio"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text("Adoptar"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FormScreen(mascota: mascotas[0]),
                  ),
                );
              },
            ),

            //Menu hamburguesa para busqueda
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text("Buscar"),
              onTap: () {
                Navigator.pop(context);
                //ejecuta el metodo de busqueda
                _ejecutarBusqueda();
              },
            ),

            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Favoritos"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Acerca de"),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Adopta una Huella",
                  applicationVersion: "1.0",
                  applicationLegalese: "Proyecto educativo",
                );
              },
            ),

          ],
        ),
      ),

    );
  }
}