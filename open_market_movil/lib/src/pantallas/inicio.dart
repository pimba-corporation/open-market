import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_market_movil/src/constantes/lenguajes_soportados.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_bloc.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_event.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_state.dart';
import 'package:open_market_movil/src/submodulos/submodulo-internacionalizacion-movil/app_locations.dart';
import 'package:open_market_movil/src/widgets/mensaje_bienvenida.dart';

class InicioPantalla extends StatelessWidget {
  Widget generarCabeceraDrawner() {
    final cabecerarDrawner = UserAccountsDrawerHeader(
      accountEmail: Text('velasco.andrs@gmail.com'),
      accountName: Text('Andres Velasco'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
      ),
    );
    return cabecerarDrawner;
  }

  Widget generarItemsDrawner(AppLocalizations traductor) {
    return ListView(
      children: <Widget>[
        generarCabeceraDrawner(),
        ListTile(
          title: Text(traductor.translateText('drawner.opciones.perfil')),
          onTap: () {},
        ),
        ListTile(
          title: Text(traductor.translateText('drawner.opciones.acerca')),
          onTap: () {},
        )
      ],
    );
  }

  Widget generarAcciones(BuildContext context, AppLocalizations traductor) {
    return PopupMenuButton<String>(
      onSelected: (String langCode) {
        print('langcode ' + langCode);
        BlocProvider.of<PreferenciasBloc>(context).add(
          CambioIdiomaEvent(
            lenguaje: Locale(langCode),
          ),
        );
      },
      itemBuilder: (BuildContext contexto) {
        return LENGUAJES_SOPORTADOS.map(
          (String lenguaje) {
            return PopupMenuItem<String>(
              value: lenguaje,
              child: Text(
                traductor.translateText('appBar.acciones.menuLenguaje.' + lenguaje),
              ),
            );
          },
        ).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations traductor = AppLocalizations.of(context);
    String mensajeBienvenida = traductor.translate('mensajeInicio');
    return BlocListener<PreferenciasBloc, PreferenciasState>(
      listener: (context , state){

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).translate('bienvenida'),
          ),
          actions: <Widget>[
            generarAcciones(context, traductor),
          ],
        ),
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
        drawer: generarItemsDrawner(traductor),
      ),
    );

  }
}
