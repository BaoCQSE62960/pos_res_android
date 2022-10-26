import 'package:equatable/equatable.dart';
import 'package:pos_res_android/repos/models/majorgroup.dart';
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
      List<MajorGroup>? listMajorGroups})
      : listMajorGroups = listMajorGroups ?? const [];
  final OrderLayoutStatus orderLayoutStatus;
  final List<MajorGroup> listMajorGroups;

  @override
  List<Object?> get props => [orderLayoutStatus, listMajorGroups];

  OrderLayoutState copywith(
      {List<MajorGroup>? listMajorGroups,
      required OrderLayoutStatus orderLayoutStatus}) {
    return OrderLayoutState(
        listMajorGroups: listMajorGroups ?? this.listMajorGroups,
        orderLayoutStatus: orderLayoutStatus);
  }
}
