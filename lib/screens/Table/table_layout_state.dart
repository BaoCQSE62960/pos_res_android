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
      this.firstSelectedTableName = "",
      this.secondSelectedTableName = "",
      TableOverview? tableOverview})
      : tableOverview = tableOverview ?? TableOverview.EMPTY;
  final SelectedMode currentSelectedMode;
  final String firstSelectedTableName;
  final String secondSelectedTableName;
  final TableLayoutStatus tableLayoutStatus;
  final TableOverview tableOverview;

  @override
  List<Object?> get props => [
        currentSelectedMode,
        firstSelectedTableName,
        secondSelectedTableName,
        tableOverview,
        tableLayoutStatus
      ];

  TableLayoutState copywith(
      {SelectedMode? currentSelectedMode,
      TableLayoutStatus? tableLayoutStatus,
      String? firstSelectedTableName,
      String? secondSelectedTableName,
      TableOverview? tableOverview}) {
    return TableLayoutState(
        tableLayoutStatus: tableLayoutStatus ?? this.tableLayoutStatus,
        tableOverview: tableOverview ?? this.tableOverview,
        currentSelectedMode: currentSelectedMode ?? this.currentSelectedMode,
        firstSelectedTableName:
            firstSelectedTableName ?? this.firstSelectedTableName,
        secondSelectedTableName:
            secondSelectedTableName ?? this.secondSelectedTableName);
  }
}
