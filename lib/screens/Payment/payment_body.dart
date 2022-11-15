import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/common/widgets/web_view.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/payment.dart';
import 'package:pos_res_android/repos/services/momo_service.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_method_item.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_paid_item.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_top.dart';

class PaymentBody extends StatefulWidget {
  int checkId;
  List<Payment> list;
  List<PaymentProcess> paidList;
  PaymentBody(
      {Key? key,
      required this.list,
      required this.paidList,
      required this.checkId})
      : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  List<Payment> methods = [];
  String amount = '';
  String msg = '';
  late int checkId;
  late List<PaymentProcess> paidList;

  bool checkDuplicatePaid(Payment payment) {
    for (var e in paidList) {
      if (payment.id == e.id) {
        return false;
      }
    }
    return true;
  }

  Future<void> _simpleFailDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WarningPopUp(msg: msg);
      },
    );
  }

  Widget getTextWidgets() {
    List<Widget> list = <Widget>[];
    for (var payment in methods) {
      list.add(
        SizedBox(
          child: PaymentMethodItem(
            payment: payment,
            onPress: () {
              setState(() {
                if (payment.isSelected == false) {
                  for (var e in methods) {
                    if (e.isSelected) {
                      e.setIsSelected = false;
                      break;
                    }
                  }
                  payment.setIsSelected = true;
                }
              });
            },
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: 2,
          ),
          children: list),
    );
  }

  Payment getPayment() {
    late Payment selectedPayment;
    for (var payment in methods) {
      if (payment.isSelected) {
        selectedPayment = payment;
        break;
      }
    }
    return selectedPayment;
  }

  @override
  void initState() {
    super.initState();
    methods = widget.list;
    methods[0].setIsSelected = true;
    paidList = widget.paidList;
    checkId = widget.checkId;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: textLightColor,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: defaultPadding * 39.6,
                height: defaultPadding * 20,
                color: textLightColor,
                child: Column(
                  children: [
                    Container(
                      height: defaultPadding * 4,
                      color: textLightColor,
                      child: const TotalVND(),
                    ),
                    Container(
                        height: defaultPadding * 20,
                        color: deactiveLightColor,
                        child: Scaffold(
                          backgroundColor: textLightColor,
                          body: getTextWidgets(),
                        )),
                    Container(
                      height: defaultPadding * 4,
                      width: defaultPadding * 43,
                      child: paymentInput(context, getPayment()),
                      color: textLightColor,
                    ),
                  ],
                ),
              )),
          const Divider(color: dividerColor),
          Expanded(
            flex: 1,
            //
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: defaultPadding * 35,
                  height: defaultPadding * 43.5,
                  decoration: const BoxDecoration(
                    color: textLightColor,
                  ),
                  child: PaymentPaidItem(
                    paidList: paidList,
                    checkId: checkId,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentInput(BuildContext context, Payment payment) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: defaultPadding * 24,
          decoration: const BoxDecoration(
            color: selectedColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Flexible(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  amount = value;
                });
              },
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              cursorColor: primaryColor,
              decoration: const InputDecoration(
                filled: true,
                fillColor: selectedColor,
                prefixIconColor: primaryColor,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none,
                ),
                hintText: "Nhập số tiền",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.attach_money),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            width: defaultPadding * 8,
            decoration: const BoxDecoration(
              color: activeColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: activeColor,
                elevation: 0,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () async {
                //
                if (checkDuplicatePaid(payment)) {
                  //
                  if (payment.name.toUpperCase() == "MOMO") {
                    MomoService service = MomoService();
                    String url = await service.getPayment(amount);
                    var result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayWebView(url: url),
                        ));
                    print(result);
                    if (result != null && result) {
                      paidList.add(PaymentProcess(
                          id: payment.id,
                          name: payment.name,
                          amount: num.parse(amount)));
                    }
                    // else in lỗi
                  } else if (payment.name.toUpperCase() == "TIỀN MẶT") {
                    print(amount);

                    paidList.add(PaymentProcess(
                        id: payment.id,
                        name: payment.name,
                        amount: num.parse(amount)));
                  }
                  setState(() {});
                } else {
                  msg = "Phương thức thanh toán này đã sử dụng";
                  _simpleFailDialog();
                }
              },
              //

              //
              // onPressed: () => exit(0),
              child: Text(
                "Xác nhận".toUpperCase(),
              ),
            ),
          ),
        ),
        // const SizedBox(height: defaultPadding),
        // Hero(
        //   tag: "close_btn",
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       primary: voidColor,
        //     ),
        //     onPressed: () => SystemNavigator.pop(),
        //     // onPressed: () => exit(0),
        //     child: Text(
        //       "Thoát".toUpperCase(),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: defaultPadding),
      ],
    );
  }
}