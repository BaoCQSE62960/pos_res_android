import 'package:flutter/material.dart';

import '../../Login/login_screen.dart';

// import '../../../../config/theme.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            child: Text(
              "Đăng nhập".toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
