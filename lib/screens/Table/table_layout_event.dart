import 'package:equatable/equatable.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';

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
      {required this.locationID,
      required this.currentTableID,
      required this.targatTableID});
  final int locationID;
  final int currentTableID;
  final int targatTableID;

  @override
  List<Object?> get props => [locationID, currentTableID, targatTableID];
}

class ResetAction extends TableLayoutEvent {
  ResetAction();
}
