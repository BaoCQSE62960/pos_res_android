import 'package:flutter/material.dart';
import 'package:pos_res_android/config/theme.dart';
import 'package:pos_res_android/repos/services/login_service.dart';

class LoginScreenImage extends StatefulWidget {
  const LoginScreenImage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreenImage> createState() => _LoginScreenImageState();
}

class _LoginScreenImageState extends State<LoginScreenImage> {
  String logoURL = "";

  Future getLogoUrl() async {
    LoginService service = LoginService();
    logoURL = await service.getLogo();
    return logoURL;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLogoUrl(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              const SizedBox(height: defaultPadding * 2),
              Container(
                width: 390,
                decoration: BoxDecoration(
                  color: textLightColor,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: const [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 4,
                      offset: Offset(0, 4), // Shadow position
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          logoURL,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding * 2),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
