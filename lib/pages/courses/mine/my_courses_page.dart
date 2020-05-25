import 'package:flutter/material.dart';
import 'package:izwebacademy_app/widgets/index.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
    );
  }
}
