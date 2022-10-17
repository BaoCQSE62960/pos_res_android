import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
import '../../config/routes.dart';
import 'widget/login_form.dart';
import 'widget/login_screen_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          tablet: Row(
            children: [
              const Expanded(
                child: LoginScreenImage(),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: textLightColor,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: const [
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: 4,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  height: 390,
                  // width: 390,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 420,
                        child: LoginForm(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: defaultPadding * 3),
            ],
          ),
        ),
      ),
    );
  }
}
