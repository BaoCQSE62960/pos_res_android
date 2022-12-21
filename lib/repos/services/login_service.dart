import 'package:pos_res_android/repos/models/cashier/shift.dart';
import 'package:pos_res_android/repos/repository/login_repository.dart';

class LoginService {
  LoginRepository repos = LoginRepository();

  Future login(String username, String password) async {
    return repos.login(username, password);
  }

  Future getLogo() async {
    return repos.getLogo();
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

  Future open(int shiftId, num amount) async {
    return repos.open(shiftId, amount);
  }

  Future close(num amount) async {
    return repos.close(amount);
  }
}
