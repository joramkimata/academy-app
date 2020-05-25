import 'package:flutter/material.dart';
import 'package:izwebacademy_app/widgets/index.dart';

class BrowseCoursesPage extends StatelessWidget {
  const BrowseCoursesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
    );
  }
}
