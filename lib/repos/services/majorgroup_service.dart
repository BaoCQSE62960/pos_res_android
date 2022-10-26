import 'package:pos_res_android/repos/models/majorgroup.dart';

abstract class MajorGroupService {
  Future<List<MajorGroup>> getMajorGroups();
}
