import 'package:equatable/equatable.dart';
import 'package:pos_res_android/repos/models/waiter/tableoverview.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';

enum TableLayoutStatus { initial, success, error, loading, selected }

enum TableItemStatus { initial, success, error, loading, selected }

enum TableLayoutFilter { all, ready, waiting, voided }

extension TableLayoutStatusX on TableLayoutStatus {
  bool get isInitial => this == TableLayoutStatus.initial;
  bool get isSuccess => this == TableLayoutStatus.success;
  bool get isError => this == TableLayoutStatus.error;
  bool get isLoading => this == TableLayoutStatus.loading;
  bool get isSelected => this == TableLayoutStatus.selected;
}

extension TableItemStatusX on TableItemStatus {
  bool get isInitial => this == TableItemStatus.initial;
  bool get isSuccess => this == TableItemStatus.success;
  bool get isError => this == TableItemStatus.error;
  bool get isLoading => this == TableItemStatus.loading;
  bool get isSelected => this == TableItemStatus.selected;
}

// ignore: must_be_immutable
class TableLayoutState extends Equatable {
  TableLayoutState(
      {this.tableLayoutStatus = TableLayoutStatus.initial,
      this.tableItemStatus = TableItemStatus.initial,
      this.currentSelectedMode = SelectedMode.NONE,
      this.currentLocationID = 0,
      this.currentTableOpenID = 0,
      this.currentProcessTableID = 0,
      this.currentFilter = TableLayoutFilter.all,
      TableOverview? tableOverview})
      : tableOverview = tableOverview ?? TableOverview.EMPTY;
  final SelectedMode currentSelectedMode;
  final TableLayoutStatus tableLayoutStatus;
  final TableItemStatus tableItemStatus;
  final TableOverview tableOverview;
  final TableLayoutFilter currentFilter;
  int currentLocationID;
  final int currentTableOpenID;
  final int currentProcessTableID;

  @override
  List<Object?> get props => [
        currentSelectedMode,
        tableOverview,
        tableLayoutStatus,
        tableItemStatus,
        currentLocationID,
        currentFilter,
        currentTableOpenID,
        currentProcessTableID
      ];

  TableLayoutState copywith(
      {SelectedMode? currentSelectedMode,
      TableLayoutStatus? tableLayoutStatus,
      TableItemStatus? tableItemStatus,
      TableOverview? tableOverview,
      int? currentLocationID,
      int? currentTableOpenID,
      int? currentProcessTableID,
      TableLayoutFilter? tableLayoutFilter,
      TableLayoutFilter? currentFilter}) {
    return TableLayoutState(
        tableLayoutStatus: tableLayoutStatus ?? this.tableLayoutStatus,
        tableItemStatus: tableItemStatus ?? this.tableItemStatus,
        tableOverview: tableOverview ?? this.tableOverview,
        currentSelectedMode: currentSelectedMode ?? this.currentSelectedMode,
        currentLocationID: currentLocationID ?? this.currentLocationID,
        currentTableOpenID: currentTableOpenID ?? this.currentTableOpenID,
        currentProcessTableID:
            currentProcessTableID ?? this.currentProcessTableID,
        currentFilter: currentFilter ?? this.currentFilter);
  }
}
