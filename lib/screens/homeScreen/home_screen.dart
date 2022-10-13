import 'package:flutter/material.dart';
import 'package:soli/screens/homeScreen/body/body.dart';
import 'package:soli/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Header(),
      ),
      body: Body(),
      // bottomNavigationBar: ,
    );
  }
}
