import 'package:flutter/material.dart';

class SoliLogo extends StatelessWidget {
  const SoliLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 1, 35, 66),
        ),
      ),
      Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          height: 50,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
        Image.asset(height: 55, "assets/images/soli_logo.png")
      ])
    ]);
  }
}
