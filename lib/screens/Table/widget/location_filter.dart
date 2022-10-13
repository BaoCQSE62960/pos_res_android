// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class LocationFilter extends StatefulWidget {
  const LocationFilter({Key? key}) : super(key: key);

  @override
  State<LocationFilter> createState() => _LocationFilterState();
}

class _LocationFilterState extends State<LocationFilter> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: textLightColor,
          child: SizedBox(
            // width: defaultPadding * 6,
            child: Column(
              children: [
                Container(
                  height: defaultPadding * 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      width: defaultPadding * 0.5,
                    ),

                    Hero(
                      tag: "allLocation_btn",
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          minimumSize: const Size(100, 50),
                          backgroundColor: selectColor,
                          // padding: const EdgeInsets.all(15),
                        ),
                        // color: selectColor,
                        // padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Tất cả',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: defaultPadding * 0.5,
                    ),
                    Hero(
                      tag: "floor1_btn",
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          minimumSize: const Size(100, 50),
                          backgroundColor: selectColor,
                          // padding: const EdgeInsets.all(15),
                        ),
                        // color: selectColor,
                        // padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Lầu 1',
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    // Hero(
                    //   tag: "floor1_btn",
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: activeColor,
                    //     ),
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) {
                    //             return const LoginScreen();
                    //           },
                    //         ),
                    //       );
                    //     },
                    //     child: Text(
                    //       "Lầu 1".toUpperCase(),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Container(
                  height: defaultPadding * 0.5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// class LocationFilter extends StatelessWidget {
//   const LocationFilter({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         SizedBox(
//           width: defaultPadding * 6,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             // mainAxisSize: MainAxisSize.max,
//             // crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               FlatButton(
//                 onPressed: () => {},
//                 color: activeColor,
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   // Replace with a Row for horizontal icon + text
//                   children: const <Widget>[
//                     Icon(
//                       Icons.table_bar,
//                       size: 50,
//                       color: textLightColor,
//                     ),
//                     Text(
//                       "SƠ ĐỒ BÀN",
//                       style: TextStyle(
//                         fontSize: 10.5,
//                         fontWeight: FontWeight.w700,
//                         color: textLightColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 color: activeColor,
//                 height: defaultPadding * 31,
//               ),
//               FlatButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return const LoginScreen();
//                       },
//                     ),
//                   );
//                 },
//                 color: activeColor,
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   // Replace with a Row for horizontal icon + text
//                   children: const <Widget>[
//                     Icon(
//                       Icons.logout,
//                       size: 50,
//                       color: textLightColor,
//                     ),
//                     Text(
//                       'ĐĂNG XUẤT',
//                       style: TextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.w700,
//                         color: textLightColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }