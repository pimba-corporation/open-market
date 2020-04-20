import 'package:flutter/material.dart';

class MensajeBienvenida extends StatelessWidget {
  final String mensaje;

  MensajeBienvenida({@required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 360,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Image.asset(
                      'assets/imagenes/bienvenida.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: new Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[700].withOpacity(0.5), // opacidad
                      ),
                      constraints: BoxConstraints(
                        minHeight: 55,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            mensaje,
                            style:
                                Theme.of(context).textTheme.headline.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
