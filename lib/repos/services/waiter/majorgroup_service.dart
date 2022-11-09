import 'package:pos_res_android/repos/models/waiter/majorgroup.dart';

abstract class MajorGroupService {
  Future<List<MajorGroup>> getMajorGroups();
}
