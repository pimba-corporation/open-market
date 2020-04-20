import 'package:flutter/material.dart';
import 'package:open_market_movil/src/submodulos/submodulo-internacionalizacion-movil/app_locations.dart';
import 'package:open_market_movil/src/widgets/mensaje_bienvenida.dart';

class InicioPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppLocalizations traductor = AppLocalizations.of(context);
    String mensajeBienvenida = traductor.translate('mensajeInicio');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('bienvenida'),
        ),
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
    );
  }
}
