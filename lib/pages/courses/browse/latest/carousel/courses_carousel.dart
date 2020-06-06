import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:izwebacademy_app/io/index.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';

class LatestCoursesCarousel extends StatelessWidget {
  final List<Course> courses;

  const LatestCoursesCarousel({this.courses});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        dotColor: AppColors.bgColor,
        dotSize: 5,
        onImageTap: (index) {},
        images: courses
            .map((e) => NetworkImage(
                e.coverImageUrl.toString().replaceAll('localhost', '10.0.2.2')))
            .toList(),
      ),
    );
  }
}
