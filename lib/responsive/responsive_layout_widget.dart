import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;

  const ResponsiveWidget(
      {super.key,
      required this.mobileScreenLayout,
      required this.webScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 768) {
        return mobileScreenLayout;
      } else {
        return webScreenLayout;
      }
    });
  }
}
