import 'package:equatable/equatable.dart';
import 'package:pos_res_android/repos/models/majorgroup.dart';
import 'package:pos_res_android/repos/models/menu.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';

enum OrderLayoutStatus { initial, success, error, loading, selected }

extension OrderLayoutStatusX on OrderLayoutStatus {
  bool get isInitial => this == OrderLayoutStatus.initial;
  bool get isSuccess => this == OrderLayoutStatus.success;
  bool get isError => this == OrderLayoutStatus.error;
  bool get isLoading => this == OrderLayoutStatus.loading;
  bool get isSelected => this == OrderLayoutStatus.selected;
}

class OrderLayoutState extends Equatable {
  const OrderLayoutState(
      {this.orderLayoutStatus = OrderLayoutStatus.initial,
      this.currentSelectedMajorID = 1,
      this.currentSelectedMenuID = 1,
      List<MajorGroup>? listMajorGroups,
      List<Menu>? listMenus})
      : listMajorGroups = listMajorGroups ?? const [],
        listMenus = listMenus ?? const [];
  final OrderLayoutStatus orderLayoutStatus;
  final List<MajorGroup> listMajorGroups;
  final List<Menu> listMenus;
  final int currentSelectedMajorID;
  final int currentSelectedMenuID;

  @override
  List<Object?> get props => [
        orderLayoutStatus,
        listMajorGroups,
        currentSelectedMajorID,
        currentSelectedMenuID
      ];

  OrderLayoutState copywith(
      {List<MajorGroup>? listMajorGroups,
      List<Menu>? listMenus,
      int? currentSelectedMajorID,
      int? currentSelectedMenuID,
      required OrderLayoutStatus orderLayoutStatus}) {
    return OrderLayoutState(
        currentSelectedMajorID:
            currentSelectedMajorID ?? this.currentSelectedMajorID,
        currentSelectedMenuID:
            currentSelectedMenuID ?? this.currentSelectedMenuID,
        listMajorGroups: listMajorGroups ?? this.listMajorGroups,
        listMenus: listMenus ?? this.listMenus,
        orderLayoutStatus: orderLayoutStatus);
  }
}
