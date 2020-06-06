import 'package:flutter/material.dart';
import 'package:izwebacademy_app/io/course_category.dart';
import 'package:izwebacademy_app/models/course_model.dart';
import 'package:izwebacademy_app/pages/courses/browse/categories/list/category_horizontal_list.dart';
import 'package:izwebacademy_app/widgets/progressbar/progressbar.dart';
import 'package:provider/provider.dart';

class CourseCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var courseModel = Provider.of<CourseModel>(context);

    return FutureBuilder<List<CourseCategory>>(
        future: courseModel.getCourseCategories(),
        builder: (_, AsyncSnapshot<List<CourseCategory>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return linearProgress();
            default:
              if (snapshot.hasError)
                return Container(
                  height: 200,
                  child: Text(
                    snapshot.error,
                  ),
                );
              else
                return CategoryHorizontalList(
                  categories: snapshot.data,
                );
          }
        });
  }
}
