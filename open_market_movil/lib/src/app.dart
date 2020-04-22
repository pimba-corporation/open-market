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
  Locale idioma = Locale('es', 'EC');
  Brightness tema = Brightness.light;

  Locale escucharIdioma(PreferenciasState estado) {
    if (estado is IdiomaCambiado) {
      this.idioma = estado.locale;
    }
    return this.idioma;
    // return
    // return const Locale('es', 'EC');
  }

  Brightness escucharTema(PreferenciasState estado) {
    if (estado is TemaCambiado) {
      this.tema = estado.temaColor;
    }
    return this.tema;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferenciasBloc, PreferenciasState>(
      builder: (context, PreferenciasState estado) {
        return MaterialApp(
          supportedLocales: [
            const Locale('es', 'EC'),
            const Locale('en', 'US'),
          ],
          locale: this.escucharIdioma(estado),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate(NOMBRES_SUBMODULOS),
          ],
          title: 'Open Market',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: this.escucharTema(estado),
          ),
          home: InicioPantalla(),
        );
      },
    );
  }
}
