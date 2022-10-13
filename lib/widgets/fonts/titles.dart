import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Container(
                height: 30,
                // color: Colors.yellow.withOpacity(.5),
                child: const Text(
                  "Stock Management",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 35, 66),
                  ),
                )),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
