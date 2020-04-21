import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:open_market_movil/src/pantallas/inicio.dart';
import 'package:open_market_movil/src/submodulos/submodulo-internacionalizacion-movil/app_locations.dart';

import 'constantes/nombres-submodulos.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en'),
        Locale('es'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate(NOMBRES_SUBMODULOS),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Open Market',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InicioPantalla(),
    );
  }
}