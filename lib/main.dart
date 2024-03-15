import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'screens/global_screen/global_screen.dart';

void main() {
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (_) => CountryViewModel(
    //         countryRepo: CountryRepo(),
    //       ),
    //     ),
    //   ],
    //   child: const MyApp(),
    // ),
    const MyApp()
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
      child: const GlobalScreen(),
    );
  }
}
