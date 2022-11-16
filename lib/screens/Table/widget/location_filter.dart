// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/location.dart';
import 'package:pos_res_android/repos/services/cashier/table_service.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';

class LocationFilter extends StatefulWidget {
  const LocationFilter({Key? key}) : super(key: key);

  @override
  State<LocationFilter> createState() => _LocationFilterState();
}

class _LocationFilterState extends State<LocationFilter> {
  TableService service = TableService();
  List<Location> listLocation = [];
  List listLocationTable = [];

  Future getAllLocation() async {
    listLocation = await service.getLocations();
    return listLocation;
  }

  Future getAllLocationTable(int locationId) async {
    listLocationTable = await service.getLocationTable(locationId);
    return listLocationTable;
  }

  Widget locationItem(int num, TableLayoutBloc tableBloc) {
    List<Widget> list = <Widget>[];

    for (var i = 0; i < num; i++) {
      list.add(
        TextButton(
          onPressed: () {
            tableBloc.add(LoadData(locationID: listLocation[i].id.toString()));
          },
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            backgroundColor:
                tableBloc.state.currentLocationID == listLocation[i].id
                    ? activeColor
                    : deactiveColor,
          ),
          child: Text(
            listLocation[i].name,
            style: const TextStyle(
              fontSize: 16,
              color: textLightColor,
            ),
          ),
        ),
      );
    }

    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        // crossAxisSpacing: 16,
        mainAxisSpacing: defaultPadding * 0.5,
        childAspectRatio: 0.3,
      ),
      scrollDirection: Axis.horizontal,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TableLayoutBloc tableBloc = BlocProvider.of<TableLayoutBloc>(context);
    return FutureBuilder(
      future: getAllLocation(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return BlocBuilder<TableLayoutBloc, TableLayoutState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: textLightColor,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        // width: MediaQuery.of(context).size.width,
                        height: defaultPadding * 2.5,
                        child: tableBloc.state.tableLayoutStatus.isSuccess
                            ? locationItem(listLocation.length, tableBloc)
                            : const SizedBox()),
                  ],
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
