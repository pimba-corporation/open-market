import 'package:flutter/material.dart';

class MensajeBienvenida extends StatelessWidget {
  final String mensaje;

  MensajeBienvenida({@required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
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
                      padding: EdgeInsets.all(5),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          mensaje,
                          style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 7.0, // has the effect of softening the shadow
                            spreadRadius: 1.0, // has the effect of extending the shadow
                            offset: Offset(
                              0, // horizontal
                              5.0, // vertical
                            ),
                          )
                        ],
                        color: Colors.white.withOpacity(1), // opacidad
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 100,
                      ),
                    ),
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
