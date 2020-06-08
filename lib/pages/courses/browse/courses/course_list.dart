import 'package:flutter/material.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/components/button/gf_button_bar.dart';
import 'package:getflutter/components/card/gf_card.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:izwebacademy_app/io/course.dart';
import 'package:izwebacademy_app/io/course_category.dart';
import 'package:izwebacademy_app/models/course_model.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';
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
                    courseCards: category.courses,
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
  final List<dynamic> courseCards;

  @override
  Widget build(BuildContext context) {
    return _Courses(
      courseCategory: courseCategory,
      courseCards: courseCards,
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
  final List<dynamic> courseCards;

  @override
  Widget build(BuildContext context) {
    List<Widget> courses = List();

    courseCards.forEach((element) {
      courses.add(
        Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: NetworkImage(
                        element["cover_image_url"]
                            .toString()
                            .replaceAll("localhost", "10.0.2.2"),
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      element["title"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "\$200",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 28,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "\$10",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 28,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                        color: AppColors.bgColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "Enroll Now!",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      );
    });

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
              "",
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
              BoxConstraints(maxHeight: 330), // **THIS is the important part**
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: courses,
          ),
        ),
        SizedBox(height: 0),
      ],
    );
  }
}
