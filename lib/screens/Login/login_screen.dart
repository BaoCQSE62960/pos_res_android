import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Login/widget/login_form.dart';
import 'package:pos_res_android/screens/Login/widget/login_screen_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          tablet: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LoginScreenImage(),
              Container(
                height: 390,
                width: 420,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 360,
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
