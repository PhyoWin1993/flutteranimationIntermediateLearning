import 'package:company_profilio/model/company.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard(this.course);
  BoxDecoration _createShadowBoxConor() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.4),
      borderRadius: new BorderRadius.circular(12.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black26,
          spreadRadius: 2.0,
          blurRadius: 10.0,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: _createShadowBoxConor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: _createThumbnail(),
          ),

          //
          Flexible(
            flex: 1,
            child: createCourseInfo(),
          )
        ],
      ),
    );
  }

  Widget _createThumbnail() {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: Stack(
        children: [
          Image.asset(course.thumbnail),

          //
          new Positioned(right: 12, bottom: 12, child: _createLinkButton())
        ],
      ),
    );
  }

  Widget _createLinkButton() {
    return new Material(
      color: Colors.white24,
      type: MaterialType.circle,
      child: new IconButton(
          icon: Icon(Icons.link),
          onPressed: () async {
            if (await canLaunch(course.url)) {
              await launch(course.url);
            }
          }),
    );
  }

  Widget createCourseInfo() {
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
      child: new Text(
        course.title,
        style: TextStyle(
          color: Colors.white.withOpacity(0.85),
        ),
      ),
    );
  }
}
