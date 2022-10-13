import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class TableLayout extends StatelessWidget {
  const TableLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: const [
        Icon(
          Icons.cancel,
          size: 28,
          color: textLightColor,
        ),
      ],
    );
    //   child: GridView.count(
    //     crossAxisCount: 4,
    //     children: const [
    //       Icon(
    //         Icons.cancel,
    //         size: 28,
    //         color: textLightColor,
    //       ),
    //       Text(
    //         "Cần hủy",
    //         style: TextStyle(
    //           fontSize: 14,
    //           color: textLightColor,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

// class TableLayout extends StatefulWidget {
//   const TableLayout({Key? key}) : super(key: key);

//   @override
//   State<TableLayout> createState() => _TableLayoutState();
// }

// class _TableLayoutState extends State<TableLayout> {
//   @override
//   Widget build(BuildContext context) {
//     return const CustomScrollView(
//       // primary: false,
//       slivers: <Widget>[
//         SliverPadding(
//           padding: EdgeInsets.all(1),
//           // sliver: SliverGrid.count(
//           // crossAxisSpacing: 1,
//           // mainAxisSpacing: 1,
//           // crossAxisCount: 3,
//           // children: <Widget>[
//           //   Container(
//           //     padding: const EdgeInsets.all(1),
//           //     color: Colors.green,
//           //     child: const Text("He'd have you all unravel at the"),
//           //   ),
//           // ],
//           // ),
//         ),
//       ],
//     );
//   }
// }
