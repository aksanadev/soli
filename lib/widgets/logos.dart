import 'package:flutter/material.dart';
import 'package:soli/styles/colors.dart';

class SoliLogo extends StatelessWidget {
  const SoliLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        height: 75,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: SoliColors.navyBlue
        ),
      ),
      Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          height: 65,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
        Image.asset(height: 50, "assets/images/soli_logo_transparent_bg.png")
      ])
    ]);
  }
}
