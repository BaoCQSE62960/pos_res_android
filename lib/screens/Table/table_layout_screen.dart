import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/repos/repository/waiter/tableoverview_repository.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';
import 'package:pos_res_android/screens/Table/widget/table_action_button.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout_filter.dart';
import 'package:pos_res_android/screens/Table/widget/table_layout_table.dart';

class TableLayoutScreen extends StatefulWidget {
  const TableLayoutScreen({Key? key}) : super(key: key);

  @override
  State<TableLayoutScreen> createState() => _TableLayoutScreenState();
}

class _TableLayoutScreenState extends State<TableLayoutScreen> {
  // Socket socket = Socket();
  // @override
  // void initState() {
  //   super.initState();

  //   socket.declareSocket;
  //   socket.connectServer();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   socket.disconnectServer();
  //   socket.socket.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TableLayoutBloc(
          tableOverviewRepository: TableOverviewRepositoryImpl())
        ..add(LoadData(locationID: '0')),
      child: Background(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Responsive(
              tablet: Row(
                children: [
                  const SizedBox(
                    child: SideBar(),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        FilterSection(),
                        // TableSection(socket: socket),
                        TableSection(),
                        SizedBox(
                          child: ActionButton(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
