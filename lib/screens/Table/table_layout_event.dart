import 'package:equatable/equatable.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';

class TableLayoutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadData extends TableLayoutEvent {
  LoadData({required this.locationID});

  final String locationID;
}

class ChangeTable extends TableLayoutEvent {
  ChangeTable();
}

class ChangeOrder extends TableLayoutEvent {
  ChangeOrder();
}

class SplitOrder extends TableLayoutEvent {
  SplitOrder();
}

class ChangeFilter extends TableLayoutEvent {
  ChangeFilter({required this.targetFilter});
  final TableLayoutFilter targetFilter;
}

// class OpenTable extends TableLayoutEvent {
//   OpenTable({required this.tableID});
//   final int tableID;
// }

class ChangeOrderProcess extends TableLayoutEvent {
  ChangeOrderProcess(
      {required this.listCheckDetail,
      required this.currentCheckID,
      required this.targatTableID});
  final List<CheckDetail> listCheckDetail;
  final int currentCheckID;
  final int targatTableID;

  @override
  List<Object?> get props => [listCheckDetail, currentCheckID, targatTableID];
}

class ChangeTableProcess extends TableLayoutEvent {
  ChangeTableProcess(
      {required this.currentCheckID, required this.targetTableID});
  final int currentCheckID;
  final int targetTableID;

  @override
  List<Object?> get props => [currentCheckID, targetTableID];
}

class SplitOrderProcess extends TableLayoutEvent {
  SplitOrderProcess(
      {required this.percent,
      required this.currentCheckID,
      required this.targetTableID});
  final int percent;
  final int currentCheckID;
  final int targetTableID;

  @override
  List<Object?> get props => [percent, currentCheckID, targetTableID];
}

class ResetAction extends TableLayoutEvent {
  ResetAction();
}
