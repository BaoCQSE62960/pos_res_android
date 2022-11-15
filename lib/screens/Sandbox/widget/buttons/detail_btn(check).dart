// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:pos_res_android/config/theme.dart';
// import 'package:pos_res_android/screens/Check/check_detail_screen.dart';

// class AllCheckDetailBtn extends StatelessWidget {
//   const AllCheckDetailBtn({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: "all_check_detail_btn",
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
//                   return const CheckDetailScreen();
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
