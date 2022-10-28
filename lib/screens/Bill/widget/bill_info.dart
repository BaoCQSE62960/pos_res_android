import 'package:flutter/material.dart';
import 'package:pos_res_android/config/routes.dart';
import 'package:pos_res_android/config/theme.dart';

class BillInfo extends StatelessWidget {
  const BillInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding * 0.5,
        childAspectRatio: 10,
      ),
      children: [
        TextFormField(
          readOnly: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Ngày: "
                "29/12/2020",
            hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
        TextFormField(
          readOnly: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Ca: "
                "Ca 1",
            hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
        TextFormField(
          readOnly: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Tên khách hàng: "
                "Khách 2",
            hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
        TextFormField(
          readOnly: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Ghi chú: "
                "",
            hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
        // TextFormField(
        //   readOnly: true,
        //   decoration: const InputDecoration(
        //     filled: true,
        //     fillColor: deactiveLightColor,
        //     contentPadding: EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(30)),
        //       borderSide: BorderSide.none,
        //     ),
        //     hintText: "Tổng: "
        //         "63.000",
        //     hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
        //   ),
        // ),
        // TextFormField(
        //   readOnly: true,
        //   decoration: const InputDecoration(
        //     filled: true,
        //     fillColor: deactiveLightColor,
        //     contentPadding: EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(30)),
        //       borderSide: BorderSide.none,
        //     ),
        //     hintText: "Thuế: "
        //         "6.300",
        //     hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
        //   ),
        // ),
        // TextFormField(
        //   readOnly: true,
        //   decoration: const InputDecoration(
        //     filled: true,
        //     fillColor: deactiveLightColor,
        //     contentPadding: EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.all(Radius.circular(30)),
        //       borderSide: BorderSide.none,
        //     ),
        //     hintText: "Thành tiền: "
        //         "69.300",
        //     hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
        //   ),
        // ),
        TextFormField(
          readOnly: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Trạng thái: "
                "Hoàn tiền",
            hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
      ],
    );
  }
}
