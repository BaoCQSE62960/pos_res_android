import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/bill.dart';

class BillInfo extends StatefulWidget {
  final List<BillItem> list;
  const BillInfo({Key? key, required this.list}) : super(key: key);

  @override
  State<BillInfo> createState() => _BillInfoState();
}

class _BillInfoState extends State<BillInfo> {
  List<BillItem> billItem = [];
  String shiftNameShow = "";
  String? guestNameShow = "";
  String? noteShow = "";
  String statusShow = "";
  final newFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    billItem = widget.list;

    guestNameShow = billItem[0].guestname;
    noteShow = billItem[0].note;
    statusShow = billItem[0].status;

    guestNameShow ??= "";
    noteShow ??= "";

    if (statusShow == 'REFUND') {
      statusShow = 'Hoàn tiền';
    } else if (statusShow == 'CLOSED') {
      statusShow = 'Đóng';
    }
  }

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
            // hintText: "Ngày: ${newFormat.format(billItem[0].creationtime)}",
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
