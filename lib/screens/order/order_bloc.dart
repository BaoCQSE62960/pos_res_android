import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_res_android/repos/models/majorgroup.dart';
import 'package:pos_res_android/repos/repository/majorgroup_repository.dart';
import 'package:pos_res_android/screens/Order/order_event.dart';
import 'package:pos_res_android/screens/Order/order_state.dart';

class OrderLayoutBloc extends Bloc<OrderLayoutEvent, OrderLayoutState> {
  OrderLayoutBloc({required this.majorGroupRepository})
      : super(const OrderLayoutState()) {
    on<LoadData>(_loadData);
  }

  final MajorGroupRepositoryImpl majorGroupRepository;

  void _loadData(LoadData event, Emitter<OrderLayoutState> emit) async {
    emit(state.copywith(orderLayoutStatus: OrderLayoutStatus.loading));
    try {
      final List<MajorGroup> listMajorGroups =
          await majorGroupRepository.getMajorGroups();
      emit(
        state.copywith(
            listMajorGroups: listMajorGroups,
            orderLayoutStatus: OrderLayoutStatus.success),
      );
    } catch (error, stacktrace) {
      print(stacktrace);
      // emit(state.copyWith(status: CategoryStatus.error));
    }
  }
}
