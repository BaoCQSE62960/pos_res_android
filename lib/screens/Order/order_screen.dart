import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/common/widgets/search_bar.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/cashier/payment.dart';
import 'package:pos_res_android/repos/models/cashier/table.dart';
import 'package:pos_res_android/repos/repository/waiter/check_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/item_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/majorgroup_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/menu_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/note_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/specialrequests_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/tableinfo_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/tableoverview_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/voidreason_repository.dart';
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
  const OrderScreen({Key? key, required this.table, required this.loginMsg})
      : super(key: key);

  final TableDetail table;
  final String loginMsg;

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<PaymentProcess> paidList = [];
  String loginMsg = "";

  final PaymentService service = Get.put(PaymentService());

  Future<List<Payment>> getMethodList() async {
    List<Payment> met = await service.getPaymentMethodList();
    return met;
  }

  @override
  void initState() {
    super.initState();
    loginMsg = widget.loginMsg;
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
                    checkid: widget.table.checkid, tableid: widget.table.id))),
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
                      : buildOrderPaymentWidget()
                ],
              ),
            );
          },
        ),
      ),
    ));
  }

  Expanded buildOrderPaymentWidget() {
    // Implement layout for payment here.
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
                  checkId: 1,
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
                          return GestureDetector(
                            onLongPress: () => orderBloc.add(
                                ChangeMenu(menuid: state.listMenus[index].id)),
                            child: CustomMajorButton(
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
                                    : activeColor),
                          );
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
                        return GestureDetector(
                          onLongPress: () => orderBloc.add(ChangeMajor(
                              majorid: state.listMajorGroups[index].id)),
                          child: CustomMajorButton(
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
                                  : activeColor),
                        );
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
                          onTap: () => orderBloc
                              .add(AddItem(item: state.listItems[index])),
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
                    flex: 8,
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
                      )),
                  const Divider(color: dividerColor),
                  Expanded(flex: 6, child: OrderDetailInfo()),
                  const Divider(color: dividerColor),
                  Expanded(
                      flex: 4, child: calculatePriceWidget(context, loginMsg)),
                ]),
              ),
        flex: 8);
  }
}
