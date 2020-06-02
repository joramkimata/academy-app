import 'package:flutter/material.dart';
import 'package:izwebacademy_app/models/course_model.dart';
import 'package:izwebacademy_app/pages/courses/browse/categories/course_categories.dart';
import 'package:izwebacademy_app/pages/courses/browse/courses/course_list.dart';
import 'package:izwebacademy_app/pages/courses/browse/latest/latest_courses.dart';
import 'package:izwebacademy_app/widgets/index.dart';
import 'package:izwebacademy_app/widgets/progressbar/progressbar.dart';
import 'package:provider/provider.dart';

class BrowseCoursesPage extends StatefulWidget {
  const BrowseCoursesPage({Key key}) : super(key: key);

  @override
  _BrowseCoursesPageState createState() => _BrowseCoursesPageState();
}

class _BrowseCoursesPageState extends State<BrowseCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: Column(
        children: <Widget>[
          LatestCourses(),
          CourseCategories(),
          CourseList(),
        ],
      ),
    );
  }
}
