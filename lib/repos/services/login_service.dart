import 'package:pos_res_android/repos/models/shift.dart';
import 'package:pos_res_android/repos/repository/login_repository.dart';

class LoginService {
  LoginRepository repos = LoginRepository();

  Future login(String username, String password) async {
    return repos.login(username, password);
  }

  Future logout() async {
    return repos.logout();
  }

  Future<List<Shift>> getShifts() async {
    return repos.getShifts();
  }

  Future getRole() async {
    return repos.getRole();
  }

  Future open(int shiftId, int amount) async {
    return repos.open(shiftId, amount);
  }

  Future close(int amount) async {
    return repos.close(amount);
  }
}
