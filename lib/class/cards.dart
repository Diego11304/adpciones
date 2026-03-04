import 'package:adopcionesmascotas/model/mascota.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MascotaCard extends StatelessWidget{
  final Mascota mascota;

  MascotaCard({super.key, required this.mascota});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: (){
        /*Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_)=>DetalleMascotaScreen(mascota: mascota)
            )
        );*/
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    mascota.imagen,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
            ),
            Padding(padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mascota.nombre, style: Theme.of(context).textTheme.titleMedium?.copyWith
                    (fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text('${mascota.tipo} ${mascota.edad} años')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}