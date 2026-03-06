import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/mascota.dart';

class DetalleMascotaScreen extends StatelessWidget{
  final Mascota mascota;

  DetalleMascotaScreen({super.key,required this.mascota});

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
                const SizedBox(height: 24),
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