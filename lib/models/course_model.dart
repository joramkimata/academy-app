import 'package:flutter/foundation.dart';
import 'package:izwebacademy_app/io/course_category.dart';
import 'package:izwebacademy_app/io/index.dart';
import 'package:izwebacademy_app/support/http/http_calls.dart';

class CourseModel extends ChangeNotifier {
  Future<List<Course>> getLatestCourses() async {
    notifyListeners();
    var latest = await getCall('/courses/latest');
    List<dynamic> latestCourses = latest["data"]["courses"];
    return Future<List<Course>>.value(
        latestCourses.map((e) => Course.fromJson(e)).toList());
  }

  Future<List<CourseCategory>> getCourseCategories() async {
    notifyListeners();
    var categories = await getCall('/categories');
    List<dynamic> courseCategories = categories["data"]["categories"];
    return Future<List<CourseCategory>>.value(
        courseCategories.map((e) => CourseCategory.fromJson(e)).toList());
  }
}
