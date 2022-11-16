// import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/waiter/dto/detaillistDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/transferCheckDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/transferTableDTO.dart';
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
    on<ChangeOrderProcess>(_mapChangeOrderProcessEventToStage);
    on<ChangeTableProcess>(_mapChangeTableProcessEventToStage);
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
            currentLocationID: int.parse(event.locationID),
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
    } catch (error) {
      emit(state.copywith(tableLayoutStatus: TableLayoutStatus.error));
    }
  }

  void _mapChangeOrderEventToStage(
      ChangeOrder event, Emitter<TableLayoutState> emit) async {
    try {
      emit(
        state.copywith(currentSelectedMode: SelectedMode.CHANGE_ORDER),
      );
    } catch (error) {
      emit(state.copywith(tableLayoutStatus: TableLayoutStatus.error));
    }
  }

  void _mapChangeOrderProcessEventToStage(
      ChangeOrderProcess event, Emitter<TableLayoutState> emit) async {
    emit(
      state.copywith(tableLayoutStatus: TableLayoutStatus.loading),
    );
    try {
      List<DetailListItemDTO> detailListItemDTO = event.listCheckDetail
          .map((e) => DetailListItemDTO(
              id: e.checkdetailid, quantity: e.checkdetailquantityLocal))
          .toList();
      TransferCheckDTO transferCheckDTO = TransferCheckDTO(
          currentTableID: event.currentCheckID,
          targetTableID: event.targatTableID,
          detailList: detailListItemDTO);
      // ignore: unused_local_variable
      http.Response response =
          await tableOverviewRepository.transferCheck(transferCheckDTO);
      emit(
        state.copywith(
            currentSelectedMode: SelectedMode.NONE,
            tableLayoutStatus: TableLayoutStatus.success),
      );
    } catch (error) {
      state.copywith(tableLayoutStatus: TableLayoutStatus.error);
    }
  }

  void _mapChangeTableProcessEventToStage(
      ChangeTableProcess event, Emitter<TableLayoutState> emit) async {
    emit(
      state.copywith(tableLayoutStatus: TableLayoutStatus.loading),
    );
    try {
      TransferTableDTO transferTableDTO =
          TransferTableDTO(locationID: event.locationID);
      // ignore: unused_local_variable
      http.Response response = await tableOverviewRepository.transferTable(
          transferTableDTO, event.currentTableID, event.targatTableID);
      emit(
        state.copywith(
            currentSelectedMode: SelectedMode.NONE,
            tableLayoutStatus: TableLayoutStatus.success),
      );
    } catch (error) {
      state.copywith(tableLayoutStatus: TableLayoutStatus.error);
    }
  }

  // Delete later
  void _mapResetActionEventToStage(
      ResetAction event, Emitter<TableLayoutState> emit) async {
    try {
      emit(
        state.copywith(
            currentSelectedMode: SelectedMode.NONE, firstSelectedTableName: ""),
      );
    } catch (error) {
      emit(state.copywith(tableLayoutStatus: TableLayoutStatus.error));
    }
  }
}
