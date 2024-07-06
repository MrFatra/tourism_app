import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tourism_app/helper/constant.dart';

import 'screens/home.dart';

class MyMaterial extends StatelessWidget {
  const MyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pariwisata App',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 430, name: PHONE),
          const Breakpoint(start: 431, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(kPrimaryColor),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            elevation: WidgetStateProperty.all(5),
            padding:
                WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 20)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
      home: const Home(),
    );
  }
}
