import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_app/screens/home/home_screen.dart';
import 'package:library_app/utils/colors/app_colors.dart';
import 'package:library_app/utils/images/app_images.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return  const HomeScreen();
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Center(
          child: Lottie.asset(
            AppImages.lottie,
          ),
        ),
      ),
    );
  }
}
