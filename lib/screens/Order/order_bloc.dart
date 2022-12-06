// ignore_for_file: avoid_function_literals_in_foreach_calls, unused_local_variable, library_prefixes

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/repos/models/waiter/dto/checkDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/itemDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/openTableDTO.dart';
import 'package:pos_res_android/repos/models/waiter/dto/specialrequestDTO.dart';
import 'package:pos_res_android/repos/models/waiter/check.dart';
import 'package:pos_res_android/repos/models/waiter/checkdetail.dart';
import 'package:pos_res_android/repos/models/waiter/dto/voidreasonDTO.dart';
import 'package:pos_res_android/repos/models/waiter/item.dart';
import 'package:pos_res_android/repos/models/waiter/majorgroup.dart';
import 'package:pos_res_android/repos/models/waiter/menu.dart';
import 'package:pos_res_android/repos/models/waiter/note.dart';
import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';
import 'package:pos_res_android/repos/models/waiter/tableinfo.dart';
import 'package:pos_res_android/repos/models/waiter/voidreason.dart';
import 'package:pos_res_android/repos/repository/waiter/check_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/item_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/majorgroup_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/menu_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/note_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/specialrequests_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/tableinfo_repository.dart';
import 'package:pos_res_android/repos/repository/waiter/voidreason_repository.dart';
import 'package:pos_res_android/screens/Order/order_event.dart';
import 'package:pos_res_android/screens/Order/order_state.dart';
import 'package:http/http.dart' as http;
import 'package:pos_res_android/screens/Order/widget/buttons/custom_quantity_button.dart'
    as AddOrder;
import 'package:pos_res_android/screens/Order/widget/buttons/custom_quantity_button_change_order.dart'
    as ChangeOrder;

