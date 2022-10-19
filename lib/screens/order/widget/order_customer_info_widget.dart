import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/order/widget/buttons/custom_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderCustomerInfo extends StatelessWidget {
  OrderCustomerInfo({Key? key, required this.context}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          CustomOutlinedButton(
            function: () {
              showDialog(
                  context: this.context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Stack(
                        children: <Widget>[
                          Positioned(
                            right: -40.0,
                            top: -40.0,
                            child: InkResponse(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const CircleAvatar(
                                child: Icon(Icons.close),
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    child: const Text("Submit"),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            icons: const Icon(
              Icons.person_add,
              color: primaryColor,
            ),
            text: 'order.customer'.tr(),
          ),
          const Spacer(),
          CustomOutlinedButton(
            function: () {},
            icons: const Icon(
              Icons.note,
              color: primaryColor,
            ),
            text: 'order.note'.tr(),
          )
        ],
      ),
    );
  }
}
