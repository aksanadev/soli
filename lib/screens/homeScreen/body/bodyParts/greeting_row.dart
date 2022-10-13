import 'package:flutter/material.dart';

class GreetingRow extends StatelessWidget {
  const GreetingRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 20,
                // color: Colors.yellow.withOpacity(.5),
                child: const Text(
                  "Monday, October 10",
                  style: TextStyle(color: Color.fromARGB(255, 82, 97, 118)),
                ),
                // child: ,
              ),
              Container(
                  height: 30,
                  // color: Colors.yellow.withOpacity(.5),
                  child: const Text(
                    "Hey, Aksana Buster",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 35, 66),
                    ),
                  )),
              const SizedBox(
                height: 10,
              )
            ]),
            const CircleAvatar(
              radius: 25,
              backgroundColor: Color.fromARGB(255, 228, 231, 240),
              child: Text(
                "AB",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 35, 66),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
