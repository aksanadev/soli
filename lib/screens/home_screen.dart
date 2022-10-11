import 'package:flutter/material.dart';
import 'package:soli/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Header(),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 35, right: 25, bottom: 25, left: 25),
        child: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text(
                      "1",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text("Total Task"),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      "550",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Text("Total Books"),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 28,
                      width: 95,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber, width: 2),
                          borderRadius: BorderRadius.circular(13)),
                    ),
                    const Text(
                      "View Task",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 1.5,
                  child: Container(
                    height: 120,
                    width: 140,
                  ),
                ),
                Card(
                  elevation: 1.5,
                  child: Container(
                    height: 120,
                    width: 140,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 1.5,
                  child: Container(
                    height: 120,
                    width: 140,
                  ),
                ),
                Card(
                  elevation: 1.5,
                  child: Container(
                    height: 120,
                    width: 140,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
