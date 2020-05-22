import 'package:flutter/material.dart';
import 'package:izwebacademy_app/routes.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'Izweb Academy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
