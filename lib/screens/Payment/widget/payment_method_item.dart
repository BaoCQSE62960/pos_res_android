import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/payment.dart';

// ignore: must_be_immutable
class PaymentMethodItem extends StatefulWidget {
  Payment payment;
  Function() onPress;
  PaymentMethodItem({Key? key, required this.payment, required this.onPress})
      : super(key: key);

  @override
  State<PaymentMethodItem> createState() => _PaymentMethodItemState();
}

class _PaymentMethodItemState extends State<PaymentMethodItem> {
  late Payment payment;
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    payment = widget.payment;
  }

  @override
  Widget build(BuildContext context) {
    if (payment.isSelected) {
      currentColor = selectColor;
    } else {
      currentColor = selectedColor;
    }

    return Container(
      decoration: BoxDecoration(
        color: deactiveColor,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: shadowColor,
            blurRadius: 4,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: SizedBox(
        width: defaultPadding * 11,
        height: defaultPadding * 5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: currentColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          onPressed: widget.onPress,
          child: Container(
            color: currentColor,
            height: defaultPadding * 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  payment.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
