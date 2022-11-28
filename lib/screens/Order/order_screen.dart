import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pos_res_android/common/widgets/search_bar.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/common/widgets/warning_popup.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/check.dart'
    // ignore: library_prefixes
    as cashierCheck;
import 'package:pos_res_android/repos/models/cashier/payment.dart';
import 'package:pos_res_android/repos/models/waiter/check.dart';
import 'package:pos_res_android/repos/repository/waiter/check_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/item_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/majorgroup_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/menu_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/note_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/specialrequests_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/tableinfo_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/tableoverview_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/voidreason_repository.dart';
import 'package:pos_res_android/repos/services/cashier/check_service.dart';
import 'package:pos_res_android/repos/services/cashier/payment_service.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_major_button.dart';
import 'package:pos_res_android/screens/Order/widget/calculate_price_widget.dart';
import 'package:pos_res_android/screens/Order/widget/menu_item_cart.dart';
import 'package:pos_res_android/screens/Order/widget/order_customer_info_widget.dart';
import 'package:pos_res_android/screens/Order/widget/order_detail_info_widget.dart';
import 'package:pos_res_android/screens/Order/widget/order_general_info_widget.dart';
import 'package:pos_res_android/screens/Payment/payment_body.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen(
      {Key? key, this.tableid, required this.checkid, required this.loginMsg})
      : super(key: key);
  final String loginMsg;
  final int? tableid;
  final int checkid;

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<PaymentProcess> paidList = [];
  final LocalStorage storage = LocalStorage('paid');
  List<cashierCheck.CheckItem> checkItem = [];
  String employee = "";
  String checkStatus = "";
  String loginMsg = "";
  String msg = "";
  bool isActive = true;
  bool isPayment = true;
  bool isvoid = true;

  final PaymentService paymentService = Get.put(PaymentService());
  final CheckService checkService = Get.put(CheckService());

  Future<List<Payment>> getMethodList() async {
    List<Payment> met = await paymentService.getPaymentMethodList();
    return met;
  }

  getCheckItemStatus(int checkId) async {
    checkItem = await checkService.getCheckItem(checkId);
    setState(() {
      if (checkItem.isNotEmpty) {
        checkStatus = checkItem[0].status;
        employee = checkItem[0].manageby;
        if (checkStatus == "ACTIVE") {
          isActive = true;
          isPayment = false;
          isvoid = false;
        } else if (checkStatus == "CLOSED") {
          isActive = false;
          isPayment = true;
          isvoid = false;
        } else if (checkStatus == "VOID") {
          isActive = false;
          isPayment = false;
          isvoid = true;
        }
      } else {
        checkStatus = 'INACTIVE';
        employee = '';
      }
    });
  }

  Future<void> _simpleFailDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return WarningPopUp(msg: msg);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    loginMsg = widget.loginMsg;
    getCheckItemStatus(widget.checkid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => OrderLayoutBloc(
                  majorGroupRepository: MajorGroupRepositoryImpl(),
                  menuRepository: MenuRepositoryImpl(),
                  checkRepository: CheckRepositoryImpl(),
                  itemRepository: ItemRepositoryImpl(),
                  tableInfoRepository: TableInfoRepositoryImpl(),
                  noteRepository: NoteRepositoryImpl(),
                  specialRequestsRepository: SpecialRequestsRepositoryImpl(),
                  voidReasonRepository: VoidReasonRepositoryImpl())
                ..add(LoadData(
                    checkid: widget.checkid, tableid: widget.tableid))),
          BlocProvider(
            create: (context) => TableLayoutBloc(
                tableOverviewRepository: TableOverviewRepositoryImpl()),
          )
        ],
        child: BlocBuilder<OrderLayoutBloc, OrderLayoutState>(
          builder: (context, state) {
            return Container(
              color: Colors.white,
              child: Row(
                children: [
                  const SizedBox(child: SideBar()),
                  buildOrderDetailWidget(context),
                  state.currentMode == CurrentMode.order
                      ? buildOrderMenuWidget(state, context)
                      : buildOrderPaymentWidget(context)
                ],
              ),
            );
          },
        ),
      ),
    ));
  }

  Expanded buildOrderPaymentWidget(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    Check check = orderBloc.state.check;
    if (null == storage.getItem(check.checkid.toString())) {
      paidList = [];
    } else {
      List<PaymentProcess> tempList = [];
      if (storage.getItem(check.checkid.toString()) is List<PaymentProcess>) {
        tempList = (storage.getItem(check.checkid.toString()));
      } else {
        tempList = (storage.getItem(check.checkid.toString()) as List)
            .map((e) => PaymentProcess.fromJson(e))
            .toList();
      }
      paidList = tempList;
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(color: dividerColor),
            BoxShadow(
                color: Colors.grey[100]!,
                blurRadius: 3.0,
                offset: const Offset(4.0, 3.0)),
          ],
        ),
        child: FutureBuilder(
            future: getMethodList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Payment> list = snapshot.requireData;
                return PaymentBody(
                  list: list,
                  paidList: paidList,
                  check: check,
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
      flex: 16,
    );
  }

  Expanded buildOrderMenuWidget(OrderLayoutState state, BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    return Expanded(
        child: Column(children: [
          const Expanded(flex: 1, child: SearchBar()),
          Expanded(
              flex: 10,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    const BoxShadow(color: dividerColor),
                    BoxShadow(
                        color: Colors.grey[100]!,
                        blurRadius: 3.0,
                        offset: const Offset(4.0, 3.0)),
                  ],
                ),
                child: Column(children: [
                  Expanded(
                    child: Center(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        padding: const EdgeInsets.all(5.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomMajorButton(
                              function: () => orderBloc.add(ChangeMenu(
                                  menuid: state.listMenus[index].id)),
                              icons: const Icon(
                                Icons.flatware,
                                color: activeColor,
                              ),
                              text: state.listMenus[index].name,
                              color: state.currentSelectedMenuID ==
                                      state.listMenus[index].id
                                  ? activeColor
                                  : Colors.white,
                              textColors: state.currentSelectedMenuID ==
                                      state.listMenus[index].id
                                  ? Colors.white
                                  : activeColor);
                        },
                        itemCount: state.listMenus.length,
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 10);
                      },
                      padding: const EdgeInsets.all(5.0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomMajorButton(
                            function: () => orderBloc.add(ChangeMajor(
                                majorid: state.listMajorGroups[index].id)),
                            icons: const Icon(
                              Icons.local_pizza,
                              color: activeColor,
                            ),
                            text: state.listMajorGroups[index].name,
                            color: state.currentSelectedMajorID ==
                                    state.listMajorGroups[index].id
                                ? activeColor
                                : Colors.white,
                            textColors: state.currentSelectedMajorID ==
                                    state.listMajorGroups[index].id
                                ? Colors.white
                                : activeColor);
                      },
                      itemCount: state.listMajorGroups.length,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(5.0),
                      itemCount: state.listItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (checkStatus == "ACTIVE" ||
                                checkStatus == 'INACTIVE') {
                              setState(() {
                                checkStatus = 'ACTIVE';
                              });
                              orderBloc
                                  .add(AddItem(item: state.listItems[index]));
                            } else {
                              msg = "Không thể cập nhật";
                              _simpleFailDialog();
                            }
                          },
                          child: Card(
                            elevation: 8,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: GridTile(
                                child: MenuItemCard(
                              item: state.listItems[index],
                              imageURL: state.listItems[index].image,
                              name: state.listItems[index].name,
                              price: state.listItems[index].price.toString(),
                              isOutOfStock: !state.listItems[index].instock,
                            )),
                          ),
                        );
                      },
                    ),
                    flex: 7,
                  ),
                  employee.isEmpty
                      ? const SizedBox()
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding * 0.5),
                            child: Container(
                              color: textLightColor,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: defaultPadding),
                                      child: Text(
                                        employee.toUpperCase(),
                                        style: const TextStyle(
                                            color: activeColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    flex: 18,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Visibility(
                                          visible: isActive,
                                          child: const Icon(
                                            Icons.lock_open,
                                            size: defaultPadding * 2,
                                            color: activeColor,
                                          ),
                                        ),
                                        Visibility(
                                          visible: isPayment,
                                          child: const Icon(
                                            Icons.lock_outline,
                                            size: defaultPadding * 2,
                                            color: activeColor,
                                          ),
                                        ),
                                        Visibility(
                                          visible: isvoid,
                                          child: const Icon(
                                            Icons.cancel_outlined,
                                            size: defaultPadding * 2,
                                            color: activeColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    flex: 1,
                                  )
                                ],
                              ),
                            ),
                          ),
                          flex: 1,
                        )
                ]),
              ))
        ]),
        flex: 16);
  }

  Expanded buildOrderDetailWidget(BuildContext context) {
    final OrderLayoutBloc orderBloc = BlocProvider.of<OrderLayoutBloc>(context);
    return Expanded(
        child: orderBloc.state.orderLayoutStatus.isLoading
            ? Container(
                color: Colors.transparent,
                child: const Center(child: CircularProgressIndicator()),
              )
            : Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(children: [
                  const Expanded(flex: 1, child: OrderGeneralInfo()),
                  const Divider(color: dividerColor),
                  Expanded(
                      flex: 1,
                      child: OrderCustomerInfo(
                        context: context,
                        status: checkStatus,
                      )),
                  const Divider(color: dividerColor),
                  Expanded(flex: 6, child: OrderDetailInfo()),
                  const Divider(color: dividerColor),
                  Expanded(
                      flex: 4,
                      child:
                          calculatePriceWidget(context, loginMsg, checkStatus)),
                ]),
              ),
        flex: 8);
  }
}
