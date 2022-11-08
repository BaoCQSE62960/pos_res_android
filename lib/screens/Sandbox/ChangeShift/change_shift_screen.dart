import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/search_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Sandbox/ChangeShift/change_shift_bloc.dart';
import 'package:pos_res_android/screens/Sandbox/ChangeShift/change_shift_state.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangeShiftScreen extends StatefulWidget {
  const ChangeShiftScreen({Key? key}) : super(key: key);

  @override
  _ChangeShiftScreenState createState() => _ChangeShiftScreenState();
}

class _ChangeShiftScreenState extends State<ChangeShiftScreen> {
  final bloc = ChangeShiftBloc();

  List<String> sampleEmployeeName = ['Nguyễn Văn A', 'Trần Thị B'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: activeColor,
        title: Text('change_shift.appbar_title'.tr()),
      ),
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<ChangeShiftState>(
        stream: bloc.stateController.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
          return Column(
            children: [
              const Expanded(flex: 1, child: SearchBar()),
              Expanded(
                flex: 10,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          sampleEmployeeName[index],
                          style: TextStyle(fontSize: 16, color: textColor2),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                          color: dividerColor,
                        ),
                    itemCount: 2),
              )
            ],
          );
        },
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
