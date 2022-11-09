import 'package:equatable/equatable.dart';

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

class ResetAction extends TableLayoutEvent {
  ResetAction();
}

class FirstSelectTable extends TableLayoutEvent {
  FirstSelectTable({required this.firstTableName});
  final String firstTableName;

  @override
  List<Object?> get props => [firstTableName];
}

class SecondSelectTable extends TableLayoutEvent {
  SecondSelectTable({required this.secondTableName});
  final String secondTableName;

  @override
  List<Object?> get props => [secondTableName];
}
