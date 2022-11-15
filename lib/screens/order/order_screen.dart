import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pos_res_android/common/widgets/search_bar.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/models/payment.dart';
import 'package:pos_res_android/repos/repository/majorgroup_repository.dart';
import 'package:pos_res_android/repos/repository/menu_repository.dart';
import 'package:pos_res_android/repos/services/payment_service.dart';
import 'package:pos_res_android/screens/Order/order.dart';
import 'package:pos_res_android/screens/Order/widget/calculate_price_widget.dart';
import 'package:pos_res_android/screens/Order/widget/buttons/custom_major_button.dart';
import 'package:pos_res_android/screens/Order/widget/menu_item_cart.dart';
import 'package:pos_res_android/screens/Order/widget/order_customer_info_widget.dart';
import 'package:pos_res_android/screens/Order/widget/order_detail_info_widget.dart';
import 'package:pos_res_android/screens/Order/widget/order_general_info_widget.dart';
import 'package:pos_res_android/screens/Payment/payment_body.dart';
import 'package:pos_res_android/screens/Table/table_layout_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Payment> methods = [];
  List<PaymentProcess> paidList = [];
  // List methods = [1];
  final PaymentService service = Get.put(PaymentService());

  Future<List<Payment>> getMethodList() async {
    List<Payment> met = await service.getPaymentMethodList();
    return met;
  }

  // List<CustomMajorButton> listMajor = [
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.flatware,
  //         color: activeColor,
  //       ),
  //       text: "Tất cả",
  //       color: activeColor,
  //       textColors: Colors.white),
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.lunch_dining,
  //         color: activeColor,
  //       ),
  //       text: "Burger",
  //       color: Colors.white,
  //       textColors: activeColor),
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.local_pizza,
  //         color: activeColor,
  //       ),
  //       text: "Pizza",
  //       color: Colors.white,
  //       textColors: activeColor),
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.dinner_dining,
  //         color: activeColor,
  //       ),
  //       text: "Mì",
  //       color: Colors.white,
  //       textColors: activeColor),
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.coffee,
  //         color: activeColor,
  //       ),
  //       text: "Nước uống",
  //       color: Colors.white,
  //       textColors: activeColor),
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.cake,
  //         color: activeColor,
  //       ),
  //       text: "Tráng miệng",
  //       color: Colors.white,
  //       textColors: activeColor),
  // ];

  // Fake major list, delete later
  // List<CustomMajorButton> listMenu = [
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.flatware,
  //         color: activeColor,
  //       ),
  //       text: "Tất cả",
  //       color: activeColor,
  //       textColors: Colors.white),
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.lunch_dining,
  //         color: activeColor,
  //       ),
  //       text: "Menu #1",
  //       color: Colors.white,
  //       textColors: activeColor),
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.local_pizza,
  //         color: activeColor,
  //       ),
  //       text: "Menu #2",
  //       color: Colors.white,
  //       textColors: activeColor),
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.local_pizza,
  //         color: activeColor,
  //       ),
  //       text: "Menu #3",
  //       color: Colors.white,
  //       textColors: activeColor),
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.local_pizza,
  //         color: activeColor,
  //       ),
  //       text: "Menu #4",
  //       color: Colors.white,
  //       textColors: activeColor),
  //   const CustomMajorButton(
  //       icons: Icon(
  //         Icons.local_pizza,
  //         color: activeColor,
  //       ),
  //       text: "Menu #5",
  //       color: Colors.white,
  //       textColors: activeColor),
  // ];

  List<MenuItemCard> listMenuItem = [
    const MenuItemCard(
      imageURL:
          "https://assets.epicurious.com/photos/5761c748ff66dde1456dfec0/master/pass/crispy-baked-chicken-wings.jpg",
      name: "Cánh gà chiên",
      price: "10.500",
      isOutOfStock: false,
    ),
    const MenuItemCard(
      imageURL:
          "https://blenderartists.org/uploads/default/original/4X/b/d/e/bde2fc7af5666e783c794abf2d3c097d561de1bb.jpeg",
      name: "Mì trộn hải sản",
      price: "12.500",
      isOutOfStock: true,
    ),
  ];

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
                    menuRepository: MenuRepositoryImpl())
                  ..add(LoadData())),
            BlocProvider(
              create: (context) => TableLayoutBloc(),
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
                        ? buildOrderMenuWidget(state)
                        : buildOrderPaymentWidget()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
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

  Expanded buildOrderMenuWidget(OrderLayoutState state) {
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
                    child: state.orderLayoutStatus.isSuccess
                        ? ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 10);
                            },
                            padding: const EdgeInsets.all(5.0),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomMajorButton(
                                  icons: const Icon(
                                    Icons.flatware,
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
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
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
                            icons: const Icon(
                              Icons.local_pizza,
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
                    flex: 1,
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(5.0),
                      itemCount: 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: GridTile(child: listMenuItem[index]),
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
    return Expanded(
        child: Container(
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
            Expanded(flex: 4, child: calculatePriceWidget()),
          ]),
        ),
        flex: 8);
  }
}
