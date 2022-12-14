import 'package:flutter/cupertino.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Table/widget/location_filter.dart';
import 'package:pos_res_android/screens/Table/widget/status_filter.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({Key? key}) : super(key: key);

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: textLightColor,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 13,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(defaultPadding / 3.5),
              child: StatusFilter(),
            ),
            Container(
                color: textLightColor,
                width: MediaQuery.of(context).size.width * 0.5 +
                    defaultPadding * 10.5,
                child: const LocationFilter()),
          ],
        ),
      ),
    );
  }
}
