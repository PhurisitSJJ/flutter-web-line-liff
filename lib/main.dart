import 'package:flutter/material.dart';
import 'package:flutter_line/screen/homeweb_screen.dart';
import 'package:flutter_line/screen/loginweb_screen.dart';

void main() {
  runApp(MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginWebScreen(),
        '/home': (context) => HomeWebScreen(displayName: '', pictureUrl: '', userId: '', accessToken: '',),
      },
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
