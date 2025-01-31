import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_line_liff/flutter_line_liff.dart';

class LoginWebScreen extends StatefulWidget {
  const LoginWebScreen({super.key});

  @override
  State<LoginWebScreen> createState() => _LoginWebScreenState();
}

class _LoginWebScreenState extends State<LoginWebScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Profile? userInfo;

  Future<void> loginWithLine() async {
    await dotenv.load(fileName: "env");

    await FlutterLineLiff().init(
      config: Config(liffId: dotenv.env['LIFF_ID'].toString()),
      successCallback: () {
        print('LIFF init success.');
      },
      errorCallback: (error) {
        print('LIFF init error: ${error.name}');
      },
    );

    if (FlutterLineLiff().isLoggedIn) {
      userInfo = await FlutterLineLiff().profile;
      print("User: ${userInfo?.displayName}");
    } else {
      FlutterLineLiff().login(
        config: LoginConfig(
          redirectUri:
              'http://localhost:8080/', // 🔹 เปลี่ยนเป็น URL ของคุณ
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth = constraints.maxWidth > 600
                      ? 400.0
                      : constraints.maxWidth * 0.9;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: maxWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/nimseeseng.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: emailController,
                            obscureText: false,
                            decoration: const InputDecoration(
                              labelText: 'อีเมล',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'รหัสผ่าน',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text('เข้าสู่ระบบ'),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: loginWithLine,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 21, 231, 70),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text('เข้าสู่ระบบด้วย Line'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
