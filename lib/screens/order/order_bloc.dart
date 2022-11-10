// ignore_for_file: avoid_function_literals_in_foreach_calls, unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/repos/models/waiter/dto/checkDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/itemDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/openTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/specialrequestDTO.dart';
import 'package:pos_res_android/repos/models/waiter/check.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/repos/models/waiter/item.dart';
import 'package:pos_res_android/repos/models/waiter/majorgroup.dart';
import 'package:pos_res_android/repos/models/waiter/menu.dart';
import 'package:pos_res_android/repos/models/waiter/note.dart';
import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';
import 'package:pos_res_android/repos/models/waiter/tableinfo.dart';
import 'package:pos_res_android/repos/repository/waiter/check_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/item_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/majorgroup_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/menu_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/note_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/specialrequests_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/tableinfo_repository.dart';
import 'package:pos_res_android/screens/Order/order_event.dart';
import 'package:pos_res_android/screens/Order/order_state.dart';
import 'package:http/http.dart' as http;
import 'package:pos_res_android/screens/Order/widget/custom_quantity_button.dart';

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
    on<UpdateQuantity>(_updateQuantity);
    on<SendOrder>(_sendOrder);
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
      final Check check = event.checkid == 0
          ? Check.EMPTY
          : await checkRepository.getCheckByID(event.checkid.toString());
      final TableInfo tableInfo = event.checkid == 0
          ? TableInfo.EMPTY
          : await tableInfoRepository
              .getTableInfoByCheckID(event.checkid.toString());
      emit(
        state.copywith(
            tableId: event.tableid,
            checkId: event.checkid,
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
      final List<SpecialRequests> listSpecialRequest =
          await specialRequestsRepository
              .getSpecialRequestsByItemId(event.itemid.toString());
      List<SpecialRequests> listSpecialRequestSeletected = state
          .check.checkDetail
          .firstWhere(
              (element) => element.checkdetailidLocal == event.checkdetailid)
          .specialRequest;
      emit(
        state.copywith(
            listSelectedSpecialRequest: listSpecialRequestSeletected,
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

  void _updateQuantity(
      UpdateQuantity event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      CheckDetail checkDetail = state.check.checkDetail.firstWhere(
          (element) => element.checkdetailidLocal == event.checkDetailIDLocal);
      int quantity = checkDetail.quantity;
      quantity = event.mode == QuantityUpdateMode.increase
          ? quantity = quantity + 1
          : quantity == 1
              ? 1
              : quantity = quantity - 1;
      checkDetail.quantity = quantity;
      state.check.subtotal = event.mode == QuantityUpdateMode.increase
          ? state.check.subtotal + (checkDetail.amount)
          : state.check.subtotal - (checkDetail.amount);
      state.check.totaltax = event.mode == QuantityUpdateMode.increase
          ? state.check.totaltax + calculateTaxValueForItem(checkDetail.amount)
          : state.check.totaltax - calculateTaxValueForItem(checkDetail.amount);
      state.check.totalamount = event.mode == QuantityUpdateMode.increase
          ? state.check.totalamount +
              (checkDetail.amount +
                  calculateTaxValueForItem(checkDetail.amount))
          : state.check.totalamount -
              (checkDetail.amount +
                  calculateTaxValueForItem(checkDetail.amount));
      Check updatedCheck = state.check;
      updatedCheck.checkDetail[updatedCheck.checkDetail.indexOf(
              state.check.checkDetail.firstWhere((element) =>
                  element.checkdetailidLocal == event.checkDetailIDLocal))] =
          checkDetail;
      emit(
        state.copywith(
            check: updatedCheck, orderLayoutStatus: OrderLayoutStatus.success),
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
      CheckDetail checkDetail = state.check.checkDetail.firstWhere(
          (element) => element.checkdetailidLocal == event.checkdetailid);
      checkDetail.specialRequest = listSpecialRequest;
      Check updatedCheck = state.check;
      updatedCheck.checkDetail[updatedCheck.checkDetail.indexOf(
              state.check.checkDetail.firstWhere((element) =>
                  element.checkdetailidLocal == event.checkdetailid))] =
          checkDetail;
      emit(
        state.copywith(
            check: updatedCheck, orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _addItem(AddItem event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      if (state.checkId == 0) {
        OpenTableDTO openTableDTO =
            await checkRepository.openTable(state.tableId);
        final Check check =
            await checkRepository.getCheckByID(openTableDTO.checkid.toString());
        final TableInfo tableInfo = await tableInfoRepository
            .getTableInfoByCheckID(openTableDTO.checkid.toString());
        emit(state.copywith(
            checkId: openTableDTO.checkid,
            check: check,
            tableInfo: tableInfo,
            orderLayoutStatus: OrderLayoutStatus.loading));
      }
      CheckDetail detail = CheckDetail(
          checkdetailidLocal: state.currentLocalID++,
          isLocal: true,
          checkdetailid: 0,
          itemid: event.item.id,
          itemname: event.item.name,
          quantity: 1,
          note: '',
          isreminded: false,
          amount: event.item.price,
          status: 'LOCAL',
          specialRequest: []);
      state.check.checkDetail.insert(0, detail);
      state.check.subtotal = state.check.subtotal + event.item.price;
      state.check.totaltax =
          state.check.totaltax + calculateTaxValueForItem(event.item.price);
      state.check.totalamount = state.check.totalamount +
          event.item.price +
          calculateTaxValueForItem(event.item.price);
      emit(state.copywith(
          currentLocalID: state.currentLocalID++,
          orderLayoutStatus: OrderLayoutStatus.success));
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

  void _sendOrder(SendOrder event, Emitter<OrderLayoutState> emit) async {
    try {
      List<ItemDTO> items = [];
      state.check.checkDetail.forEach((checkDetailElement) {
        if (checkDetailElement.isLocal) {
          List<SpecialRequestDTO> specialRequest = [];
          checkDetailElement.specialRequest.forEach((specialRequestElement) {
            SpecialRequestDTO specialRequestDTO =
                SpecialRequestDTO(specialrequestid: specialRequestElement.id);
            specialRequest.add(specialRequestDTO);
          });
          ItemDTO itemDTO = ItemDTO(
              itemid: checkDetailElement.itemid.toString(),
              itemprice: checkDetailElement.amount.toString(),
              quantity: checkDetailElement.quantity.toString(),
              subtotal:
                  (checkDetailElement.amount * checkDetailElement.quantity)
                      .toString(),
              taxamount: calculateTaxValueForItem(
                      checkDetailElement.amount * checkDetailElement.quantity)
                  .toString(),
              amount: (calculateTaxValueForItem(checkDetailElement.amount *
                          checkDetailElement.quantity) +
                      (checkDetailElement.amount * checkDetailElement.quantity))
                  .toString(),
              note: checkDetailElement.note,
              listSpecialRequestDTO: specialRequest);
          items.add(itemDTO);
        }
      });
      CheckDTO checkDTO =
          CheckDTO(checkid: state.check.checkid.toString(), listItemDTO: items);
      http.Response response = await checkRepository.updateCheck(checkDTO);
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.success));
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  int calculateTaxValueForItem(int price) {
    // Get tax value from BE
    return (price * 10 / 100).round();
  }
}
