import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/repos/models/check.dart';
import 'package:pos_res_android/repos/models/checkdetail.dart';
import 'package:pos_res_android/repos/models/item.dart';
import 'package:pos_res_android/repos/models/majorgroup.dart';
import 'package:pos_res_android/repos/models/menu.dart';
import 'package:pos_res_android/repos/models/note.dart';
import 'package:pos_res_android/repos/models/specialrequests.dart';
import 'package:pos_res_android/repos/models/tableinfo.dart';
import 'package:pos_res_android/repos/repository/check_repository.dart';
import 'package:pos_res_android/repos/repository/item_repository.dart';
import 'package:pos_res_android/repos/repository/majorgroup_repository.dart';
import 'package:pos_res_android/repos/repository/menu_repository.dart';
import 'package:pos_res_android/repos/repository/note_repository.dart';
import 'package:pos_res_android/repos/repository/specialrequests_repository.dart';
import 'package:pos_res_android/repos/repository/tableinfo_repository.dart';
import 'package:pos_res_android/screens/Order/order_event.dart';
import 'package:pos_res_android/screens/Order/order_state.dart';
import 'package:http/http.dart' as http;

class OrderLayoutBloc extends Bloc<OrderLayoutEvent, OrderLayoutState> {
  OrderLayoutBloc(
      {required this.majorGroupRepository,
      required this.menuRepository,
      required this.itemRepository,
      required this.checkRepository,
      required this.tableInfoRepository,
      required this.noteRepository,
      required this.specialRequestsRepository})
      : super(OrderLayoutState()) {
    on<LoadData>(_loadData);
    on<ChangeMode>(_changeMode);
    on<ChangeMenu>(_changeMenu);
    on<ChangeMajor>(_changeMajor);
    on<AddItem>(_addItem);
    on<UpdateInfo>(_updateInfo);
    on<UpdateNote>(_updateNote);
    on<LoadSpecialRequestsForItem>(_loadSpecialRequestsForItem);
    on<SelectSpecialRequestForItem>(_selectSpecialRequestsForItem);
    on<UpdateSpecialRequestForItem>(_updateSpecialRequestsForItem);
  }

  final MajorGroupRepositoryImpl majorGroupRepository;
  final MenuRepositoryImpl menuRepository;
  final ItemRepositoryImpl itemRepository;
  final CheckRepositoryImpl checkRepository;
  final TableInfoRepositoryImpl tableInfoRepository;
  final NoteRepositoryImpl noteRepository;
  final SpecialRequestsRepositoryImpl specialRequestsRepository;

  void _loadData(LoadData event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      final List<MajorGroup> listMajorGroups =
          await majorGroupRepository.getMajorGroups();
      final List<Menu> listMenu = await menuRepository.getMenu();
      final List<Item> listItem = await itemRepository
          .getItemByMenuID(state.currentSelectedMenuID.toString());
      final Check check = await checkRepository.getCheckByID('9');
      final TableInfo tableInfo =
          await tableInfoRepository.getTableInfoByCheckID('9');
      emit(
        state.copywith(
            listMajorGroups: listMajorGroups,
            listMenus: listMenu,
            listItems: listItem,
            check: check,
            tableInfo: tableInfo,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _loadSpecialRequestsForItem(
      LoadSpecialRequestsForItem event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      // TODO: Load selected special request too.
      final List<SpecialRequests> listSpecialRequest =
          await specialRequestsRepository
              .getSpecialRequestsByItemId(event.id.toString());
      emit(
        state.copywith(
            listSpecialRequest: listSpecialRequest,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _selectSpecialRequestsForItem(
      SelectSpecialRequestForItem event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      List<SpecialRequests> listSpecialRequest =
          state.listSelectedSpecialRequest;
      listSpecialRequest.contains(event.specialRequests)
          ? listSpecialRequest.remove(event.specialRequests)
          : listSpecialRequest = [...listSpecialRequest, event.specialRequests];
      emit(
        state.copywith(
            listSelectedSpecialRequest: listSpecialRequest,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _updateSpecialRequestsForItem(
      UpdateSpecialRequestForItem event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      List<SpecialRequests> listSpecialRequest =
          state.listSelectedSpecialRequest;
      CheckDetail checkDetail = state.check.checkDetail
          .firstWhere((element) => element.checkdetailid == event.checkid);
      checkDetail.specialRequest = listSpecialRequest;
      emit(
        state.copywith(
            listSelectedSpecialRequest: const [],
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _addItem(AddItem event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      CheckDetail detail = CheckDetail(
          checkdetailid: 0,
          itemid: event.item.id,
          itemname: event.item.name,
          quantity: 1,
          note: '',
          isreminded: false,
          amount: event.item.price,
          status: 'WAITING',
          specialRequest: []);
      state.check.checkDetail.insert(0, detail);
      state.check.subtotal = state.check.subtotal + event.item.price;
      state.check.totalamount = state.check.totalamount + event.item.price;
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.success));
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _updateInfo(UpdateInfo event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      TableInfo tableInfo =
          TableInfo(guestname: event.guestname, cover: event.cover);
      http.Response response =
          await tableInfoRepository.updateTableInfoByCheckID('9', tableInfo);
      emit(state.copywith(
          tableInfo: tableInfo, orderLayoutStatus: OrderLayoutStatus.success));
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _updateNote(UpdateNote event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      Note note = Note(note: event.note);
      http.Response response =
          await noteRepository.updateNoteByCheckID('9', note);
      emit(state.copywith(
          note: note, orderLayoutStatus: OrderLayoutStatus.success));
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _changeMode(ChangeMode event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      emit(
        state.copywith(
            currentMode: state.currentMode == CurrentMode.order
                ? CurrentMode.payment
                : CurrentMode.order,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _changeMenu(ChangeMenu event, Emitter<OrderLayoutState> emit) async {
    try {
      final List<Item> listItem =
          await itemRepository.getItemByMenuID(event.menuid.toString());
      emit(
        state.copywith(
            listItems: listItem,
            currentSelectedMenuID: event.menuid,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _changeMajor(ChangeMajor event, Emitter<OrderLayoutState> emit) async {
    try {
      final List<Item> items = await itemRepository
          .getItemByMenuID(state.currentSelectedMenuID.toString());
      emit(
        state.copywith(
            listItems: items
                .where((element) => event.majorid != 0
                    ? element.majorgroupid == event.majorid
                    : true)
                .toList(),
            currentSelectedMajorID: event.majorid,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }
}
