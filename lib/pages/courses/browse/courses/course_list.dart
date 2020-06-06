import 'package:flutter/material.dart';
import 'package:izwebacademy_app/io/course_category.dart';
import 'package:izwebacademy_app/models/course_model.dart';
import 'package:izwebacademy_app/widgets/progressbar/progressbar.dart';
import 'package:provider/provider.dart';

class CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var courseModel = Provider.of<CourseModel>(context);

    return FutureBuilder<List<CourseCategory>>(
      future: courseModel.getCourseCategories(),
      builder: (_, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return circularProgress();
          default:
            if (snapshot.hasError) {
              return Container(
                height: 200,
                child: Text(
                  snapshot.error,
                ),
              );
            } else {
              List<Widget> courseMain = List<Widget>();

              snapshot.data.forEach((category) {
                courseMain.add(
                  _CourseList(
                    courseCategory: category.title,
                    courseCards: <Widget>[],
                  ),
                );
              });

              return Column(
                children: courseMain,
              );
            }
        }
      },
    );
  }
}

class _CourseList extends StatelessWidget {
  const _CourseList({
    Key key,
    @required this.courseCategory,
    @required this.courseCards,
  }) : super(key: key);

  final String courseCategory;
  final List<Widget> courseCards;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: 200), // **THIS is the important part**
      child: _Courses(
        courseCategory: courseCategory,
        courseCards: courseCards,
      ),
    );
  }
}

class _Courses extends StatelessWidget {
  const _Courses({
    Key key,
    @required this.courseCategory,
    @required this.courseCards,
  }) : super(key: key);

  final String courseCategory;
  final List<Widget> courseCards;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              courseCategory,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "See all >",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Divider(),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: 100), // **THIS is the important part**
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: courseCards,
          ),
        ),
      ],
    );
  }
}
