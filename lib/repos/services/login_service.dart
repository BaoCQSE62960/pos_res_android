import 'package:pos_res_android/repos/models/opening.dart';
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
}
