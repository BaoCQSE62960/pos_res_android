import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/services/login_service.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  // Socket socket;
  // LoginForm({Key? key, required this.socket}) : super(key: key);

  const LoginForm({Key? key}) : super(key: key);

  Future<bool> loginToSystem(String username, String password) async {
    LoginService service = LoginService();
    bool result = await service.login(username, password);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    String username = "";
    String password = "";
    return Form(
      child: Column(
        children: [
          const SizedBox(height: defaultPadding * 3),
          TextFormField(
            // keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor,
            // onSaved: (email) {},
            onChanged: (value) {
              username = value;
            },
            decoration: const InputDecoration(
              filled: true,
              fillColor: deactiveLightColor,
              // iconColor: primaryColor,
              prefixIconColor: primaryColor,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
              hintText: "Tài khoản",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: textColor,
              onChanged: (value) {
                password = value;
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: deactiveLightColor,
                prefixIconColor: primaryColor,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none,
                ),
                hintText: "Mật khẩu",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(
                    Icons.lock,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: activeColor,
                elevation: 0,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () async {
                if (await loginToSystem(username, password)) {
                  Navigator.of(context).pushNamed('/tableoverview');
                }
              },
              // onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) {
              //         return BlocProvider(
              //             create: (context) => TableLayoutBloc(),
              //             child: const TableLayoutScreen());
              //       },
              //     ),
              //   );
              // },
              child: Text(
                "Đăng nhập".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "close_btn",
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: voidColor,
                elevation: 0,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () {
                // socket.disconnectServer();
                SystemNavigator.pop();
              },
              // onPressed: () => exit(0),
              child: Text(
                "Thoát".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
