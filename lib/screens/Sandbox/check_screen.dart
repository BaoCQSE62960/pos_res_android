import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/background.dart';
import 'package:pos_res_android/common/widgets/responsive.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Sandbox/widget/buttons/detail_btn(check).dart';
import 'package:pos_res_android/screens/Table/widget/buttons/payment_btn.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            tablet: Row(
              children: [
                const SizedBox(
                  child: SideBar(),
                ),
                Column(
                  children: [
                    Container(
                      color: textLightColor,
                      height: MediaQuery.of(context).size.height -
                          defaultPadding * 5,
                      width: MediaQuery.of(context).size.width -
                          defaultPadding * 4.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: textLightColor,
                            height: MediaQuery.of(context).size.height -
                                defaultPadding * 5,
                            width: MediaQuery.of(context).size.width / 2 -
                                MediaQuery.of(context).size.width / 28,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding * 0.5,
                                    left: defaultPadding,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Ngày: "
                                          "19/12/2021",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding * 0.5,
                                    left: defaultPadding,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Ca: "
                                          "Ca 1",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding * 0.5,
                                    left: defaultPadding,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Mã hóa đơn: "
                                          "19122131",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding * 0.5,
                                    left: defaultPadding,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Nhân viên phục vụ: "
                                          "Nguyễn Văn A",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding * 0.5,
                                    left: defaultPadding,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Bàn: "
                                          "L2-01",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding * 0.5,
                                    left: defaultPadding,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Khu vực: "
                                          "Lầu 2",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding * 0.5,
                                    left: defaultPadding,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Lý do hủy: "
                                          "",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: textLightColor,
                            height: MediaQuery.of(context).size.height -
                                defaultPadding * 5,
                            width: MediaQuery.of(context).size.width / 2 -
                                MediaQuery.of(context).size.width / 28,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding,
                                    left: defaultPadding * 0.5,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Tên khách hàng: "
                                          "Khách 1",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding,
                                    left: defaultPadding * 0.5,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Số khách: "
                                          "3",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding,
                                    left: defaultPadding * 0.5,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    minLines: 5,
                                    maxLines: null,
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 27, 0, 6),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Ghi chú: "
                                          "",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding,
                                    left: defaultPadding * 0.5,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Tổng: "
                                          "500.000",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding,
                                    left: defaultPadding * 0.5,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Thuế: "
                                          "50.000",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding,
                                    left: defaultPadding * 0.5,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Thành tiền: "
                                          "550.000",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: defaultPadding,
                                    left: defaultPadding * 0.5,
                                    top: defaultPadding,
                                    bottom: defaultPadding,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: deactiveLightColor,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          defaultSize * 4, 0, 0, 0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Trạng thái: "
                                          "Hoạt động",
                                      hintStyle: TextStyle(
                                          fontSize: defaultSize * 4.5,
                                          color: textColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: textLightColor,
                      width: MediaQuery.of(context).size.width -
                          defaultPadding * 4.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding * 0.5),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 4.5,
                              child: const PaymentBtn(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: defaultPadding * 0.5,
                              top: defaultPadding * 0.5,
                              bottom: defaultPadding * 0.5,
                            ),
                            child: GestureDetector(
                              onDoubleTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      // return const OrderScreen();
                                      return const SizedBox();
                                    },
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: const AllCheckDetailBtn(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
