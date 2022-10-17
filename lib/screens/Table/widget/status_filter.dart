import 'package:flutter/material.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class StatusFilter extends StatefulWidget {
  const StatusFilter({Key? key}) : super(key: key);

  @override
  State<StatusFilter> createState() => _StatusFilterState();
}

class _StatusFilterState extends State<StatusFilter> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: textLightColor,
          margin: const EdgeInsets.only(
            right: defaultPadding * 0.5,
          ),
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  height: defaultPadding * 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: defaultPadding * 0.5,
                    ),
                    Hero(
                      tag: "active_check_btn",
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          minimumSize: const Size(122, 50),
                          backgroundColor: warningColor,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.dining,
                              size: 28,
                              color: textLightColor,
                            ),
                            Text(
                              "Cần phục vụ",
                              style: TextStyle(
                                fontSize: 14,
                                color: textLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: defaultPadding * 0.5,
                    ),
                    Hero(
                      tag: "void_check_btn",
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          minimumSize: const Size(122, 50),
                          backgroundColor: voidColor,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.cancel,
                              size: 28,
                              color: textLightColor,
                            ),
                            Text(
                              "Cần hủy",
                              style: TextStyle(
                                fontSize: 14,
                                color: textLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: defaultPadding * 0.5,
                    ),
                    Hero(
                      tag: "void_check_btn",
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: const StadiumBorder(),
                          minimumSize: const Size(122, 50),
                          backgroundColor: shadowColor,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.timelapse_rounded,
                              size: 28,
                              color: textLightColor,
                            ),
                            // Spacer(),
                            Text(
                              "Chờ đợi",
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.w700,
                                color: textLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
