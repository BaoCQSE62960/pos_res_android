import 'package:equatable/equatable.dart';
import 'package:pos_res_android/repos/models/waiter/tableoverview.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';

enum TableLayoutStatus { initial, success, error, loading, selected }

extension TableLayoutStatusX on TableLayoutStatus {
  bool get isInitial => this == TableLayoutStatus.initial;
  bool get isSuccess => this == TableLayoutStatus.success;
  bool get isError => this == TableLayoutStatus.error;
  bool get isLoading => this == TableLayoutStatus.loading;
  bool get isSelected => this == TableLayoutStatus.selected;
}

class TableLayoutState extends Equatable {
  TableLayoutState(
      {this.tableLayoutStatus = TableLayoutStatus.initial,
      this.currentSelectedMode = SelectedMode.NONE,
      this.currentLocationID = 0,
      TableOverview? tableOverview})
      : tableOverview = tableOverview ?? TableOverview.EMPTY;
  final SelectedMode currentSelectedMode;
  final TableLayoutStatus tableLayoutStatus;
  final TableOverview tableOverview;
  int currentLocationID;

  @override
  List<Object?> get props => [
        currentSelectedMode,
        tableOverview,
        tableLayoutStatus,
        currentLocationID
      ];

  TableLayoutState copywith(
      {SelectedMode? currentSelectedMode,
      TableLayoutStatus? tableLayoutStatus,
      String? firstSelectedTableName,
      TableOverview? tableOverview,
      int? currentLocationID}) {
    return TableLayoutState(
        tableLayoutStatus: tableLayoutStatus ?? this.tableLayoutStatus,
        tableOverview: tableOverview ?? this.tableOverview,
        currentSelectedMode: currentSelectedMode ?? this.currentSelectedMode,
        currentLocationID: currentLocationID ?? this.currentLocationID);
  }
}
