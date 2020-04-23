import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:open_market_movil/src/pantallas/inicio.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_bloc.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_state.dart';
import 'package:open_market_movil/src/submodulos/submodulo-internacionalizacion-movil/app_locations.dart';
import 'constantes/nombres-submodulos.dart';

class App extends StatelessWidget {
  // Este widget es la raiz de la aplicacion.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferenciasBloc, PreferenciasState>(
      builder: (context, PreferenciasState estado) {
        return MaterialApp(
          supportedLocales: [
            const Locale('es', 'EC'),
            const Locale('en', 'US'),
          ],
          locale: estado.idioma,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate(NOMBRES_SUBMODULOS),
          ],
          title: 'Open Market',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: estado.tema,
          ),
          home: InicioPantalla(),
        );
      },
    );
  }
}
