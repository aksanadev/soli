import 'package:flutter/material.dart';
import 'package:soli/widgets/fonts/titles.dart';
import 'package:soli/widgets/header.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Text: Stock Managment
      body: Column(children: [
        const Header(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MainTitle(),
              Card(
                child: Container(
                  height: 200,
                ),
              ),
            ],
          ),
        )
        // Card: total of books
        //category of books
        // to be recieved
        //list of available books
        //button to add books
      ]),
    );
  }
}
