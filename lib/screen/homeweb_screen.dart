import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line/screen/login_screen.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

class HomeWebScreen extends StatelessWidget {
  // final String displayName;
  // final String pictureUrl;
  // final String userId;
  // final String accessToken;

  const HomeWebScreen({
    super.key, required
    // required this.displayName,
    // required this.pictureUrl,
    // required this.userId,
    // required this.accessToken,
  });

  void logout(BuildContext context) async {
    try {
      await LineSDK.instance.logout();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } on PlatformException catch (e) {
      print("Logout failed: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // pictureUrl.isNotEmpty
            //     ? CircleAvatar(
            //         radius: 50,
            //         backgroundImage: NetworkImage(pictureUrl),
            //       )
            //     : const Icon(Icons.account_circle, size: 100),
            // const SizedBox(height: 10),
            // Text("ชื่อ: $displayName", style: const TextStyle(fontSize: 20)),
            // const Divider(),
            // Text("User ID: $userId", style: const TextStyle(fontSize: 12)),
            // const Divider(),
            // Text("accessToken: $accessToken",
            //     style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                logout(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('ออกจากระบบ'),
            ),
          ],
        ),
      ),
    );
  }
}
