import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';

class StatusFilter extends StatefulWidget {
  const StatusFilter({Key? key}) : super(key: key);

  @override
  State<StatusFilter> createState() => _StatusFilterState();
}

class _StatusFilterState extends State<StatusFilter> {
  @override
  Widget build(BuildContext context) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    return BlocBuilder<TableLayoutBloc, TableLayoutState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildFilterButton(tableBloc, () {
                  tableBloc
                      .add(ChangeFilter(targetFilter: TableLayoutFilter.ready));
                },
                    'Cần phục vụ',
                    tableBloc.state.currentFilter == TableLayoutFilter.ready,
                    warningColor,
                    Icons.dinner_dining),
                buildFilterButton(tableBloc, () {
                  tableBloc.add(
                      ChangeFilter(targetFilter: TableLayoutFilter.voided));
                },
                    'Cần hủy',
                    tableBloc.state.currentFilter == TableLayoutFilter.voided,
                    voidColor,
                    Icons.cancel),
                buildFilterButton(tableBloc, () {
                  tableBloc.add(
                      ChangeFilter(targetFilter: TableLayoutFilter.waiting));
                },
                    'Chờ đợi',
                    tableBloc.state.currentFilter == TableLayoutFilter.waiting,
                    shadowColor,
                    Icons.timelapse_rounded),
              ],
            ),
          ],
        );
      },
    );
  }

  Padding buildFilterButton(TableLayoutBloc tableBloc, VoidCallback function,
      String text, bool isClicked, Color color, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: OutlinedButton(
        onPressed: function,
        style: TextButton.styleFrom(
          shape: isClicked
              ? const StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
          backgroundColor: isClicked ? color : textLightColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: defaultSize * 6,
              color: isClicked ? textLightColor : color,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: defaultSize * 3.5,
                color: isClicked ? textLightColor : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
