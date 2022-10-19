import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class PaymentTab extends StatelessWidget {
  const PaymentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: defaultPadding * 3,
          width: defaultPadding * 9.25,
          child: Hero(
            tag: "payment_check",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: activeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.fastfood,
                    size: defaultSize * 6,
                    color: textLightColor,
                  ),
                  Text(
                    "Chi tiết hóa đơn",
                    style: TextStyle(
                      fontSize: defaultSize * 2.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: defaultPadding * 0.5,
        ),
        SizedBox(
          height: defaultPadding * 3,
          width: defaultPadding * 9.25,
          child: Hero(
            tag: "payment_paid",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.payment,
                    size: defaultSize * 6,
                    color: textColor,
                  ),
                  Text(
                    "Chi tiết thanh toán",
                    style: TextStyle(
                      fontSize: defaultSize * 2.5,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
