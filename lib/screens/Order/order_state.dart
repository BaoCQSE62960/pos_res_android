import 'package:equatable/equatable.dart';
import 'package:pos_res_android/repos/models/waiter/check.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/repos/models/waiter/item.dart';
import 'package:pos_res_android/repos/models/waiter/majorgroup.dart';
import 'package:pos_res_android/repos/models/waiter/menu.dart';
import 'package:pos_res_android/repos/models/waiter/note.dart';
import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';
import 'package:pos_res_android/repos/models/waiter/tableinfo.dart';
import 'package:pos_res_android/repos/models/waiter/voidreason.dart';

enum OrderLayoutStatus { initial, success, error, loading, selected }

enum CurrentMode { order, payment }

extension OrderLayoutStatusX on OrderLayoutStatus {
  bool get isInitial => this == OrderLayoutStatus.initial;
  bool get isSuccess => this == OrderLayoutStatus.success;
  bool get isError => this == OrderLayoutStatus.error;
  bool get isLoading => this == OrderLayoutStatus.loading;
  bool get isSelected => this == OrderLayoutStatus.selected;
}

// ignore: must_be_immutable
class OrderLayoutState extends Equatable {
  OrderLayoutState(
      {this.orderLayoutStatus = OrderLayoutStatus.initial,
      this.currentSelectedMajorID = 0,
      this.currentSelectedMenuID = 1,
      this.currentMode = CurrentMode.order,
      this.specialRequestNote = '',
      this.currentLocalID = 0,
      this.checkId = 0,
      this.tableId = 0,
      List<MajorGroup>? listMajorGroups,
      Check? check,
      TableInfo? tableInfo,
      Note? note,
      List<Menu>? listMenus,
      List<Item>? listItems,
      List<SpecialRequests>? listSpecialRequest,
      List<VoidReason>? listVoidReason,
      List<SpecialRequests>? listSelectedSpecialRequest,
      List<CheckDetail>? listSelectedCheckDetail,
      VoidReason? selectedVoidReason})
      : listMajorGroups = listMajorGroups ?? const [],
        listMenus = listMenus ?? const [],
        listItems = listItems ?? const [],
        listSpecialRequest = listSpecialRequest ?? const [],
        listSelectedSpecialRequest = listSelectedSpecialRequest ?? const [],
        listSelectedCheckDetail = listSelectedCheckDetail ?? const [],
        listVoidReason = listVoidReason ?? const [],
        check = check ?? Check.EMPTY,
        note = note ?? Note.EMPTY,
        selectedVoidReason = selectedVoidReason ?? VoidReason.EMPTY,
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
  final List<VoidReason> listVoidReason;
  List<SpecialRequests> listSelectedSpecialRequest;
  List<CheckDetail> listSelectedCheckDetail;
  VoidReason selectedVoidReason;
  String specialRequestNote;
  // ignore: prefer_typing_uninitialized_variables
  final currentMode;
  int currentLocalID;
  int checkId;
  int tableId;

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
        listVoidReason,
        listSelectedSpecialRequest,
        listSelectedCheckDetail,
        selectedVoidReason,
        specialRequestNote,
        currentLocalID,
        checkId,
        tableId
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
      List<VoidReason>? listVoidReason,
      List<SpecialRequests>? listSelectedSpecialRequest,
      List<CheckDetail>? listSelectedCheckDetail,
      VoidReason? selectedVoidReason,
      String? specialRequestNote,
      int? currentLocalID,
      int? checkId,
      int? tableId,
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
        listVoidReason: listVoidReason ?? this.listVoidReason,
        listSelectedSpecialRequest:
            listSelectedSpecialRequest ?? this.listSelectedSpecialRequest,
        listSelectedCheckDetail:
            listSelectedCheckDetail ?? this.listSelectedCheckDetail,
        selectedVoidReason: selectedVoidReason ?? this.selectedVoidReason,
        specialRequestNote: specialRequestNote ?? this.specialRequestNote,
        check: check ?? this.check,
        note: note ?? this.note,
        tableInfo: tableInfo ?? this.tableInfo,
        currentMode: currentMode ?? this.currentMode,
        currentLocalID: currentLocalID ?? this.currentLocalID,
        checkId: checkId ?? this.checkId,
        tableId: tableId ?? this.tableId,
        orderLayoutStatus: orderLayoutStatus);
  }
}
