import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_elevated_button.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderCustomerInfo extends StatelessWidget {
  OrderCustomerInfo({Key? key, required this.context}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          CustomOutlinedButton(
            function: () {
              showCustomerDialog(context);
            },
            icons: const Icon(
              Icons.person_add,
              color: activeColor,
            ),
            text: 'order.customer'.tr(),
          ),
          const Spacer(),
          CustomOutlinedButton(
            function: () {
              showNoteDialog(context);
            },
            icons: const Icon(
              Icons.note,
              color: activeColor,
            ),
            text: 'order.note'.tr(),
          )
        ],
      ),
    );
  }

  Future<dynamic> showCustomerDialog(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    TextEditingController guestNameController = TextEditingController();
    TextEditingController coverController = TextEditingController();
    guestNameController.text = orderBloc.state.tableInfo.guestname.isEmpty
        ? ''
        : orderBloc.state.tableInfo.guestname;
    coverController.text = orderBloc.state.tableInfo.cover == 0
        ? ''
        : orderBloc.state.tableInfo.cover.toString();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'order.customer_info'.tr().toUpperCase(),
                          style: const TextStyle(
                              color: activeColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: guestNameController,
                          decoration: InputDecoration(
                              hintText: 'order.customer_name'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[100]!),
                                  borderRadius: BorderRadius.circular(20.0)),
                              fillColor: Colors.grey[100],
                              filled: true,
                              prefixIcon: const Icon(Icons.person)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: coverController,
                          decoration: InputDecoration(
                              hintText: 'order.number_of_seats'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[100]!),
                                  borderRadius: BorderRadius.circular(20.0)),
                              fillColor: Colors.grey[100],
                              filled: true,
                              prefixIcon: const Icon(Icons.event_seat)),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          text: 'order.confirm'.tr(),
                          callback: () {
                            orderBloc.add(UpdateInfo(
                                guestname: guestNameController.text,
                                cover: int.parse(coverController.text)));
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<dynamic> showNoteDialog(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    TextEditingController noteController = TextEditingController();
    noteController.text =
        orderBloc.state.note.note.isEmpty ? '' : orderBloc.state.note.note;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'order.check_note'.tr().toUpperCase(),
                          style: const TextStyle(
                              color: activeColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: noteController,
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
                              filled: true,
                              prefixIcon: const Icon(Icons.note)),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          text: 'order.confirm'.tr(),
                          callback: () {
                            orderBloc
                                .add(UpdateNote(note: noteController.text));
                            Navigator.pop(context);
                          },
                        ),
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
