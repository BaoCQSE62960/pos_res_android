import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/shift.dart';
import 'package:pos_res_android/repos/services/login_service.dart';

List<Shift> list = [];
List<String> shiftName = [];

class DropdownShift extends StatefulWidget {
  const DropdownShift({Key? key}) : super(key: key);

  @override
  State<DropdownShift> createState() => _DropdownShiftState();
}

class _DropdownShiftState extends State<DropdownShift> {
  Future getShiftItem() async {
    LoginService service = LoginService();
    list = await service.getShifts();
    shiftName = list.map((e) => e.name).toList();
    // dropdownValue = shiftName.first;
    return list;
  }

  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getShiftItem(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (dropdownValue == "") {
              dropdownValue = shiftName.first;
            }
            return DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: const TextStyle(color: textColor),
              underline: Container(
                height: 2,
                color: primaryColor,
              ),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: shiftName.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
