import 'package:flutter/material.dart';
import '../model/mascota.dart';
import 'detallemascotasscreen2.dart';

class BusquedaMascota extends SearchDelegate<Mascota?> {
  final List<Mascota> mascotasTotales;

  BusquedaMascota(this.mascotasTotales);

  @override
  String get searchFieldLabel => 'Búsqueda mascota';
//boton para cancelar
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }
// boton para regresar
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }
//pagina de resultados
  @override
  Widget buildResults(BuildContext context) => _mostrarResultados(context);
//pagina de sugerencias
  @override
  Widget buildSuggestions(BuildContext context) => _mostrarResultados(context);
//Sugerencias de busqueda
  Widget _mostrarResultados(BuildContext context) {
    final sugerencias = mascotasTotales.where((m) {
      return m.nombre.toLowerCase().contains(query.toLowerCase());
    }).toList();
// no hay mascotas con el nombre
    if (sugerencias.isEmpty) {
      return const Center(child: Text('No se encontraron mascotas con ese nombre.'));
    }
//pagina de busqueda
    return ListView.builder(
      itemCount: sugerencias.length,
      itemBuilder: (context, index) {
        final mascota = sugerencias[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(mascota.imagen), //
          ),
          title: Text(mascota.nombre), //
          subtitle: Text(mascota.tipo), //
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalleMascotaScreen2(mascota: mascota),
              ),
            );
          },
        );
      },
    );
  }
}