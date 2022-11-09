// ignore_for_file: constant_identifier_names, avoid_print

// import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/common/utils/socket.dart';
import 'package:pos_res_android/repos/models/waiter/tableoverview.dart';
import 'package:pos_res_android/repos/repository/waiter/tableoverview_repository.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';

class TableLayoutBloc extends Bloc<TableLayoutEvent, TableLayoutState> {
  TableLayoutBloc({required this.tableOverviewRepository})
      : super(TableLayoutState()) {
    on<ChangeTable>(_mapChangeTableEventToStage);
    on<ChangeOrder>(_mapChangeOrderEventToStage);
    on<ResetAction>(_mapResetActionEventToStage);
    on<FirstSelectTable>(_mapSelectFirstTableEventToStage);
    on<SecondSelectTable>(_mapSelectSecondTableEventToStage);
    on<LoadData>(_loadData);
  }

  final TableOverviewRepositoryImpl tableOverviewRepository;

  void _loadData(LoadData event, Emitter<TableLayoutState> emit) async {
    emit(state.copywith(tableLayoutStatus: TableLayoutStatus.loading));
    try {
      TableOverview tableOverview = await tableOverviewRepository
          .getTableOverviewByLocationID(event.locationID);
      emit(
        state.copywith(
            tableOverview: tableOverview,
            tableLayoutStatus: TableLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(tableLayoutStatus: TableLayoutStatus.error));
    }
  }

  void _mapChangeTableEventToStage(
      ChangeTable event, Emitter<TableLayoutState> emit) async {
    try {
      emit(
        state.copywith(currentSelectedMode: SelectedMode.CHANGE_TABLE),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
    }
  }

  void _mapChangeOrderEventToStage(
      ChangeOrder event, Emitter<TableLayoutState> emit) async {
    try {
      emit(
        state.copywith(currentSelectedMode: SelectedMode.CHANGE_ORDER),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
    }
  }

  void _mapResetActionEventToStage(
      ResetAction event, Emitter<TableLayoutState> emit) async {
    try {
      emit(
        state.copywith(
            currentSelectedMode: SelectedMode.NONE,
            firstSelectedTableName: "",
            secondSelectedTableName: ""),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
    }
  }

  void _mapSelectFirstTableEventToStage(
      FirstSelectTable event, Emitter<TableLayoutState> emit) async {
    try {
      emit(
        state.copywith(firstSelectedTableName: event.firstTableName),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
    }
  }

  void _mapSelectSecondTableEventToStage(
      SecondSelectTable event, Emitter<TableLayoutState> emit) async {
    try {
      emit(
        state.copywith(secondSelectedTableName: event.secondTableName),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
    }
  }
}
