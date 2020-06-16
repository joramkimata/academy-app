import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
        body: ListView(
          children: <Widget>[
            _Content(widget: widget, controller: _controller, course: _course)
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key key,
    @required this.widget,
    @required TabController controller,
    @required Course course,
  })  : _controller = controller,
        _course = course,
        super(key: key);

  final CourseEnrollPage widget;
  final TabController _controller;
  final Course _course;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Divider(
          thickness: 4,
        ),
        _ContentCard(
          title: 'Description',
          content: _course.description,
        ),
        _ContentCard(
          title: 'Requirements',
          content: _course.requirements,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Curriculum",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Lectures")
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContentCard extends StatelessWidget {
  final String title;
  final String content;

  const _ContentCard({Key key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        child: ExpandableNotifier(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                      ),
                      header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      collapsed: Html(
                        data: content.substring(0, 50) + "....",
                      ),
                      expanded: Html(
                        data: content,
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