class OrderLayoutBloc extends Bloc<OrderLayoutEvent, OrderLayoutState> {
  OrderLayoutBloc(
      {required this.majorGroupRepository,
      required this.menuRepository,
      required this.itemRepository,
      required this.checkRepository,
      required this.tableInfoRepository,
      required this.noteRepository,
      required this.specialRequestsRepository,
      required this.voidReasonRepository})
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
    on<SelectPercentForSplitOrder>(_selectPercentForSplitOrder);
    on<SelectCheckDetailForChangeOrder>(_selectCheckDetailForChangeOrder);
    on<SelectVoidReason>(_selectVoidReason);
    on<UpdateSpecialRequestForItem>(_updateSpecialRequestsForItem);
    on<UpdateQuantity>(_updateQuantity);
    on<UpdateQuantityChangeOrder>(_updateQuantityChangeOrder);
    on<SendOrder>(_sendOrder);
    on<VoidACheck>(_voidACheck);
    on<VoidACheckDetail>(_voidACheckDetail);
    on<ServedACheckDetail>(_servedACheckDetail);
    on<RemindACheckDetail>(_remindACheckDetail);
    on<RemoveLocalCheckDetail>(_removeLocalCheckDetail);
  }

  final MajorGroupRepositoryImpl majorGroupRepository;
  final MenuRepositoryImpl menuRepository;
  final ItemRepositoryImpl itemRepository;
  final CheckRepositoryImpl checkRepository;
  final TableInfoRepositoryImpl tableInfoRepository;
  final NoteRepositoryImpl noteRepository;
  final SpecialRequestsRepositoryImpl specialRequestsRepository;
  final VoidReasonRepositoryImpl voidReasonRepository;

  void _loadData(LoadData event, Emitter<OrderLayoutState> emit) async {
    if (event.searchQuery == null) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    }

    try {
      final List<MajorGroup> listMajorGroups =
          await majorGroupRepository.getMajorGroups();
      final List<Menu> listMenu = await menuRepository.getMenu();
      final List<Item> listItem = await itemRepository.getItemByMenuID(
          state.currentSelectedMenuID == 0
              ? listMenu[0].id.toString()
              : state.currentSelectedMenuID.toString());
      final List<Item> listFullItem =
          await itemRepository.getItemByMenuID(0.toString());
      final List<VoidReason> listVoidReason =
          await voidReasonRepository.getVoidReason();
      final Check check = event.checkid == 0
          ? Check.EMPTY
          : await checkRepository.getCheckByID(event.checkid.toString());
      final TableInfo tableInfo = event.checkid == 0
          ? TableInfo.EMPTY
          : await tableInfoRepository
              .getTableInfoByCheckID(event.checkid.toString());
      if (event.searchQuery != null) {
        listItem.retainWhere(
            (element) => element.name.contains(event.searchQuery!));
      }
      emit(
        state.copywith(
            selectedVoidReason: listVoidReason[0],
            listVoidReason: listVoidReason,
            currentSelectedMenuID: listMenu[0].id,
            checkId: event.checkid,
            tableId: event.tableid,
            listMajorGroups: listMajorGroups,
            listMenus: listMenu,
            listItems: listItem,
            listFullItems: listFullItem,
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
      List<SpecialRequests> listSpecialRequestSeletected =
          List<SpecialRequests>.from(state.check.checkDetail
              .firstWhere((element) =>
                  element.checkdetailidLocal == event.checkdetailid)
              .specialRequest);
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
      listSpecialRequest
              .map((e) => e.id)
              .toList()
              .contains(event.specialRequests.id)
          ? listSpecialRequest.remove(listSpecialRequest
              .firstWhere((element) => element.id == event.specialRequests.id))
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

  void _selectCheckDetailForChangeOrder(SelectCheckDetailForChangeOrder event,
      Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      List<CheckDetail> listCheckDetail = state.listSelectedCheckDetail;
      listCheckDetail.contains(event.checkDetail)
          ? listCheckDetail.remove(event.checkDetail)
          : listCheckDetail = [...listCheckDetail, event.checkDetail];
      emit(
        state.copywith(
            listSelectedCheckDetail: listCheckDetail,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _selectPercentForSplitOrder(
      SelectPercentForSplitOrder event, Emitter<OrderLayoutState> emit) async {
    try {
      emit(
        state.copywith(
            percent: event.percent,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _selectVoidReason(
      SelectVoidReason event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      emit(
        state.copywith(
            selectedVoidReason: event.voidReason,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _voidACheck(VoidACheck event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      VoidReasonDTO voidReasonDTO =
          VoidReasonDTO(voidid: state.selectedVoidReason.id);
      http.Response response =
          await checkRepository.voidCheck(event.checkid, voidReasonDTO);
      emit(
        state.copywith(orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _voidACheckDetail(
      VoidACheckDetail event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      VoidReasonDTO voidReasonDTO =
          VoidReasonDTO(voidid: state.selectedVoidReason.id);
      http.Response response = await checkRepository.voidCheckDetail(
          event.checkdetailid, voidReasonDTO);
      emit(
        state.copywith(orderLayoutStatus: OrderLayoutStatus.loading),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _servedACheckDetail(
      ServedACheckDetail event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      http.Response response =
          await checkRepository.servedCheckDetail(event.checkdetailid);
      emit(
        state.copywith(orderLayoutStatus: OrderLayoutStatus.loading),
      );
      // LoadData(tableid: state.tableId, checkid: state.checkId);
      LoadData(checkid: state.checkId, tableid: state.tableId);
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _remindACheckDetail(
      RemindACheckDetail event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      http.Response response =
          await checkRepository.remindCheckDetail(event.checkdetailid);
      emit(
        state.copywith(orderLayoutStatus: OrderLayoutStatus.success),
      );
      LoadData(checkid: state.checkId, tableid: state.tableId);
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
      double quantity = checkDetail.quantity;
      if (event.mode == AddOrder.QuantityUpdateMode.decrease && quantity <= 1) {
        state.check.checkDetail.remove(checkDetail);
      } else {
        quantity = event.mode == AddOrder.QuantityUpdateMode.increase
            ? quantity = quantity + 1
            : quantity == 1
                ? 1
                : quantity = quantity - 1;
        checkDetail.quantity = quantity;
      }
      state.check.subtotal = event.mode == AddOrder.QuantityUpdateMode.increase
          ? state.check.subtotal + (checkDetail.amount)
          : state.check.subtotal - (checkDetail.amount);
      state.check.totaltax = event.mode == AddOrder.QuantityUpdateMode.increase
          ? state.check.totaltax +
              calculateTaxValueForItem(
                  double.parse(checkDetail.amount.toString()))
          : state.check.totaltax -
              calculateTaxValueForItem(
                  double.parse(checkDetail.amount.toString()));
      state.check.totalamount =
          event.mode == AddOrder.QuantityUpdateMode.increase
              ? state.check.totalamount +
                  (checkDetail.amount +
                      calculateTaxValueForItem(
                          double.parse(checkDetail.amount.toString())))
              : state.check.totalamount -
                  (checkDetail.amount +
                      calculateTaxValueForItem(
                          double.parse(checkDetail.amount.toString())));
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

  void _updateQuantityChangeOrder(
      UpdateQuantityChangeOrder event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      CheckDetail checkDetail = state.listSelectedCheckDetail.firstWhere(
          (element) => element.checkdetailid == event.checkDetailID);
      double quantity = checkDetail.checkdetailquantityLocal;
      quantity = event.mode == ChangeOrder.QuantityUpdateMode.increase
          ? quantity = quantity + 1.0
          : quantity == 1.0
              ? 1.0
              : quantity = quantity - 1.0;
      checkDetail.checkdetailquantityLocal =
          double.parse(quantity.toStringAsFixed(2));
      List<CheckDetail> updatedCheckDetail = state.listSelectedCheckDetail;
      updatedCheckDetail[updatedCheckDetail.indexOf(
              updatedCheckDetail.firstWhere(
                  (element) => element.checkdetailid == event.checkDetailID))] =
          checkDetail;
      emit(
        state.copywith(
            listSelectedCheckDetail: updatedCheckDetail,
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
      CheckDetail checkDetail = state.check.checkDetail.firstWhere(
          (element) => element.checkdetailidLocal == event.checkdetailid);
      checkDetail.specialRequest = listSpecialRequest;
      checkDetail.note = event.note;
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
      if (event.item != null) {
        if (!event.item!.status.isOutofStock) {
          CheckDetail detail = CheckDetail(
              checkdetailidLocal: state.currentLocalID++,
              checkdetailquantityLocal: 1,
              isLocal: true,
              checkdetailid: 0,
              itemid: event.item!.id,
              itemname: event.item!.name,
              quantity: 1,
              note: '',
              isreminded: false,
              amount: double.parse(event.item!.price.toString()),
              status: 'LOCAL',
              specialRequest: []);
          state.check.checkDetail.insert(0, detail);
          state.check.subtotal = state.check.subtotal + event.item!.price;
          state.check.totaltax = state.check.totaltax +
              calculateTaxValueForItem(
                  double.parse(event.item!.price.toString()));
          state.check.totalamount = state.check.totalamount +
              event.item!.price +
              calculateTaxValueForItem(
                  double.parse(event.item!.price.toString()));
          emit(state.copywith(
              currentLocalID: state.currentLocalID++,
              orderLayoutStatus: OrderLayoutStatus.success));
        } else {
          emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.success));
        }
      } else {
        CheckDetail detail = CheckDetail(
            checkdetailidLocal: state.currentLocalID++,
            checkdetailquantityLocal:
                event.checkDetail!.checkdetailquantityLocal,
            isLocal: true,
            checkdetailid: 0,
            itemid: event.checkDetail!.itemid,
            itemname: event.checkDetail!.itemname,
            quantity: event.checkDetail!.quantity < 1
                ? 1
                : event.checkDetail!.quantity,
            note: event.checkDetail!.note,
            isreminded: false,
            amount: !event.checkDetail!.isLocal
                ? double.parse(
                    (event.checkDetail!.amount / event.checkDetail!.quantity)
                        .toString())
                : double.parse((event.checkDetail!.amount).toString()),
            status: 'LOCAL',
            specialRequest: event.checkDetail!.specialRequest);
        state.check.checkDetail.insert(0, detail);
        state.check.subtotal = state.check.subtotal +
            (event.checkDetail!.isLocal
                ? detail.amount * detail.quantity
                : detail.amount);
        state.check.totaltax = state.check.totaltax +
            calculateTaxValueForItem(double.parse((event.checkDetail!.isLocal
                    ? detail.amount * detail.quantity
                    : detail.amount)
                .toString()));
        state.check.totalamount = state.check.totalamount +
            (event.checkDetail!.isLocal
                ? detail.amount * detail.quantity
                : detail.amount) +
            calculateTaxValueForItem(double.parse((detail.isLocal
                    ? detail.amount * detail.quantity
                    : detail.amount)
                .toString()));
        emit(state.copywith(
            currentLocalID: state.currentLocalID++,
            orderLayoutStatus: OrderLayoutStatus.success));
      }
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  void _updateInfo(UpdateInfo event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      TableInfo tableInfo =
          TableInfo(guestname: event.guestname, cover: event.cover);
      http.Response response = await tableInfoRepository
          .updateTableInfoByCheckID(state.checkId.toString(), tableInfo);
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
      http.Response response = await noteRepository.updateNoteByCheckID(
          state.checkId.toString(), note);
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
            currentSelectedMajorID: state.listMajorGroups[0].id,
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
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }

  double calculateTaxValueForItem(double price) {
    // Get tax value from BE
    return (price * 10 / 100);
  }

  FutureOr<void> _removeLocalCheckDetail(
      RemoveLocalCheckDetail event, Emitter<OrderLayoutState> emit) {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      CheckDetail checkDetail = state.check.checkDetail.firstWhere(
          (element) => element.checkdetailidLocal == event.checkDetailID);
      state.check.subtotal =
          state.check.subtotal - (checkDetail.amount * checkDetail.quantity);
      state.check.totaltax = state.check.totaltax -
          calculateTaxValueForItem(double.parse(
              (checkDetail.amount * checkDetail.quantity).toString()));
      state.check.totalamount = state.check.totalamount -
          (checkDetail.amount * checkDetail.quantity +
              calculateTaxValueForItem(double.parse(
                  (checkDetail.amount * checkDetail.quantity).toString())));
      state.check.checkDetail.removeWhere(
          (element) => element.checkdetailidLocal == event.checkDetailID);
      emit(
        state.copywith(
            check: state.check, orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error) {
      emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.error));
    }
  }
}
