import 'package:company_profilio/repo/repo.dart';
import 'package:company_profilio/ui/company_detail_page.dart';
import 'package:flutter/material.dart';

class CompanyDetailsAnimator extends StatefulWidget {
  @override
  _CompanyDetailsAnimatorState createState() => _CompanyDetailsAnimatorState();
}

class _CompanyDetailsAnimatorState extends State<CompanyDetailsAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1780), vsync: this);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new CompanyDetailsPage(
        company: RepoData.bawp, controller: _controller);
  }
}
