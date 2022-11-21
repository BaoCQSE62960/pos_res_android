import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pos_res_android/repos/models/waiter/dto/detaillistDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/openTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/splitCheckDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/transferCheckDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/transferTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/tabledetail.dart';
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
    on<SplitOrder>(_mapSplitOrderEventToStage);
    on<ResetAction>(_mapResetActionEventToStage);
    on<ChangeOrderProcess>(_mapChangeOrderProcessEventToStage);
    on<ChangeTableProcess>(_mapChangeTableProcessEventToStage);
    on<SplitOrderProcess>(_mapSplitOrderProcessEventToStage);
    on<ChangeFilter>(_mapChangeFilterProcessEventToStage);
    on<OpenTable>(_mapOpenTableProcessEventToStage);
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

  void _mapSplitOrderEventToStage(
      SplitOrder event, Emitter<TableLayoutState> emit) async {
    try {
      emit(
        state.copywith(currentSelectedMode: SelectedMode.SPLIT_ORDER),
      );
    } catch (error) {
      emit(state.copywith(tableLayoutStatus: TableLayoutStatus.error));
    }
  }

  void _mapChangeFilterProcessEventToStage(
      ChangeFilter event, Emitter<TableLayoutState> emit) async {
    emit(
      state.copywith(tableLayoutStatus: TableLayoutStatus.loading),
    );
    try {
      TableOverview tableOverview = await tableOverviewRepository
          .getTableOverviewByLocationID(state.currentLocationID.toString());
      List<TableDetail> list = List<TableDetail>.from(tableOverview.listTable);
      TableLayoutFilter currentFilter = state.currentFilter;
      switch (event.targetFilter) {
        case TableLayoutFilter.ready:
          if (currentFilter != TableLayoutFilter.ready) {
            list = list.where((element) => element.isready).toList();
            currentFilter = event.targetFilter;
          } else {
            currentFilter = TableLayoutFilter.all;
          }
          break;
        case TableLayoutFilter.voided:
          if (currentFilter != TableLayoutFilter.voided) {
            list = list.where((element) => element.isrecall).toList();
            currentFilter = event.targetFilter;
          } else {
            currentFilter = TableLayoutFilter.all;
          }
          break;
        case TableLayoutFilter.waiting:
          if (currentFilter != TableLayoutFilter.waiting) {
            list = list.where((element) => element.iswaiting).toList();
            currentFilter = event.targetFilter;
          } else {
            currentFilter = TableLayoutFilter.all;
          }
          break;
        default:
          currentFilter = TableLayoutFilter.all;
      }
      tableOverview.listTable = list;
      emit(
        state.copywith(
            currentFilter: currentFilter,
            tableLayoutStatus: TableLayoutStatus.success,
            tableOverview: tableOverview),
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
              id: e.checkdetailid,
              quantity: e.checkdetailquantityLocal.round()))
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

  void _mapSplitOrderProcessEventToStage(
      SplitOrderProcess event, Emitter<TableLayoutState> emit) async {
    // ignore: unused_local_variable
    String? message;
    emit(
      state.copywith(tableLayoutStatus: TableLayoutStatus.loading),
    );
    try {
      SplitCheckDTO splitCheckDTO = SplitCheckDTO(
          currentCheckID: event.currentCheckID,
          targetTableID: event.targetTableID,
          percent: event.percent);
      // ignore: unused_local_variable
      http.Response response =
          await tableOverviewRepository.splitCheck(splitCheckDTO);
      if (response.body.isEmpty) {
        message = response.body;
      }
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
      TransferTableDTO transferTableDTO = TransferTableDTO(
          currentCheckID: event.currentCheckID,
          targetCheckID: event.targetTableID);
      // ignore: unused_local_variable
      http.Response response =
          await tableOverviewRepository.transferTable(transferTableDTO);
      emit(
        state.copywith(
            currentSelectedMode: SelectedMode.NONE,
            tableLayoutStatus: TableLayoutStatus.success),
      );
    } catch (error) {
      state.copywith(tableLayoutStatus: TableLayoutStatus.error);
    }
  }

  void _mapResetActionEventToStage(
      ResetAction event, Emitter<TableLayoutState> emit) async {
    try {
      emit(
        state.copywith(currentSelectedMode: SelectedMode.NONE),
      );
    } catch (error) {
      emit(state.copywith(tableLayoutStatus: TableLayoutStatus.error));
    }
  }

  Future<void> _mapOpenTableProcessEventToStage(
      OpenTable event, Emitter<TableLayoutState> emit) async {
    emit(state.copywith(
        tableItemStatus: TableItemStatus.loading,
        currentProcessTableID: event.tableID));
    try {
      OpenTableDTO openTableDTO =
          await tableOverviewRepository.openTable(event.tableID);
      emit(state.copywith(
          currentTableOpenID: openTableDTO.checkid,
          tableItemStatus: TableItemStatus.success,
          currentProcessTableID: 0));
    } catch (error) {
      emit(state.copywith(tableItemStatus: TableItemStatus.error));
    }
  }
}
