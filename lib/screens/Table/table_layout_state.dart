import 'package:equatable/equatable.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';

// enum TableLayoutStatus { initial, success, error, loading, selected }

// extension TableLayoutStatusX on TableLayoutStatus {
//   bool get isInitial => this == TableLayoutStatus.initial;
//   bool get isSuccess => this == TableLayoutStatus.success;
//   bool get isError => this == TableLayoutStatus.error;
//   bool get isLoading => this == TableLayoutStatus.loading;
//   bool get isSelected => this == TableLayoutStatus.selected;
// }

class TableLayoutState extends Equatable {
  const TableLayoutState(
      {this.currentSelectedMode = SelectedMode.NONE,
      this.firstSelectedTableName = "",
      this.secondSelectedTableName = ""});
  final SelectedMode currentSelectedMode;
  final String firstSelectedTableName;
  final String secondSelectedTableName;

  @override
  List<Object?> get props =>
      [currentSelectedMode, firstSelectedTableName, secondSelectedTableName];

  TableLayoutState copywith(
      {SelectedMode? currentSelectedMode,
      String? firstSelectedTableName,
      String? secondSelectedTableName}) {
    return TableLayoutState(
        currentSelectedMode: currentSelectedMode ?? this.currentSelectedMode,
        firstSelectedTableName:
            firstSelectedTableName ?? this.firstSelectedTableName,
        secondSelectedTableName:
            secondSelectedTableName ?? this.secondSelectedTableName);
  }
}
