class CourseCategory {
  int id;
  String title;

  CourseCategory({this.id, this.title});

  factory CourseCategory.fromJson(Map<String, dynamic> data) {
    return CourseCategory(
      id: data["id"],
      title: data["title"],
    );
  }
}
