// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pos_res_android/repos/transaction/models/check.dart';

// class Utils {
//   static showSnackBar(BuildContext context, String text) {
//     final snackBar = SnackBar(content: Text(text));

//     ScaffoldMessenger.of(context)
//       ..removeCurrentSnackBar()
//       ..showSnackBar(snackBar);
//   }

//   static List<T> modelBuilder<M, T>(
//           List<M> models, T Function(int index, M model) builder) =>
//       models
//           .asMap()
//           .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
//           .values
//           .toList();

//   static Future loadChecks() async {
//     final data = await rootBundle.loadString('assets/i18n/check_nos.json');
//     final checksJson = json.decode(data);

//     return checksJson.keys.map<Check>((checkNo) {
//       final json = checksJson[checkNo];
//       final newJson = json..addAll({'checkNo': checkNo.toLowerCase()});

//       return Check.fromJson(newJson);
//     }).toList()
//       ..sort(Utils.ascendingSort);
//   }

//   static int ascendingSort(Check c1, Check c2) =>
//       c1.checkNo.compareTo(c2.checkNo);
// }
