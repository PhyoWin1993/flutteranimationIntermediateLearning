import 'package:meta/meta.dart';

class Company {
  Company(
      {@required this.name,
      @required this.location,
      @required this.logo,
      @required this.courses,
      @required this.about,
      @required this.backdropPhoto});
  final String name, location, backdropPhoto, logo, about;
  List<Course> courses;
}

class Course {
  Course({@required this.title, @required this.thumbnail, @required this.url});
  final String title, thumbnail, url;
}
