import 'package:agri_go/routes.dart';
import 'package:agri_go/views/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AgriGO",
      theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
      home: HomeScreen(),
      initialRoute: "/",
      getPages: AppRoutes.appRoutes(),
    );
  }
}
