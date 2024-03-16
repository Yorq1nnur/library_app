import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/screens/home/home_screen.dart';
import 'package:library_app/data/repositories/book_repo.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookViewModel(
            bookRepo: BookRepo(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.white,
          ),
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}
// import 'package:flutter/material.dart';
//
// class MyTextField extends StatefulWidget {
//   @override
//   _MyTextFieldState createState() => _MyTextFieldState();
// }
//
// class _MyTextFieldState extends State<MyTextField> {
//   TextEditingController _controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text Field Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 labelText: 'Enter your text',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 print('Text entered: ${_controller.text}');
//                 // You can use _controller.text for further processing
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: MyTextField(),
//   ));
// }
