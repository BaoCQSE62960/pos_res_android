// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pos_res_android/config/theme.dart';
// import 'package:pos_res_android/repos/models/payment.dart';
// import 'package:pos_res_android/repos/services/momo_service.dart';
// import 'package:pos_res_android/repos/services/payment_service.dart';
// import 'package:pos_res_android/screens/Payment/widget/payment_input.dart';
// import 'package:pos_res_android/screens/Payment/widget/payment_method_item.dart';
// import 'package:pos_res_android/screens/Payment/widget/payment_top.dart';

// // ignore: must_be_immutable
// class PaymentMethod extends StatefulWidget {
//   List<Payment> list;
//   PaymentMethod({Key? key, required this.list}) : super(key: key);

//   @override
//   State<PaymentMethod> createState() => _PaymentMethodState();
// }

// class _PaymentMethodState extends State<PaymentMethod> {
//   List<Payment> methods = [];
//   int length = 0;
//   final PaymentService service = Get.put(PaymentService());
//   final MomoService momoService = MomoService();

//   Widget getMethodWidgets() {
//     List<Widget> list = <Widget>[];
//     for (var payment in methods) {
//       list.add(
//         SizedBox(
//           child: PaymentMethodItem(
//             payment: payment,
//             onPress: () {
//               setState(() {
//                 if (payment.isSelected == false) {
//                   for (var e in methods) {
//                     if (e.isSelected) {
//                       e.setIsSelected = false;
//                       break;
//                     }
//                   }
//                   payment.setIsSelected = true;
//                 } else {
//                   payment.setIsSelected = false;
//                 }
//               });
//             },
//           ),
//         ),
//       );
//     }
//     return Padding(
//       padding: const EdgeInsets.all(defaultPadding),
//       child: GridView(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//             crossAxisSpacing: defaultPadding,
//             mainAxisSpacing: defaultPadding,
//             childAspectRatio: 2,
//           ),
//           children: list),
//     );
//   }

//   dynamic getService() {
//     late Payment selectedPayment;
//     for (var payment in methods) {
//       if (payment.isSelected) {
//         selectedPayment = payment;
//         break;
//       }
//     }
//     if (selectedPayment.name.toUpperCase() == "MOMO") {
//       return momoService;
//     }
//     return null;
//   }

//   @override
//   void initState() {
//     super.initState();
//     methods = widget.list;
//     methods[0].setIsSelected = true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: defaultPadding * 39.6,
//       height: defaultPadding * 20,
//       color: textLightColor,
//       child: Column(
//         children: [
//           Container(
//             height: defaultPadding * 4,
//             color: textLightColor,
//             child: const TotalVND(),
//           ),
//           Container(
//               height: defaultPadding * 20,
//               color: deactiveLightColor,
//               child: Scaffold(
//                 backgroundColor: textLightColor,
//                 body: getMethodWidgets(),
//               )),
//           Container(
//             height: defaultPadding * 4,
//             width: defaultPadding * 43,
//             child: PaymentInput(service: getService()),
//             color: textLightColor,
//           ),
//         ],
//       ),
//     );
//   }
// }
