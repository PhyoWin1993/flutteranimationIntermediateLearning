import 'package:company_profilio/model/company.dart';
import 'package:company_profilio/ui/company_detail_info_animation.dart';
import 'package:company_profilio/ui/couse_card.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as dartui;

class CompanyDetailsPage extends StatelessWidget {
  final Company company;
  final CompanyDetailsIntroAnimation animation;

  CompanyDetailsPage(
      {@required this.company, @required AnimationController controller})
      : animation = new CompanyDetailsIntroAnimation(controller);

  Widget _createAnimation() {
    return new Stack(
      fit: StackFit.expand,
      children: [
        //
        Opacity(
          opacity: animation.bgdropOpacity.value,
          child: Image.asset(
            company.backdropPhoto,
            fit: BoxFit.cover,
          ),
        ),

        //

        BackdropFilter(
          filter: dartui.ImageFilter.blur(
              sigmaX: animation.bgdropBlur.value,
              sigmaY: animation.bgdropBlur.value),
          child: new Container(
            color: Colors.black.withOpacity(0.3),
            child: _createContent(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new AnimatedBuilder(
            animation: animation.controller,
            builder: (_, Widget child) {
              return _createAnimation();
            }));
  }

  Widget _createContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          _createLogoAvatar(),

          //
          _createAboutCompany(),

          //

          _createCourseScroller()
        ],
      ),
    );
  }

  Widget _createLogoAvatar() {
    return new Transform(
      transform: new Matrix4.diagonal3Values(
          animation.avatarSize.value, animation.avatarSize.value, 1.0),
      alignment: Alignment.center,
      child: new Container(
        width: double.infinity,
        height: 110.0,
        margin: const EdgeInsets.only(top: 32.0, left: 19.0),
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            //
            CircleAvatar(
              backgroundColor: Colors.white,
              child: new Image.asset(
                company.logo,
                width: 100.0,
                height: 100.0,
              ),
            ),

            //

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Build App With Paulo",
                style: TextStyle(
                    fontSize: 19.0 * animation.avatarSize.value + 2.0,
                    color: Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }

  //

  Widget _createAboutCompany() {
    return new Padding(
      padding: const EdgeInsets.only(top: 14.0, left: 14.0, right: 14.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          new Text(
            company.name,
            style: new TextStyle(
              color: Colors.white.withOpacity(animation.nameOpacity.value),
              fontSize: 30.0 * animation.avatarSize.value + 2.0,
              fontWeight: FontWeight.w500,
            ),
          ),

          //

          new Text(company.location,
              style: new TextStyle(
                color:
                    Colors.white.withOpacity(animation.locationOpacity.value),
              )),

          //

          new Container(
            color: Colors.white.withOpacity(0.79),
            margin: const EdgeInsets.symmetric(vertical: 14.0),
            width: animation.dividerWidth.value,
            height: 2.0,
          ),

          //
          new Text(
            company.about,
            style: new TextStyle(
              color: Colors.white.withOpacity(animation.aboutOpacity.value),
              height: 1.4,
            ),
          )
        ],
      ),
    );
  }

  _createCourseScroller() {
    return new Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Transform(
        transform: Matrix4.translationValues(
            0.0, animation.courseScrollerXTranslation.value, 0.0),
        child: SizedBox.fromSize(
          size: new Size.fromHeight(250.0),
          child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: company.courses.length,
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              itemBuilder: (_, int index) {
                var course = company.courses[index];
                return new CourseCard(course);
              }),
        ),
      ),
    );
  }

  // _createCourseScroller() {
  //   return new Container(
  //     height: 250.0,
  //     child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: company.courses.length,
  //         padding: const EdgeInsets.symmetric(horizontal: 7.0),
  //         itemBuilder: (_, int index) {
  //           var course = company.courses[index];
  //           return new CourseCard(course);
  //         }),
  //   );
  // }
}
