import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soli/blocs/auth/auth_bloc.dart';
import 'package:soli/data/repositories/auth_repository.dart';
import 'package:soli/screens/loginScreen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (BuildContext context) {
          return AuthRepository();
        },
        child: BlocProvider(
          create: (context) => AuthBloc(authRepository: RepositoryProvider.of<AuthRepository>(context)),
          child: Listener(
                  onPointerUp: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Soli App',
              home: LoginScreen(),
            ),
          ),
        ),
    );
  }
}
