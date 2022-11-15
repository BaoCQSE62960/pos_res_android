import 'package:pos_res_android/repos/models/waiter/voidreason.dart';

abstract class VoidReasonService {
  Future<List<VoidReason>> getVoidReason();
}
