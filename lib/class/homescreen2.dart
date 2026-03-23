import 'package:flutter/material.dart';
import '../data/listdata.dart';
import '../data/listdata2.dart';
import 'cards.dart';
import 'busquedamascota.dart';

class HomeScreen2 extends StatefulWidget {
  HomeScreen2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adopta una huella',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
        actions: [
          IconButton(
            tooltip: 'Buscar mascota',
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: BusquedaMascota([...mascotas, ...mascotas2]),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Mascotas en adopción',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 10),
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

            const SizedBox(height: 30),

            Text(
                'Mascotas extraviadas',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 15),
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
            )
          ],
        ),
      ),

      /*
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
          NavigationDestination(icon: Icon(Icons.pets), label: 'Mascotas'),
        ],
      ),
      */

    );
  }
}