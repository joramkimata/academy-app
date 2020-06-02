class Course {
  String coverImageUrl;

  Course({this.coverImageUrl,});

  factory Course.fromJson(Map<String, dynamic> data) {
    return Course(
      coverImageUrl: data["cover_image_url"]
    );
  }
}