import 'package:flutter/material.dart';
import 'package:soli/styles/colors.dart';

class BookDataRow extends StatelessWidget {
  const BookDataRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Text(
                  "1",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text("Total Task"),
              ],
            ),
            Column(
              children: const [
                Text(
                  "550",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
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
                      border: Border.all(color: SoliColors.gold),
                      borderRadius: BorderRadius.circular(13)),
                ),
                const Text(
                  "View Task",
                  style: TextStyle(color: SoliColors.gold),
                ),
              ],
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
