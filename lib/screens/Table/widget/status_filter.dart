import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

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
          // margin: const EdgeInsets.only(
          //   right: defaultPadding * 0.5,
          // ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: "active_check_btn",
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding / 4),
                      child: SizedBox(
                        width: defaultPadding * 7.5,
                        height: defaultPadding * 2.5,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: warningColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.dining,
                                size: defaultSize * 6,
                                color: textLightColor,
                              ),
                              Text(
                                "Cần phục vụ",
                                style: TextStyle(
                                  fontSize: defaultSize * 3.5,
                                  color: textLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: "void_check_btn",
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding / 4),
                      child: SizedBox(
                        width: defaultPadding * 7.5,
                        height: defaultPadding * 2.5,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: voidColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.cancel,
                                size: defaultSize * 6,
                                color: textLightColor,
                              ),
                              Text(
                                "Cần hủy",
                                style: TextStyle(
                                  fontSize: defaultSize * 3.5,
                                  color: textLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: "waiting_check_btn",
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding / 4),
                      child: SizedBox(
                        width: defaultPadding * 7.5,
                        height: defaultPadding * 2.5,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: shadowColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.timelapse_rounded,
                                size: defaultSize * 6,
                                color: textLightColor,
                              ),
                              // Spacer(),
                              Text(
                                "Chờ đợi",
                                style: TextStyle(
                                  fontSize: defaultSize * 3.5,
                                  // fontWeight: FontWeight.w700,
                                  color: textLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
