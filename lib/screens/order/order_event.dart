import 'package:equatable/equatable.dart';
import 'package:pos_res_android/repos/models/waiter/item.dart';
import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';
import 'package:pos_res_android/screens/Order/widget/custom_quantity_button.dart';

class OrderLayoutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadData extends OrderLayoutEvent {
  LoadData({required this.tableid, required this.checkid});

  final int checkid;
  final int tableid;
}

class ChangeMenu extends OrderLayoutEvent {
  ChangeMenu({required this.menuid});

  final int menuid;
}

class ChangeMajor extends OrderLayoutEvent {
  ChangeMajor({required this.majorid});

  final int majorid;
}

class ChangeMode extends OrderLayoutEvent {
  ChangeMode();
}

class AddItem extends OrderLayoutEvent {
  AddItem({required this.item});

  final Item item;
}

class UpdateInfo extends OrderLayoutEvent {
  UpdateInfo({required this.guestname, required this.cover});

  final String guestname;
  final int cover;
}

class UpdateNote extends OrderLayoutEvent {
  UpdateNote({required this.note});

  final String note;
}

class LoadSpecialRequestsForItem extends OrderLayoutEvent {
  LoadSpecialRequestsForItem(
      {required this.itemid, required this.checkdetailid});

  final int itemid;
  final int checkdetailid;
}

class SelectSpecialRequestForItem extends OrderLayoutEvent {
  SelectSpecialRequestForItem({required this.specialRequests});

  final SpecialRequests specialRequests;
}

class UpdateSpecialRequestForItem extends OrderLayoutEvent {
  UpdateSpecialRequestForItem({required this.checkdetailid});

  final int checkdetailid;
}

class UpdateQuantity extends OrderLayoutEvent {
  UpdateQuantity({required this.checkDetailIDLocal, required this.mode});

  final int checkDetailIDLocal;
  final QuantityUpdateMode mode;
}

class SendOrder extends OrderLayoutEvent {
  SendOrder();
}
