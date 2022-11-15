// ignore_for_file: constant_identifier_names, avoid_print

// import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';

class TableLayoutBloc extends Bloc<TableLayoutEvent, TableLayoutState> {
  TableLayoutBloc() : super(const TableLayoutState()) {
    on<ChangeTable>(_mapChangeTableEventToStage);
    on<ChangeOrder>(_mapChangeOrderEventToStage);
    on<ResetAction>(_mapResetActionEventToStage);
    on<FirstSelectTable>(_mapSelectFirstTableEventToStage);
    on<SecondSelectTable>(_mapSelectSecondTableEventToStage);
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
