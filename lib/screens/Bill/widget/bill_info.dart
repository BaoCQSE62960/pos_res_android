import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/bill.dart';

class BillInfo extends StatefulWidget {
  final List<BillItem> list;
  const BillInfo({Key? key, required this.list}) : super(key: key);

  @override
  State<BillInfo> createState() => _BillInfoState();
}

class _BillInfoState extends State<BillInfo> {
  List<BillItem> billItem = [];
  String dateShow = "";
  String? guestNameShow = "";
  String? noteShow = "";
  String statusShow = "";
  final newFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    billItem = widget.list;

    dateShow = newFormat.format(billItem[0].creationtime);
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
          decoration: InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: const EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Ngày: $dateShow",
            hintStyle:
                const TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: const EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Tên khách hàng: $guestNameShow",
            hintStyle:
                const TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: const EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Ghi chú: $noteShow",
            hintStyle:
                const TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: const EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Trạng thái: $statusShow",
            hintStyle:
                const TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
      ],
    );
  }
}
