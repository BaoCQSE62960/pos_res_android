import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class LoginScreenImage extends StatelessWidget {
  const LoginScreenImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Text(
        //   "CHÀO MỪNG ĐẾN VỚI",
        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        // ),
        const SizedBox(height: defaultPadding * 2),
        Container(
          width: 390,
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
            children: [
              // const Spacer(),
              Expanded(
                flex: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              // const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
