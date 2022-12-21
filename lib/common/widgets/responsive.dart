import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget? tablet;

  const Responsive({
    Key? key,
    this.tablet,
  }) : super(key: key);

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 576 &&
      MediaQuery.of(context).size.width <= 992;

  @override
  Widget build(BuildContext context) {
    return tablet!;
  }
}
