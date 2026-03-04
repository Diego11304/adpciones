import 'package:flutter/material.dart';
import '../data/listdata.dart';
import 'cards.dart';

class HomeScreen extends StatelessWidget{
  HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adopta una huella', style: TextStyle(color: Colors.white),
        ),
          centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
        itemCount: mascotas.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index){
          return MascotaCard(mascota: mascotas[index]);
        },

        ),
      ),
      );
  }
}