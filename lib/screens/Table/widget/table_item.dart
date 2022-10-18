import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class TableItem extends StatelessWidget {
  const TableItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "table_demo_btn",
      child: GestureDetector(
        onDoubleTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: deactiveColor,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: shadowColor,
                blurRadius: 3,
                offset: Offset(0, 3), // Shadow position
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
                  ),
                ),
                height: defaultPadding * 2,
                width: defaultPadding * 11,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: defaultPadding * 2,
                    ),
                    const Text(
                      "Bàn 1",
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
                width: defaultPadding * 11,
                height: defaultPadding * 5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: textLightColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
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
                            width: defaultPadding * 2.5,
                            height: defaultPadding * 2.5,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: warningColor,
                              ),
                              child: const Icon(
                                Icons.dining,
                                size: defaultPadding * 1.5,
                                color: textLightColor,
                              ),
                            ),
                          ),
                          Container(
                            width: defaultPadding * 0.3,
                          ),
                          SizedBox(
                            width: defaultPadding * 2.5,
                            height: defaultPadding * 2.5,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: voidColor,
                              ),
                              child: const Icon(
                                Icons.cancel,
                                size: defaultPadding * 1.5,
                                color: textLightColor,
                              ),
                            ),
                          ),
                          Container(
                            width: defaultPadding * 0.3,
                          ),
                          SizedBox(
                            width: defaultPadding * 2.5,
                            height: defaultPadding * 2.5,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: shadowColor,
                              ),
                              child: const Icon(
                                Icons.timelapse_rounded,
                                size: defaultPadding * 1.5,
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

              // Container(
              //   height: defaultPadding * 0.5,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
