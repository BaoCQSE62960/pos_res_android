// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/location.dart';
import 'package:pos_res_android/repos/services/table_service.dart';

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

  Widget locationItem(int num) {
    List<Widget> list = <Widget>[];

    for (var i = 0; i < num; i++) {
      list.add(
        TextButton(
          onPressed: () {
            getAllLocationTable(listLocation[i].id);
            print("locationId: ${listLocation[i].id} "
                "locationName: ${listLocation[i].name}");
          },
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            backgroundColor: selectColor,
          ),
          child: Text(
            listLocation[i].name,
            style: const TextStyle(
              fontSize: 16,
              color: textColor,
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
    return FutureBuilder(
      future: getAllLocation(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: textLightColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    // width: MediaQuery.of(context).size.width,
                    height: defaultPadding * 2.5,
                    child: locationItem(listLocation.length)),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
