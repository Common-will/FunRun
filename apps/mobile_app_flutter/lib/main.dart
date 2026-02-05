import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/screens/login_screen.dart';
import 'package:mobile_app_flutter/theme/app_colors.dart';

void main() {
  runApp(const FunRunApp());
}

class FunRunApp extends StatelessWidget {
  const FunRunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FunRun',
      debugShowCheckedModeBanner: false,
      // Light Theme
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.solarWhite,
        colorScheme: ColorScheme.light(
          primary: AppColors.unityTeal,
          secondary: AppColors.sparkOrange,
          surface: AppColors.solarWhite,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      // Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.midnightCarbon,
        colorScheme: ColorScheme.dark(
          primary: AppColors.unityTeal,
          secondary: AppColors.luminousLime,
          surface: AppColors.midnightCarbon,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      themeMode: ThemeMode.light, // 기본: 라이트 모드
      home: const LoginScreen(),
    );
  }
}
