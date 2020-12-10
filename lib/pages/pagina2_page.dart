import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream ,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
            return snapshot.hasData
              ? Text('Nombre: ${snapshot.data.nombre}')
              : Text('Página 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: (){

                final nuevoUsuario = Usuario(
                  nombre: 'Sebastian',
                  edad: 24
                );

                usuarioService.cargarUsuario(nuevoUsuario);
              },
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: (){
                usuarioService.cambiarEdad(20);
              },
            ),

            MaterialButton(
              child: Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: (){

              },
            ),

          ],
        ),
      ),
    );
  }
}