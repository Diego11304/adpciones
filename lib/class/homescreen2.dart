import 'package:flutter/material.dart';
import '../data/listdata.dart';
import '../data/listdata2.dart';
import 'cards.dart';

class HomeScreen2 extends StatefulWidget{
  HomeScreen2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();

  }
}

class _HomeScreenState extends State<HomeScreen2>{
  int _selectedIndex=0;

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
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mascotas.length,
                  itemBuilder: (context, index){
                    final mascota=mascotas[index];
                    return Container(
                      width: 160,
                      margin: EdgeInsets.only(right: 12),
                      child: MascotaCard(mascota: mascota),
                    );
                  },
                ),
              ),
              Text('mascotas extraviadas', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 20,),
              Expanded(
                  child: GridView.builder(
                    itemCount: mascotas2.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index){
                      return MascotaCard(mascota: mascotas2[index]);
                    },

                  )
              )
            ],
          )
        /* GridView.builder(
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

        ),*/
      ),
      bottomNavigationBar: NavigationBar(

      ),
    );
  }
}