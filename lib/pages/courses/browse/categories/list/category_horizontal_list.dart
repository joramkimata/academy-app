import 'package:flutter/material.dart';
import 'package:izwebacademy_app/io/course_category.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';

class CategoryHorizontalList extends StatelessWidget {
  final List<CourseCategory> categories;

  const CategoryHorizontalList({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: 40), // **THIS is the important part**
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: categories
              .map((e) => _Chip(
                    textLabel: e.title,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    Key key,
    @required this.textLabel,
  }) : super(key: key);

  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 40,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Center(
                  child: Text(
                    textLabel,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
