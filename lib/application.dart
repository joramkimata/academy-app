import 'package:flutter/material.dart';
import 'package:izwebacademy_app/models/auth_model.dart';
import 'package:izwebacademy_app/models/course_model.dart';
import 'package:izwebacademy_app/routes.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/logos/app_logo.jpg'), context);
    precacheImage(AssetImage('assets/logos/app_logo-2.jpg'), context);

    return Container(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthModel>(
            create: (_) => AuthModel(),
          ),
          ChangeNotifierProvider<CourseModel>(
            create: (_) => CourseModel(),
          ),
        ],
        child: MaterialApp(
          title: 'Izweb Academy',
          theme: ThemeData(
            primaryColor: Colors.deepPurple,
            fontFamily: 'GothamRounded',
          ),
          initialRoute: '/',
          routes: routes,
        ),
      ),
    );
  }
}
