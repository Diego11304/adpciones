import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/mascota.dart';

class DetalleMascotaScreen2 extends StatelessWidget{
  final Mascota mascota;

  DetalleMascotaScreen2({super.key,required this.mascota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mascota.nombre)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            mascota.imagen,
            width: double.infinity,
            height: 280,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mascota.nombre,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('${mascota.tipo} · ${mascota.edad} años'),
                const SizedBox(height: 16),
                Text(
                  mascota.descripcion,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 24),
                Text('Ubicacion para adoptar', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
          ),
          SizedBox(height: 24),
                SizedBox(
                  height: 220,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                            mascota.lat, mascota.lng
                          ),
                        zoom: 14,
                      ),
                      markers: {
                          Marker(
                            markerId: MarkerId(mascota.nombre),
                            position: LatLng(mascota.lat, mascota.lng),
                            infoWindow: InfoWindow(
                               title:  mascota.nombre,
                              snippet: 'Ubicacion para adoptar',
                            ),
                          )
                      },
                  ),
                ),
                ),

                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                    label: const Text('Solicitar adopción'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}