import 'package:flutter/material.dart';
import 'package:izwebacademy_app/io/course.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';
import 'package:izwebacademy_app/support/ui/action_button.dart';
import 'package:izwebacademy_app/widgets/header/header.dart';

class CourseEnrollPage extends StatefulWidget {
  final Map<String, dynamic> course;

  const CourseEnrollPage({Key key, this.course}) : super(key: key);

  @override
  _CourseEnrollPageState createState() => _CourseEnrollPageState();
}

class _CourseEnrollPageState extends State<CourseEnrollPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    Course _course = Course.fromJson(widget.course);

    return Container(
      child: Scaffold(
        appBar: header(context),
        body: Column(
          children: <Widget>[
            Container(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ActionButton(
                onClick: () {},
                labelText: 'Buy this Course',
                isLoading: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        widget.course["title"],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: new BoxDecoration(
                  color: AppColors.bgColor,
                ),
                child: new TabBar(
                  controller: _controller,
                  tabs: [
                    new Tab(
                      text: 'OVERVIEW',
                    ),
                    new Tab(
                      text: 'CONTENTS',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(_course.coverImageUrl)
                          ],
                        ),
                      ),
                    ),
                    Text("Contents"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
