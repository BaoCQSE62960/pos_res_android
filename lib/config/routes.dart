import 'package:flutter/cupertino.dart';
import 'package:pos_res_android/screens/Cashier/cashier_log_screen.dart';
import 'package:pos_res_android/screens/Login/login_screen.dart';
import 'package:pos_res_android/screens/Table/table_layout_screen.dart';
import 'package:pos_res_android/screens/Transaction/search_bill_screen.dart';
import 'package:pos_res_android/screens/Transaction/search_check_screen.dart';

class PosRestaurantRoute {
  static const order = "/";
  // List<CheckItem> abc;

  static Map<String, Widget Function(BuildContext)> pageroutes =
      <String, WidgetBuilder>{
    '/login': (BuildContext context) => const LoginScreen(),
    '/tableoverview': (BuildContext context) => const TableLayoutScreen(),
    '/checklist': (BuildContext context) => const SearchCheckScreen(),
    '/billlist': (BuildContext context) => const SearchBillScreen(),
    // '/checkdetail': (BuildContext context, abc) => CheckDetailScreen(listCheck: abc),
    '/cashierlog': (BuildContext context) => const CashierLogScreen(),
  };
}

String googleLink = 'https://www.google.com/';
String youtubeLink = 'https://www.youtube.com/';

String uriMomo = "https://test-payment.momo.vn/v2/gateway/api/create";
String uriLocal = "http://localhost:5000";
String uriRailway = "https://pos-server-group.up.railway.app";
// String uri = uriRailway;
// String uriLocal = "http://localhost:5000";

//FPT
// String uri = "http://10.1.126.179:5000";

//Bao's uri
//4G
// String uri = "http://192.168.41.136:5000";

//Home
// String uri = "http://192.168.1.6:5000";
//Q9
// String uri = "http://192.168.0.6:5000";

//Duc's uri
String uri = "http://10.0.2.2:5000";

String logoURL =
    "https://firebasestorage.googleapis.com/v0/b/pos-restaurant-30dcc.appspot.com/o/logo.png?alt=media&token=3abf9469-7d3c-49e7-a2dd-d47dbdb03f37";
