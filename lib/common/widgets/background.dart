import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    // this.topImage = "",
    // this.bottomImage = "",
  }) : super(key: key);

  // final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: primaryColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   child: Image.asset(
            //     topImage,
            //     width: 120,
            //   ),
            // ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: Image.asset(bottomImage, width: 120),
            // ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
