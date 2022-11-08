import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/common/utils/socket.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout.dart';

class TableSection extends StatelessWidget {
  // TableSection({Key? key, Socket? socket}) : socket = socket ?? Socket();

  // Socket socket;

  TableSection({Key? key});

  @override
  Widget build(BuildContext context) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    return Container(
        color: textLightColor,
        // height: defaultPadding * 34.38,
        // width: defaultPadding * 58,
        height: MediaQuery.of(context).size.height - defaultPadding * 8.5,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<TableLayoutBloc, TableLayoutState>(
          builder: (context, state) {
            return tableBloc.state.tableLayoutStatus.isLoading
                ? const Center(child: CircularProgressIndicator())
                : TableLayout(
                    context: context,
                    // socket: socket,
                  );
          },
        ));
  }
}
