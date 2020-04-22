import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_state.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/entidades/perfilUsuario_entidad.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/entidades/usuario_entidad.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/widgets/perfilUsuarioDrawner/perfil_usuario_drawner.dart';
import 'package:open_market_movil/src/submodulos/submodulo-comun-movil/widgets/menu_idioma.dart';
import 'package:open_market_movil/src/submodulos/submodulo-internacionalizacion-movil/app_locations.dart';
import 'package:open_market_movil/src/widgets/mensaje_bienvenida.dart';

class InicioPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Datos de prueba, todo usar el authbloc
    final PerfilUsuarioEntidad perfilUsuarioEntidad = new PerfilUsuarioEntidad(
      nombres: 'Andrés David',
      apellidos: 'Velasco Yépez',
      telefono1: '09994558565',
      telefono2: '09994558565',
      fechaNacimiento: '02-02-1996',
    );
    final UsuarioEntidad usuarioPrueba =
    new UsuarioEntidad(correo: 'velasco.andrs@gmail.com', perfil: perfilUsuarioEntidad);

    AppLocalizations traductor = AppLocalizations.of(context);
    String mensajeBienvenida = traductor.translate('mensajeInicio');
    return  Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).translate('bienvenida'),
          ),
          actions: <Widget>[
            MenuIdioma(),
          ],
        ),
        drawer: PerfilUsuarioDrawner(usuario: usuarioPrueba),
        body: Container(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MensajeBienvenida(
                    mensaje: mensajeBienvenida,
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
