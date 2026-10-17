// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
     _FlutterCakeShopState(),
  );
}

class _FlutterCakeShopState extends StatefulWidget {
  const _FlutterCakeShopState({super.key});

  @override
  State<_FlutterCakeShopState> createState() => __FlutterCakeShopStateState();
}

class __FlutterCakeShopStateState extends State<_FlutterCakeShopState> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.apply(
          fontFamily: GoogleFonts.kanit().fontFamily,
          fontFamilyFallback: GoogleFonts.kanit().fontFamilyFallback,
        ),
      ),
    );
  }
}

