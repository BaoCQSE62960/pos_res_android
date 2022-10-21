import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';
import 'package:pos_res_android/screens/Table/table_layout_state.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';

import '../../../config/routes.dart';
import '../../../config/theme.dart';

class TransferTableBtn extends StatelessWidget {
  const TransferTableBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TableLayoutBloc tableLayoutBloc =
        BlocProvider.of<TableLayoutBloc>(context);
    return BlocBuilder<TableLayoutBloc, TableLayoutState>(
      builder: (context, state) {
        return Hero(
          tag: "transfer_table_btn",
          child: SizedBox(
            height: defaultPadding * 2.5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    state.currentSelectedMode == SelectedMode.CHANGE_TABLE
                        ? Colors.blue
                        : activeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                tableLayoutBloc.add(
                    state.currentSelectedMode != SelectedMode.NONE
                        ? ResetAction()
                        : ChangeTable());
              },
              child: Text(
                "Chuyển bàn".toUpperCase(),
              ),
            ),
          ),
        );
      },
    );
  }
}
