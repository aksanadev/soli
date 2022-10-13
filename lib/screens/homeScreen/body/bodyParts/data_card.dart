import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  const DataCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

