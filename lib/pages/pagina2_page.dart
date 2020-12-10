import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: (usuarioService.existeUsuario) 
          ? Text('${usuarioService.usuario.nombre}')
          : Text('Página 2')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: (){
                final usuario = Usuario(
                  nombre: 'Sebastian',
                  edad: 24,
                  profesiones: ['Fullstack Developer', 'Jugador competitivo de COD']
                );
                usuarioService.usuario = usuario;
              },
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () => (usuarioService.existeUsuario)
                ? usuarioService.cambiarEdad(21)
                : null,
            ),

            MaterialButton(
              child: Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () => usuarioService.agregarProfesion(),
            ),

          ],
        ),
      ),
    );
  }
}