import 'package:flutter/material.dart';
import 'package:soli/screens/homeScreen/body/bodyParts/book_data_row.dart';
import 'package:soli/screens/homeScreen/body/bodyParts/data_card.dart';
import 'package:soli/screens/homeScreen/body/bodyParts/greeting_row.dart';
import 'package:soli/screens/stockScreen/stock_screen.dart';


class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 35, right: 25, bottom: 25, left: 25),
        child: Column(
          children: [
            const GreetingRow(),
            const BookDataRow(),
            const DataCard(),
            const DataCard(),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const StockScreen()));
                },
                child: const Text("Stock Page"))
          ],
        ),
      ),
    );
  }
}
