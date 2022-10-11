import 'package:flutter/material.dart';

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
        Row(
          children: [
            const Spacer(),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(radius),
            // child:
            Expanded(
              flex: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/logo.png"),
              ),
              // ),
              // child: Image.asset("assets/images/logo.png"),
            ),
            // ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
