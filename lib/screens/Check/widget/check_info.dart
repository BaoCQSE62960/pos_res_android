import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/check.dart';

class CheckInfo extends StatefulWidget {
  final List<CheckItem> list;
  const CheckInfo({Key? key, required this.list}) : super(key: key);

  @override
  State<CheckInfo> createState() => _CheckInfoState();
}

class _CheckInfoState extends State<CheckInfo> {
  List<CheckItem> checkItem = [];
  String? tableNameShow = "";
  String? voidReasonShow = "";
  String? guestNameShow = "";
  int? coverShow = 0;
  String? noteShow = "";
  String statusShow = "";
  final newFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    checkItem = widget.list;

    tableNameShow = checkItem[0].tablename;
    voidReasonShow = checkItem[0].voidreason;
    guestNameShow = checkItem[0].guestname;
    coverShow = checkItem[0].cover;
    noteShow = checkItem[0].note;
    statusShow = checkItem[0].status;

    tableNameShow ??= "";
    voidReasonShow ??= "";
    guestNameShow ??= "";
    coverShow ??= 0;
    noteShow ??= "";

    if (statusShow == 'ACTIVE') {
      statusShow = 'Hoạt động';
    } else if (statusShow == 'INACTIVE') {
      statusShow = 'Hủy';
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
            hintText: "Ngày: ${newFormat.format(checkItem[0].creationtime)}",
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
            hintText: "Ca: ${checkItem[0].shiftname}",
            hintStyle:
                const TextStyle(fontSize: defaultSize * 4.5, color: textColor),
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
        //     hintText: "Mã hóa đơn: "
        //         "19122131",
        //     hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
        //   ),
        // ),
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
            hintText: "Nhân viên phục vụ: ${checkItem[0].manageby}",
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
            hintText: "Bàn: $tableNameShow",
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
            hintText: "Khu vực: ${checkItem[0].locationname}",
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
            hintText: "Lý do hủy: $voidReasonShow",
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
            hintText: "Số khách: $coverShow",
            hintStyle:
                const TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
        // TextFormField(
        //   keyboardType: TextInputType.multiline,
        //   minLines: 5,
        //   maxLines: null,
        //   readOnly: true,
        //   decoration: const InputDecoration(
        //     filled: true,
        //     fillColor: deactiveLightColor,
        //     contentPadding:
        //         EdgeInsets.fromLTRB(defaultSize * 4, 27, 0, 6),
        //     border: OutlineInputBorder(
        //       borderRadius:
        //           BorderRadius.all(Radius.circular(30)),
        //       borderSide: BorderSide.none,
        //     ),
        //     hintText: "Ghi chú: "
        //         "",
        //     hintStyle: TextStyle(
        //         fontSize: defaultSize * 4.5, color: textColor),
        //   ),
        // ),
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
        //         "500.000",
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
        //         "50.000",
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
        //         "550.000",
        //     hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
        //   ),
        // ),
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
