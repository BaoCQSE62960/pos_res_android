import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

import '../../common/widgets/background.dart';
import '../../common/widgets/responsive.dart';
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
                  decoration: const BoxDecoration(
                    color: textLightColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
                  ),
                  height: 390,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
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
