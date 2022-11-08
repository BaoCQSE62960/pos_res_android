import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';

class CheckInfo extends StatelessWidget {
  const CheckInfo({Key? key}) : super(key: key);

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
                "19/12/2021",
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
          decoration: const InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Nhân viên phục vụ: "
                "Nguyễn Văn A",
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
            hintText: "Bàn: "
                "L2-01",
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
            hintText: "Khu vực: "
                "Lầu 2",
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
            hintText: "Lý do hủy: "
                "",
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
                "Khách 1",
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
            hintText: "Số khách: "
                "3",
            hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
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
          decoration: const InputDecoration(
            filled: true,
            fillColor: deactiveLightColor,
            contentPadding: EdgeInsets.fromLTRB(defaultSize * 4, 0, 0, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            hintText: "Trạng thái: "
                "Hoạt động",
            hintStyle: TextStyle(fontSize: defaultSize * 4.5, color: textColor),
          ),
        ),
      ],
    );
  }
}
