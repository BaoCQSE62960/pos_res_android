import 'package:flutter/cupertino.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout.dart';

class TableSection extends StatelessWidget {
  const TableSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: textLightColor,
      // height: defaultPadding * 34.38,
      // width: defaultPadding * 58,
      height: MediaQuery.of(context).size.height - defaultPadding * 8.5,
      width: MediaQuery.of(context).size.width,
      child: const TableLayout(),
    );
  }
}
