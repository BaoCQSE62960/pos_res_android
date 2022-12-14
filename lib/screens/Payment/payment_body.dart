import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/common/widgets/web_view.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/payment.dart';
import 'package:pos_res_android/repos/models/waiter/check.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/repos/services/cashier/momo_service.dart';
import 'package:pos_res_android/repos/services/cashier/payment_service.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_method_item.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_paid_item.dart';
import 'package:pos_res_android/screens/Payment/widget/payment_top.dart';

// ignore: must_be_immutable
class PaymentBody extends StatefulWidget {
  Check check;
  List<Payment> list;
  List<PaymentProcess> paidList;
  PaymentBody(
      {Key? key,
      required this.list,
      required this.paidList,
      required this.check})
      : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  final LocalStorage storage = LocalStorage('paid');
  List<Payment> methods = [];
  String amount = '';
  String msg = '';
  late Check check;
  late List<PaymentProcess> paidList;

  String getAmount() {
    String result = '';
    num total = check.totalamount.round();
    for (var e in paidList) {
      total -= e.amount;
    }
    result = total.toString();
    return result;
  }

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

  Widget getMethodWidgets() {
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
    check = widget.check;
    amount = getAmount();
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
                      child: TotalVND(amount: getAmount()),
                    ),
                    Container(
                        height: defaultPadding * 20,
                        color: deactiveLightColor,
                        child: Scaffold(
                          backgroundColor: textLightColor,
                          body: getMethodWidgets(),
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
                      checkId: check.checkid,
                      undo: () {
                        setState(() {
                          paidList.clear();
                          storage.deleteItem(check.checkid.toString());
                        });
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentInput(BuildContext context, Payment payment) {
    return Scaffold(
      backgroundColor: textLightColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              width: defaultPadding * 24,
              decoration: const BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    amount = text;
                  });
                },
                initialValue: amount,
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
                  hintText: "Nh???p s??? ti???n",
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
                  if (num.parse(amount) > 0 &&
                      num.parse(amount) <= num.parse(getAmount())) {
                    List<CheckDetail> list = check.checkDetail;
                    bool confirm = true;
                    for (var checkDetail in list) {
                      if (checkDetail.status != "SERVED") {
                        confirm = false;
                      }
                    }
                    if (confirm) {
                      if (checkDuplicatePaid(payment)) {
                        String transactionid = '';
                        if (payment.name.toUpperCase() == "MOMO") {
                          MomoService service = MomoService();
                          List<String> inform =
                              await service.getPayment(amount);
                          String url = inform[0];
                          transactionid = inform[1];
                          var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DisplayWebView(url: url),
                              ));
                          if (result != null && result) {
                            paidList.add(PaymentProcess(
                                transactionid: transactionid,
                                id: payment.id,
                                name: payment.name,
                                amount: num.parse(amount)));
                            storage.setItem(check.checkid.toString(), paidList);
                          }
                        } else {
                          paidList.add(PaymentProcess(
                              transactionid: transactionid,
                              id: payment.id,
                              name: payment.name,
                              amount: num.parse(amount).round()));
                          storage.setItem(check.checkid.toString(), paidList);
                        }
                        num current = num.parse(getAmount());
                        if (current == 0) {
                          PaymentService service = PaymentService();
                          bool result = await service.processCheck(
                              check.checkid, paidList, context);
                          if (result) {
                            Navigator.of(context).pop();
                          }
                        }
                        setState(() {});
                      } else {
                        msg = "Ph????ng th???c thanh to??n n??y ???? s??? d???ng";
                        _simpleFailDialog();
                      }
                    } else {
                      msg = "????n v???n c??n m??n ch??a x??? l??!";
                      _simpleFailDialog();
                    }
                  } else {
                    msg = "Xin nh???p s??? ti???n h???p l???";
                    _simpleFailDialog();
                  }
                },
                child: Text(
                  "X??c nh???n".toUpperCase(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
