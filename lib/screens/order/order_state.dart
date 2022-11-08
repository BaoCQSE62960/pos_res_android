import 'package:equatable/equatable.dart';
import 'package:pos_res_android/repos/models/check.dart';
import 'package:pos_res_android/repos/models/item.dart';
import 'package:pos_res_android/repos/models/majorgroup.dart';
import 'package:pos_res_android/repos/models/menu.dart';
import 'package:pos_res_android/repos/models/note.dart';
import 'package:pos_res_android/repos/models/specialrequests.dart';
import 'package:pos_res_android/repos/models/tableinfo.dart';

enum OrderLayoutStatus { initial, success, error, loading, selected }

enum CurrentMode { order, payment }

extension OrderLayoutStatusX on OrderLayoutStatus {
  bool get isInitial => this == OrderLayoutStatus.initial;
  bool get isSuccess => this == OrderLayoutStatus.success;
  bool get isError => this == OrderLayoutStatus.error;
  bool get isLoading => this == OrderLayoutStatus.loading;
  bool get isSelected => this == OrderLayoutStatus.selected;
}

class OrderLayoutState extends Equatable {
  OrderLayoutState(
      {this.orderLayoutStatus = OrderLayoutStatus.initial,
      this.currentSelectedMajorID = 0,
      this.currentSelectedMenuID = 0,
      this.currentMode = CurrentMode.order,
      this.specialRequestNote = '',
      List<MajorGroup>? listMajorGroups,
      Check? check,
      TableInfo? tableInfo,
      Note? note,
      List<Menu>? listMenus,
      List<Item>? listItems,
      List<SpecialRequests>? listSpecialRequest,
      List<SpecialRequests>? listSelectedSpecialRequest})
      : listMajorGroups = listMajorGroups ?? const [],
        listMenus = listMenus ?? const [],
        listItems = listItems ?? const [],
        listSpecialRequest = listSpecialRequest ?? const [],
        listSelectedSpecialRequest = listSelectedSpecialRequest ?? const [],
        check = check ?? Check.EMPTY,
        note = note ?? Note.EMPTY,
        tableInfo = tableInfo ?? TableInfo.EMPTY;
  final OrderLayoutStatus orderLayoutStatus;
  final List<MajorGroup> listMajorGroups;
  final List<Menu> listMenus;
  final List<Item> listItems;
  final int currentSelectedMajorID;
  final int currentSelectedMenuID;
  final Check check;
  final Note note;
  final TableInfo tableInfo;
  final List<SpecialRequests> listSpecialRequest;
  List<SpecialRequests> listSelectedSpecialRequest;
  String specialRequestNote;
  final currentMode;

  @override
  List<Object?> get props => [
        orderLayoutStatus,
        listMenus,
        listMajorGroups,
        listItems,
        check,
        currentSelectedMajorID,
        currentSelectedMenuID,
        tableInfo,
        note,
        listSpecialRequest,
        listSelectedSpecialRequest,
        specialRequestNote
      ];

  OrderLayoutState copywith(
      {List<MajorGroup>? listMajorGroups,
      List<Menu>? listMenus,
      List<Item>? listItems,
      int? currentSelectedMajorID,
      int? currentSelectedMenuID,
      CurrentMode? currentMode,
      Check? check,
      Note? note,
      TableInfo? tableInfo,
      List<SpecialRequests>? listSpecialRequest,
      List<SpecialRequests>? listSelectedSpecialRequest,
      String? specialRequestNote,
      required OrderLayoutStatus orderLayoutStatus}) {
    return OrderLayoutState(
        currentSelectedMajorID:
            currentSelectedMajorID ?? this.currentSelectedMajorID,
        currentSelectedMenuID:
            currentSelectedMenuID ?? this.currentSelectedMenuID,
        listMajorGroups: listMajorGroups ?? this.listMajorGroups,
        listMenus: listMenus ?? this.listMenus,
        listItems: listItems ?? this.listItems,
        listSpecialRequest: listSpecialRequest ?? this.listSpecialRequest,
        listSelectedSpecialRequest:
            listSelectedSpecialRequest ?? this.listSelectedSpecialRequest,
        specialRequestNote: specialRequestNote ?? this.specialRequestNote,
        check: check ?? this.check,
        note: note ?? this.note,
        tableInfo: tableInfo ?? this.tableInfo,
        currentMode: currentMode ?? this.currentMode,
        orderLayoutStatus: orderLayoutStatus);
  }
}
