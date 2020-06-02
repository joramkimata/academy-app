import 'package:flutter/foundation.dart';
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

  Future<Map<String, dynamic>> getCourseCategories() {
    return getCall('/categories');
  }
}
