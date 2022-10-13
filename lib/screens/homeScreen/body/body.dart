import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soli/blocs/auth/auth_bloc.dart';
import 'package:soli/screens/homeScreen/body/bodyParts/book_data_row.dart';
import 'package:soli/screens/homeScreen/body/bodyParts/data_card.dart';
import 'package:soli/screens/homeScreen/body/bodyParts/greeting_row.dart';
import 'package:soli/screens/loginScreen/login_screen.dart';
import 'package:soli/screens/stockScreen/stock_screen.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
           Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StockScreen()));
                  },
                  child: const Text("Stock Page")),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LogoutRequested());
                  },
                  child: const Text("Logout")),
            ],
          ),
        ),
      ),
    );
  }
}
