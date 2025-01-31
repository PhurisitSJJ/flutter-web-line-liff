import 'package:flutter/material.dart';
import 'package:flutter_line/screen/home_screen.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    lineSDKInit();
    super.initState();
  }

  void lineSDKInit() async {
    await LineSDK.instance.setup("2006823885").then((value) {
      print("LINE SDK is initialized");
    }).catchError((e) {
      print("Error initializing LINE SDK: $e");
    });
  }

  void loginWithLine() async {
    try {
      final result = await LineSDK.instance.login(scopes: ["profile", "openid", "email"]);
      
      final profile = result.userProfile;
      final displayName = profile?.displayName ?? "";
      final pictureUrl = profile?.pictureUrl ?? "";
      final userId = profile?.userId ?? "";
      final accessToken = result.accessToken.value;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePageScreen(
            displayName: displayName,
            pictureUrl: pictureUrl,
            userId: userId,
            accessToken: accessToken,
          ),
        ),
      );
        } catch (e) {
      print("Login failed: $e");
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
                  final maxWidth = constraints.maxWidth > 600 ? 400.0 : constraints.maxWidth * 0.9;
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
                           const SizedBox(height: 10),
                          TextField(
                            controller: emailController,
                            obscureText: true,
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
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text('เข้าสู่ระบบ'),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: loginWithLine,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 21, 231, 70),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              minimumSize: const Size(double.infinity, 50),
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
