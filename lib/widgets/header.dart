import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: const Alignment(30, 2), children: [
      AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 1, 35, 66),
        toolbarHeight: 80,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notification_add)),
        ],
      ),
      Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          height: 75,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 1, 35, 66),
          ),
        ),
        Stack(alignment: AlignmentDirectional.center, children: [
          Container(
            height: 65,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
          ),
          Image.asset(height: 75, "assets/images/soli_logo.png")
        ])
      ]),
    ]);
  }
}
