import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../Login/login_screen.dart';

class TableItem extends StatelessWidget {
  const TableItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "table_demo_btn",
      child: GestureDetector(
        onDoubleTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LoginScreen();
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: textLightColor,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: shadowColor,
                blurRadius: 4,
                offset: Offset(0, 4), // Shadow position
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero),
                ),
                // color: activeColor,
                height: defaultPadding * 2,
                width: defaultPadding * 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: defaultPadding * 2,
                    ),
                    const Text(
                      "Bàn ?",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textLightColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "(0)",
                          style: TextStyle(fontSize: 12, color: textLightColor),
                        ),
                        Container(
                          width: defaultPadding * 0.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: defaultPadding * 8,
                height: defaultPadding * 4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: textLightColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0)),
                      side: BorderSide(color: primaryColor),
                    ),
                    // maximumSize:
                    //     const Size(defaultPadding * 8, defaultPadding * 8),
                  ),
                  onPressed: () {},
                  child: Column(
                    children: [
                      // Container(
                      //   height: defaultPadding * 0.5,
                      // ),

                      // Container(
                      //   color: activeColor,
                      //   height: defaultPadding * 2,
                      //   width: defaultPadding * 12,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Container(
                      //         width: defaultPadding,
                      //       ),
                      //       const Text(
                      //         "Bàn ?",
                      //         style: TextStyle(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       const Text(
                      //         "(0)",
                      //         style: TextStyle(
                      //           fontSize: 12,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        color: textLightColor,
                        height: defaultPadding * 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "1.500.000".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // minimumSize: const Size(24, 24),
                                backgroundColor: warningColor,
                              ),
                              child: const Icon(
                                Icons.dining,
                                size: defaultPadding * 0.8,
                                color: textLightColor,
                              ),
                            ),
                          ),
                          Container(
                            width: defaultPadding * 0.3,
                          ),
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // minimumSize: const Size(24, 24),
                                backgroundColor: voidColor,
                              ),
                              child: const Icon(
                                Icons.cancel,
                                size: defaultPadding,
                                color: textLightColor,
                              ),
                            ),
                          ),
                          Container(
                            width: defaultPadding * 0.3,
                          ),
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // minimumSize: const Size(24, 24),
                                backgroundColor: shadowColor,
                              ),
                              child: const Icon(
                                Icons.timelapse_rounded,
                                size: defaultPadding,
                                color: textLightColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
