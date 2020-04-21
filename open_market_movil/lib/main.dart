import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_market_movil/src/app.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/auth_bloc/auth_bloc.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/blocs/preferencias_bloc/preferencias_bloc.dart';
import 'package:open_market_movil/src/submodulos/submodulo-auth0-movil/repositorios/almacenamiento_local_repositorio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AlmacenamientoLocalRepositorio almacenamientoLocal =
      AlmacenamientoLocalRepositorio();
  await almacenamientoLocal.obtenerInformacionGuardada();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(
            almacenamientoLocalRepositorio: almacenamientoLocal,
          ),
        ),
        BlocProvider<PreferenciasBloc>(
          create: (BuildContext context) => PreferenciasBloc(
            almacenamientoLocalRepositorio: almacenamientoLocal,
          ),
        ),
      ],
      child: App(),
    ),
  );
}
