import 'package:flutter/material.dart';

import '../../../common/widgets/background.dart';
import '../../../common/widgets/responsive.dart';
import 'widget/WelcomeImage.dart';
import 'widget/login_btn.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            tablet: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: WelcomeImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: LoginBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // mobile: const MobileWelcomeScreen(),
          ),
        ),
      ),
    );
  }
}
