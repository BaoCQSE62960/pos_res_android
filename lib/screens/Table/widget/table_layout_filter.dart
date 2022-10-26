import 'package:flutter/cupertino.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Table/widget/location_filter.dart';
import 'package:pos_res_android/screens/Table/widget/status_filter.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: textLightColor,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 13,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding / 4.5),
                child: StatusFilter(),
              ),
            ),
            SizedBox(
              child: Container(
                  color: textLightColor,
                  width: MediaQuery.of(context).size.width * 0.5 -
                      defaultPadding * 3.3,
                  child: const LocationFilter()),
            ),
          ],
        ),
      ),
    );
  }
}
