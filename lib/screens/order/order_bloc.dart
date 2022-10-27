import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/repos/models/majorgroup.dart';
import 'package:pos_res_android/repos/models/menu.dart';
import 'package:pos_res_android/repos/repository/majorgroup_repository.dart';
import 'package:pos_res_android/repos/repository/menu_repository.dart';
import 'package:pos_res_android/screens/Order/order_event.dart';
import 'package:pos_res_android/screens/Order/order_state.dart';

class OrderLayoutBloc extends Bloc<OrderLayoutEvent, OrderLayoutState> {
  OrderLayoutBloc(
      {required this.majorGroupRepository, required this.menuRepository})
      : super(const OrderLayoutState()) {
    on<LoadData>(_loadData);
  }

  final MajorGroupRepositoryImpl majorGroupRepository;
  final MenuRepositoryImpl menuRepository;

  void _loadData(LoadData event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      final List<MajorGroup> listMajorGroups =
          await majorGroupRepository.getMajorGroups();
      final List<Menu> listMenu = await menuRepository.getMenu();
      emit(
        state.copywith(
            listMajorGroups: listMajorGroups,
            listMenus: listMenu,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      // emit(state.copyWith(status: CategoryStatus.error));
    }
  }
}
