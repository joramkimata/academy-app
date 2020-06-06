class CourseCategory {
  int id;
  String title;
  List<dynamic> courses;

  CourseCategory({this.id, this.title, this.courses});

  factory CourseCategory.fromJson(Map<String, dynamic> data) {
    return CourseCategory(
      id: data["id"],
      title: data["title"],
      courses: data["courses"],
    );
  }
}
