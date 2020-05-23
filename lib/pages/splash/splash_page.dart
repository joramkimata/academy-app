import 'package:flutter/material.dart';
import 'package:izwebacademy_app/support/colors/HexColor.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              HexColor("3E416D"),
              HexColor("3E416D"),
              HexColor("3E416D"),
              HexColor("3E416D"),
              Colors.white54,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 180.0,
              height: 180.0,
              padding: EdgeInsets.all(100),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logos/logo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
