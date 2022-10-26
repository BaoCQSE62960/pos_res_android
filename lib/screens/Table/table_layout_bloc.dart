// ignore_for_file: constant_identifier_names, avoid_print

// import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/screens/Table/table_layout.dart';
import 'package:pos_res_android/screens/Table/table_layout_event.dart';
import 'package:pos_res_android/screens/Table/utils/selected_mode_enum.dart';
import 'package:easy_localization/easy_localization.dart';

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
    // emit(state.copyWith(status: CategoryStatus.loading));
    try {
      emit(
        state.copywith(currentSelectedMode: SelectedMode.CHANGE_TABLE),
      );
      print(state.currentSelectedMode);
      print(state.firstSelectedTableName);
      print(state.secondSelectedTableName);
    } catch (error, stacktrace) {
      print(stacktrace);
      // emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  void _mapChangeOrderEventToStage(
      ChangeOrder event, Emitter<TableLayoutState> emit) async {
    // emit(state.copyWith(status: CategoryStatus.loading));
    try {
      emit(
        state.copywith(currentSelectedMode: SelectedMode.CHANGE_ORDER),
      );
      print(state.currentSelectedMode);
      print(state.firstSelectedTableName);
      print(state.secondSelectedTableName);
    } catch (error, stacktrace) {
      print(stacktrace);
      // emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  void _mapResetActionEventToStage(
      ResetAction event, Emitter<TableLayoutState> emit) async {
    // emit(state.copyWith(status: CategoryStatus.loading));
    try {
      emit(
        state.copywith(
            currentSelectedMode: SelectedMode.NONE,
            firstSelectedTableName: "",
            secondSelectedTableName: ""),
      );
      print(state.currentSelectedMode);
      print(state.firstSelectedTableName);
      print(state.secondSelectedTableName);
    } catch (error, stacktrace) {
      print(stacktrace);
      // emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  void _mapSelectFirstTableEventToStage(
      FirstSelectTable event, Emitter<TableLayoutState> emit) async {
    // emit(state.copyWith(status: CategoryStatus.loading));
    try {
      emit(
        state.copywith(firstSelectedTableName: event.firstTableName),
      );
      if (state.currentSelectedMode == SelectedMode.CHANGE_ORDER) {}
      print(state.currentSelectedMode);
      print(state.firstSelectedTableName);
      print(state.secondSelectedTableName);
    } catch (error, stacktrace) {
      print(stacktrace);
      // emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  void _mapSelectSecondTableEventToStage(
      SecondSelectTable event, Emitter<TableLayoutState> emit) async {
    // emit(state.copyWith(status: CategoryStatus.loading));
    try {
      emit(
        state.copywith(secondSelectedTableName: event.secondTableName),
      );
      print(state.currentSelectedMode);
      print(state.firstSelectedTableName);
      print(state.secondSelectedTableName);
    } catch (error, stacktrace) {
      print(stacktrace);
      // emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  // showConfirmDialog(
  //     BuildContext context, String firstTable, String secondTable) {
  //   Widget cancelButton = TextButton(
  //     child: Text("dialog.cancel".tr()),
  //     onPressed: () {},
  //   );
  //   Widget continueButton = TextButton(
  //     child: Text("dialog.agree".tr()),
  //     onPressed: () {},
  //   );
  //   AlertDialog alert = AlertDialog(
  //     title: const Text("Xác nhận chuyển đơn"),
  //     content: Text("Bạn có đồng ý chuyển đơn này của bàn #" +
  //         firstTable +
  //         " sang bàn #" +
  //         secondTable +
  //         " ?"),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}
