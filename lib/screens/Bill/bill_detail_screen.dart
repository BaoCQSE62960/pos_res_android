import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';

class BillDetailScreen extends StatelessWidget {
  const BillDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            tablet: Row(
              children: const [
                SizedBox(
                  child: SideBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
