import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/screens/order/order.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final bloc = OrderBloc();
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

  List<CustomMajorButton> listMajor = [
    const CustomMajorButton(
        icons: Icon(
          Icons.flatware,
          color: primaryColor,
        ),
        text: "Tất cả",
        color: Colors.white,
        textColors: primaryColor),
    const CustomMajorButton(
        icons: Icon(
          Icons.lunch_dining,
          color: primaryColor,
        ),
        text: "Burger",
        color: Colors.white,
        textColors: primaryColor),
    const CustomMajorButton(
        icons: Icon(
          Icons.local_pizza,
          color: primaryColor,
        ),
        text: "Pizza",
        color: Colors.white,
        textColors: primaryColor),
    const CustomMajorButton(
        icons: Icon(
          Icons.dinner_dining,
          color: primaryColor,
        ),
        text: "Mì",
        color: Colors.white,
        textColors: primaryColor),
    const CustomMajorButton(
        icons: Icon(
          Icons.coffee,
          color: primaryColor,
        ),
        text: "Nước uống",
        color: Colors.white,
        textColors: primaryColor),
    const CustomMajorButton(
        icons: Icon(
          Icons.cake,
          color: primaryColor,
        ),
        text: "Tráng miệng",
        color: Colors.white,
        textColors: primaryColor),
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
                Expanded(
                    // flex: snapshot.data!.sideMenuFlex,
                    flex: 1,
                    child: GestureDetector(
                      // onTap: () => bloc.eventController.sink.add(
                      //     snapshot.data!.isSideMenuOpen
                      //         ? CloseSideMenu()
                      //         : OpenSideMenu()),
                      child: SideMenu(
                        items: items,
                        style: SideMenuStyle(
                            displayMode: snapshot.data!.isSideMenuOpen
                                ? SideMenuDisplayMode.open
                                : SideMenuDisplayMode.compact,
                            backgroundColor: primaryColor),
                        controller: PageController(),
                      ),
                    )),
                // When compace, flex is 10. When open, flex is 2.
                Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Đơn hàng #7",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: primaryColor),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Mở vào 07:48 PM",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            )),
                        Divider(color: dividerColor.withOpacity(0.4)),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  CustomOutlinedButton(
                                    icons: const Icon(
                                      Icons.person_add,
                                      color: primaryColor,
                                    ),
                                    text: "Khách hàng",
                                  ),
                                  const Spacer(),
                                  CustomOutlinedButton(
                                    icons: const Icon(
                                      Icons.note,
                                      color: primaryColor,
                                    ),
                                    text: "Ghi chú",
                                  )
                                ],
                              ),
                            )),
                        Divider(color: dividerColor.withOpacity(0.4)),
                        Expanded(
                            flex: 4,
                            child: Scrollbar(
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Divider(
                                      color: dividerColor.withOpacity(0.4),
                                    ),
                                  );
                                },
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return Slidable(
                                    child: itemList(),
                                    endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) {},
                                            backgroundColor: voidColor,
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                            label: 'Hủy',
                                          ),
                                          SlidableAction(
                                            onPressed: (context) {},
                                            backgroundColor: warningColor,
                                            foregroundColor: Colors.white,
                                            icon: Icons.share,
                                            label: 'Yêu cầu',
                                          ),
                                        ]),
                                  );
                                },
                              ),
                            )),
                        Divider(color: dividerColor.withOpacity(0.4)),
                        Expanded(flex: 5, child: calculatePriceWidget()),
                      ]),
                    ),
                    flex: 8),
                Expanded(
                    child: Column(children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(color: dividerColor.withOpacity(0.4)!),
                              const BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 3.0,
                                  offset: Offset(4.0, 2.0)),
                            ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Tìm kiếm",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[100]!),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    fillColor: Colors.grey[100],
                                    filled: true,
                                    prefixIcon: Icon(Icons.search)),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: dividerColor.withOpacity(0.4)!),
                                BoxShadow(
                                    color: Colors.grey[100]!,
                                    blurRadius: 3.0,
                                    offset: const Offset(4.0, 3.0)),
                              ],
                            ),
                            child: Column(children: [
                              Expanded(
                                child: Container(
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
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Container(),
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

  Container calculatePriceWidget() {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(children: [
              Text(
                "Subtotal",
                style: TextStyle(color: textColor2),
              ),
              const Spacer(),
              Text(
                "84.00",
                style:
                    TextStyle(color: textColor2, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Text(
                  "Taxes",
                  style: TextStyle(color: textColor2),
                ),
                const Spacer(),
                Text(
                  "5.00",
                  style:
                      TextStyle(color: textColor2, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      color: textColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Spacer(),
                Text(
                  "89.00",
                  style: TextStyle(
                      color: textColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 30.0),
          //   child: Container(
          //       height: 50,
          //       width: double.infinity,
          //       child: CustomElevatedButton(
          //           icons: const Icon(Icons.send), text: "Gửi đơn")),
          // ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomToolButton(
                    icons: Icon(
                      Icons.delete,
                      color: voidColor,
                    ),
                    text: "Vô hiệu",
                    textColors: voidColor,
                    color: voidColorBackground,
                  ),
                  CustomToolButton(
                      icons: Icon(
                        Icons.notifications,
                        color: warningColor,
                      ),
                      text: "Nhắc nhở",
                      textColors: warningColor,
                      color: warningColorBackground),
                  CustomToolButton(
                    icons: Icon(
                      Icons.send,
                      color: activeColor,
                    ),
                    text: "Gửi dơn",
                    textColors: activeColor,
                    color: activeColorBackground,
                  )
                ]),
          )
        ],
      ),
    );
  }

  Container itemList() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: CustomQuantityButton(),
            flex: 1,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cánh gà chiên",
                          style: TextStyle(color: textColor2),
                        ),
                        Text("Size vừa", style: TextStyle(color: textColor2)),
                        const Spacer(),
                        Text("Yêu cầu đặc biệt:",
                            style: TextStyle(color: textColor2)),
                        Text("Nhiều sốt",
                            style: TextStyle(color: textColor2)),
                      ]),
                  const Spacer(),
                  Row(
                    children: [
                      Text("99.50",
                          style: TextStyle(
                              color: textColor2, fontWeight: FontWeight.bold)),
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: Text(
                          "VNĐ",
                          style: TextStyle(
                              fontSize: 10,
                              color: textColor2,
                              fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            flex: 8,
          )
        ],
      ),
    );
  }

  Column CustomQuantityButton() {
    return Column(children: [
      Expanded(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: primaryColor,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        flex: 1,
      ),
      Expanded(
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          child: const Text(
            "1",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        flex: 1,
      ),
      Expanded(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: primaryColor),
          child: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        flex: 1,
      )
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}

class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton({Key? key, required this.icons, required this.text});

  final Icon icons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            shadowColor: shadowColor,
            elevation: 3,
            backgroundColor: Colors.white,
          ),
          onPressed: () {},
          icon: icons,
          label: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: primaryColor),
          )),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({Key? key, required this.icons, required this.text});

  final Icon icons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shadowColor: shadowColor,
          elevation: 3,
          backgroundColor: primaryColor,
        ),
        onPressed: () {},
        icon: icons,
        label: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.normal, fontSize: 15, color: Colors.white),
        ));
  }
}

class CustomToolButton extends StatelessWidget {
  const CustomToolButton(
      {Key? key,
      required this.icons,
      required this.text,
      required this.color,
      required this.textColors});

  final Icon icons;
  final String text;
  final Color color;
  final Color textColors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shadowColor: color,
          elevation: 3,
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icons,
              Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: textColors),
              )
            ],
          ),
        ));
  }
}

class CustomMajorButton extends StatelessWidget {
  const CustomMajorButton(
      {Key? key,
      required this.icons,
      required this.text,
      required this.color,
      required this.textColors});

  final Icon icons;
  final String text;
  final Color color;
  final Color textColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      height: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            backgroundColor: color,
            shadowColor: color,
            elevation: 3,
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox.fromSize(
                  size: Size.fromRadius(25),
                  child: FittedBox(
                    child: icons,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      color: textColors),
                )
              ],
            ),
          )),
    );
  }
}
