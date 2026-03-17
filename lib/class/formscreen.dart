import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/mascota.dart';

class FormScreen extends StatefulWidget{
  final Mascota mascota;
  FormScreen({
    super.key,
    required this.mascota
  });
  @override
  State<StatefulWidget> createState() {
    return _FormScreen();
  }
}

class _FormScreen extends State<FormScreen>{
  final _formKey=GlobalKey<FormState>();

  final nombreController=TextEditingController();
  final telefonoController=TextEditingController();
  final emailController=TextEditingController();
  final direccionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text ('adoptar a ${widget.mascota.nombre}'),
    ),
    body: Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const Text(
              "Datos del adoptante", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: nombreController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Nombre Completo',
                border: OutlineInputBorder(),
              ),
              validator:validarNombre,
            ),

        SizedBox(height: 20),
        TextFormField(
          controller: telefonoController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Telefono',
            border: OutlineInputBorder(),
          ),
          validator:validarTelefono,
        ),


        SizedBox(height: 20),
        TextFormField(
          controller: emailController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'Correo Electronico',
            border: OutlineInputBorder(),
          ),
          validator:validarEmail,
        ),

          SizedBox(height: 20),
          TextFormField(
            controller: direccionController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Nombre Completo',
              border: OutlineInputBorder(),
            ),
            validator:validarDireccion,
          ),
          SizedBox(height: 30,),
            SizedBox(
              height: 50,
              child: FilledButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Solicitud enviada correctamente')
                      ),
                    );
                    Navigator.pop(context);
                    }
                  },
                  child: Text('Enviar solicitud de adopcion'),
              ),
            )
          ],
        ),
      ),
    ),
  );
  }
}

String? validarNombre(String? value){
  if (value==null || value.isEmpty){
    return"ingrese su nombre";
  }
  RegExp regexp=RegExp(r'^[a-zA-Záéió]+$');
}

