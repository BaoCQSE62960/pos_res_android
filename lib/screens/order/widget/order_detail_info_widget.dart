import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_elevated_button.dart';
import 'package:pos_res_android/screens/Order/widget/listview_item.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderDetailInfo extends StatelessWidget {
  OrderDetailInfo({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<ActionItemList> actionItemList = [
      const ActionItemList(
        name: "Cánh gà chiên",
        price: "10.500",
        sepcialRequest: "Nhiều gà",
        isDone: false,
      ),
      const ActionItemList(
        name: "Mì trộn hải sản",
        price: "12.500",
        sepcialRequest: "Nhiều sốt",
        isDone: true,
      ),
    ];

    return Scrollbar(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: dividerColor,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return Slidable(
            child: actionItemList[index],
            startActionPane: !actionItemList[index].isDone
                ? NewOrderActionPane()
                : DoneOrderActionPane(),
          );
        },
      ),
    );
  }

  ActionPane NewOrderActionPane() {
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: activeColor,
          foregroundColor: Colors.white,
          icon: Icons.done,
          // label: 'order.done'.tr(),
        ),
        SlidableAction(
          onPressed: (context) {
            specialRequestDialog(context);
          },
          backgroundColor: warningColor,
          foregroundColor: Colors.white,
          icon: Icons.share,
          // label: 'order.special_request'.tr(),
        ),
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: voidColor,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          // label: 'order.void'.tr(),
        ),
      ],
    );
  }

  ActionPane DoneOrderActionPane() {
    return ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: voidColor,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          // label: 'order.void'.tr(),
        ),
      ],
      extentRatio: 0.2,
    );
  }

  Future<dynamic> specialRequestDialog(BuildContext context) {
    bool temp = false;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Stack(
              children: <Widget>[
                Positioned(
                  right: -30.0,
                  top: -30.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: activeColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              constraints: const BoxConstraints(
                                minWidth: 250.0,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0)),
                                child: Image.network(
                                  "https://burgerking.vn/media/catalog/product/cache/1/small_image/316x/9df78eab33525d08d6e5fb8d27136e95/b/u/burger_2_mie_ng_bo_khoai_ta_y_la_t.jpeg",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Burger bò 3 tầng",
                                    style: TextStyle(
                                        color: textColor2, fontSize: 12),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "10.500",
                                    style: TextStyle(
                                        color: textColor2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: activeColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  'order.special_request_title'.tr(),
                                  style: const TextStyle(
                                      color: activeColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              CheckboxListTile(
                                title: Text("Nhiều sốt",
                                    style: TextStyle(
                                        color: textColor2, fontSize: 12)),
                                value: temp,
                                onChanged: (newValue) {},
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          minLines: 6,
                          decoration: InputDecoration(
                              hintText: 'order.check_note_hint'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[100]!),
                                  borderRadius: BorderRadius.circular(20.0)),
                              fillColor: Colors.grey[100],
                              filled: true),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(text: 'order.confirm'.tr()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
