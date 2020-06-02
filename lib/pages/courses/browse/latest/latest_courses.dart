import 'package:flutter/material.dart';
import 'package:izwebacademy_app/io/index.dart';
import 'package:izwebacademy_app/models/course_model.dart';
import 'package:izwebacademy_app/pages/courses/browse/latest/carousel/courses_carousel.dart';
import 'package:izwebacademy_app/widgets/progressbar/progressbar.dart';
import 'package:provider/provider.dart';

class LatestCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var courseModel = Provider.of<CourseModel>(context);

    return FutureBuilder<List<Course>>(
      future: courseModel.getLatestCourses(),
      builder: (_, AsyncSnapshot<List<Course>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
              height: 200,
              child: circularProgress(),
            );
          default:
            if (snapshot.hasError)
              return Container(
                height: 200,
                child: Text(
                  snapshot.error,
                ),
              );
            else
              return LatestCoursesCarousel(
                courses: snapshot.data,
              );
        }
      },
    );
  }
}
