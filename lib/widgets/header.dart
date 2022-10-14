import 'package:flutter/material.dart';
import 'package:soli/styles/colors.dart';
import 'package:soli/widgets/logos.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: const Alignment(30, 2), children: [
      AppBar(
        elevation: 0,
        backgroundColor: SoliColors.navyBlue,
        toolbarHeight: 80,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notification_add)),
        ],
      ),
      const SoliLogo(),
    ]);
  }
}