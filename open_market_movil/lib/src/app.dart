import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:open_market_movil/src/pantallas/inicio.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_bloc.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_state.dart';
import 'package:open_market_movil/src/submodulos/submodulo-internacionalizacion-movil/app_locations.dart';
import 'constantes/nombres-submodulos.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferenciasBloc, PreferenciasState>(
      builder: (context, PreferenciasState estado) {
        return MaterialApp(
          supportedLocales: [
            const Locale('es', 'EC'),
            const Locale('en', 'US'),
          ],
          locale: estado is IdiomaCambiado
              ? estado.locale
              : const Locale('es', 'EC'),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate(NOMBRES_SUBMODULOS),
          ],
          title: 'Open Market',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: InicioPantalla(),
        );
      },
    );
  }
}
