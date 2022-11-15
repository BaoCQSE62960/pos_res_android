// import 'package:flutter/material.dart';
// import 'package:pos_res_android/config/theme.dart';
// import 'package:pos_res_android/screens/Bill/bill_detail_screen.dart';

// class AllBillDetailBtn extends StatelessWidget {
//   const AllBillDetailBtn({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: "all_bill_detail_btn",
//       child: SizedBox(
//         height: defaultPadding * 2.5,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: activeColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return const BillDetailScreen();
//                 },
//               ),
//             );
//           },
//           child: Text(
//             "Chi tiết".toUpperCase(),
//           ),
//         ),
//       ),
//     );
//   }
// }
