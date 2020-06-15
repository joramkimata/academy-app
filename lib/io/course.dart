class Course {
  String coverImageUrl;
  String title;
  String description;
  String requirements;

  Course({
    this.coverImageUrl,
    this.title,
    this.description,
    this.requirements,
  });

  factory Course.fromJson(Map<String, dynamic> data) {
    return Course(
      coverImageUrl: data["cover_image_url"],
      title: data["title"],
      description: data["description"],
      requirements: data["requirements"],
    );
  }
}
