import 'package:pos_res_android/repos/repository/login_repository.dart';

class LoginService {
  LoginRepository repos = LoginRepository();

  Future<bool> login(String username, String password) async {
    return repos.login(username, password);
  }
}
