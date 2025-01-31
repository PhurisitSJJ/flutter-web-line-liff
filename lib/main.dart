import 'package:flutter/material.dart';
import 'package:flutter_line/screen/homeweb_screen.dart';
import 'package:flutter_line/screen/loginweb_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter-Web Line Liff',
    initialRoute: '/',
    routes: {
      '/': (context) => LoginWebScreen(), // หน้า LoginWebScreen
      '/home': (context) => HomeWebScreen(), // หน้า HomeWebScreen
    },
    // onGenerateRoute: (settings) {
    //   if (settings.name == '/home') {
    //     // ตรวจสอบ URL ที่มาพร้อมกับพารามิเตอร์
    //     final uri = Uri.parse(settings.arguments as String);

    //     if (uri.queryParameters.containsKey('code')) {
    //       // ตรวจสอบพารามิเตอร์ code ที่ส่งมาจาก Line
    //       final code = uri.queryParameters['code'];

    //       // ส่งข้อมูลไปที่หน้า HomeWebScreen พร้อม code ที่ได้รับ
    //       return MaterialPageRoute(
    //         builder: (context) => HomeWebScreen(
    //           // code: code ?? '',
    //         ),
    //       );
    //     }
    //   }

    //   return null;
    // },
  ));
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // return null;
//     // return const MaterialApp(home: LoginWebScreen());
//     // return const MaterialApp(
//     //   initialRoute: '/',
//     //   routes: {
//     //     '/': (context) => const LoginWidget(),
//     //     '/home': (context) => const HomeWidget(),
//     //   },
//     //   // home: LoginWebScreen()
//     // );
//     return MaterialApp(
//       title: 'Named Routes Demo',
//       // Start the app with the "/" named route. In this case, the app starts
//       // on the FirstScreen widget.
//       initialRoute: '/',
//       routes: {
//         // When navigating to the "/" route, build the FirstScreen widget.
//         '/': (context) => const LoginWidget(),
//         // When navigating to the "/second" route, build the SecondScreen widget.
//         '/second': (context) => const HomeWidget(),
//       },
//     );
//   }
// }
