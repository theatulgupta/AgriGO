import 'package:agri_go/views/pages/filter_screen.dart';
import 'package:agri_go/views/pages/home_screen.dart';
import 'package:agri_go/views/pages/result_screen.dart';
import 'package:agri_go/views/pages/splash_screen.dart';
import 'package:get/get.dart';

class RoutesName {
  static const String splashScreen = "/";
  static const String homeScreen = "/home";
  static const String filterScreen = "/filter";
  static const String resultScreen = "/result";
}

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.circularReveal,
            transitionDuration: const Duration(seconds: 1)),
        GetPage(
            name: RoutesName.homeScreen,
            page: () => HomeScreen(),
            transition: Transition.circularReveal,
            transitionDuration: const Duration(seconds: 1)),
        GetPage(
            name: RoutesName.filterScreen,
            page: () => const FilterScreen(),
            transition: Transition.circularReveal,
            transitionDuration: const Duration(seconds: 1)),
        GetPage(
            name: RoutesName.resultScreen,
            page: () => ResultScreen(),
            transition: Transition.circularReveal,
            transitionDuration: const Duration(seconds: 1)),
      ];
}
