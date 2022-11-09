import 'package:pos_res_android/repos/models/waiter/specialrequests.dart';

abstract class SpecialRequestsService {
  Future<List<SpecialRequests>> getSpecialRequestsByItemId(String id);
}
