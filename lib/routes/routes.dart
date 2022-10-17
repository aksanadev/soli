import 'package:flutter/material.dart';
import 'package:soli/screens/homeScreen/home_screen.dart';

class Routes {

  static  String homeScreen = '/homeScreen';

  static List<MaterialPage<dynamic>> get pages => [
    MaterialPage(key: ValueKey(homeScreen), child: HomeScreen() ),
  ];
}
