import 'package:pos_res_android/repos/models/specialrequests.dart';

abstract class SpecialRequestsService {
  Future<List<SpecialRequests>> getSpecialRequestsByItemId(String id);
}
