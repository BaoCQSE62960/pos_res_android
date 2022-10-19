import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:pos_res_android/common/widgets/side_bar.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/order/order.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pos_res_android/screens/order/widget/calculate_price_widget.dart';
import 'package:pos_res_android/screens/order/widget/buttons/custom_major_button.dart';
import 'package:pos_res_android/screens/order/widget/menu_item_cart.dart';
import 'package:pos_res_android/screens/order/widget/order_customer_info_widget.dart';
import 'package:pos_res_android/screens/order/widget/order_detail_info_widget.dart';
import 'package:pos_res_android/screens/order/widget/order_general_info_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final bloc = OrderBloc();

  // Fake side menu item, delete later
  List<SideMenuItem> items = [
    SideMenuItem(
      // Priority of item to show on SideMenu, lower value is displayed at the top
      priority: 0,
      title: 'Chuyển ca',
      onTap: () => {},
      icon: const Icon(Icons.switch_account_outlined),
    ),
    SideMenuItem(
      priority: 1,
      title: 'Đăng xuất',
      onTap: () => {},
      icon: const Icon(Icons.logout),
    ),
  ];

  // Fake major list, delete later
  List<CustomMajorButton> listMajor = [
    const CustomMajorButton(
        icons: Icon(
          Icons.flatware,
          color: activeColor,
        ),
        text: "Tất cả",
        color: Colors.white,
        textColors: activeColor),
    const CustomMajorButton(
        icons: Icon(
          Icons.lunch_dining,
          color: activeColor,
        ),
        text: "Burger",
        color: Colors.white,
        textColors: activeColor),
    const CustomMajorButton(
        icons: Icon(
          Icons.local_pizza,
          color: activeColor,
        ),
        text: "Pizza",
        color: Colors.white,
        textColors: activeColor),
    const CustomMajorButton(
        icons: Icon(
          Icons.dinner_dining,
          color: activeColor,
        ),
        text: "Mì",
        color: Colors.white,
        textColors: activeColor),
    const CustomMajorButton(
        icons: Icon(
          Icons.coffee,
          color: activeColor,
        ),
        text: "Nước uống",
        color: Colors.white,
        textColors: activeColor),
    const CustomMajorButton(
        icons: Icon(
          Icons.cake,
          color: activeColor,
        ),
        text: "Tráng miệng",
        color: Colors.white,
        textColors: activeColor),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<OrderState>(
        stream: bloc.stateController.stream,
        initialData: bloc.state,
        builder: (context, snapshot) {
          return Container(
            color: Colors.white,
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: SideBar(),
                  ),
                ),
                Expanded(
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
                        const Expanded(flex: 7, child: OrderDetailInfo()),
                        const Divider(color: dividerColor),
                        Expanded(flex: 3, child: calculatePriceWidget()),
                      ]),
                    ),
                    flex: 8),
                Expanded(
                    child: Column(children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(color: dividerColor),
                              BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 3.0,
                                  offset: Offset(4.0, 2.0)),
                            ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'order.search'.tr(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[100]!),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    fillColor: Colors.grey[100],
                                    filled: true,
                                    prefixIcon: const Icon(Icons.search)),
                              ),
                            ),
                          )),
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
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 10);
                                  },
                                  padding: const EdgeInsets.all(10.0),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return listMajor[index];
                                  },
                                  itemCount: 6,
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: GridView.builder(
                                  itemCount: 10,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: GridTile(child: MenuItemCard()),
                                    );
                                  },
                                ),
                                flex: 4,
                              )
                            ]),
                          ))
                    ]),
                    flex: 16)
              ],
            ),
          );
        },
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
