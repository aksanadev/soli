import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soli/blocs/auth/auth_bloc.dart';
import 'package:soli/screens/homeScreen/home_screen.dart';
import 'package:soli/styles/colors.dart';
import 'package:soli/widgets/clippers/clippers.dart';
import 'package:soli/widgets/forms/forms.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailCon = TextEditingController();
  final _passwordCon = TextEditingController();

  @override
  void dispose() {
    _emailCon.dispose();
    _passwordCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is Unauthenticated) {
            return SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipPath(
                        clipper: SlantedDownClip(),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: SoliColors.gold,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10))),
                          height: MediaQuery.of(context).size.height * .4,
                        ),
                      ),
                      ClipPath(
                        clipper: SlantedUpClip(),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.15),
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10))),
                          height: MediaQuery.of(context).size.height * .415,
                        ),
                      ),
                      ClipPath(
                        clipper: SlantedUpClip(),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: SoliColors.navyBlue,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10))),
                          height: MediaQuery.of(context).size.height * .38,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(backgroundColor: Colors.transparent,radius: 35, child: Image.asset("assets/images/soli_logo_white.png"),),
                            Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 5),
                              child: Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 25),),
                            ),Text("Welcome back! Please sign into your\naccount", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: _loginFormKey,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: InputEmailField(
                                    keyboard: TextInputType.emailAddress,
                                    textController: _emailCon,
                                    validatorText: "Enter an email",
                                    fieldName: "Email"),
                              ),
                              InputField(
                                  keyboard: TextInputType.visiblePassword,
                                  textController: _passwordCon,
                                  validatorText: "Enter min. 6 characters",
                                  fieldName: "Password"),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25),
                                child: OutlinedButton(
                                    onPressed: () {
                                      return _authenticate(context);
                                    },
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide.none,
                                        minimumSize:
                                            const Size(double.infinity, 44),
                                        backgroundColor: SoliColors.gold,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        )),
                                    child: const Text(
                                      "SIGN IN",
                                      style: TextStyle(
                                          color: SoliColors.navyBlue,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account?"),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Sign up",
                                      style: TextStyle(color: SoliColors.gold),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: Text("Loading..."),
          );
        }),
      ),
    );
  }

  void _authenticate(context) {
    if (_loginFormKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context)
          .add(LoginRequested(_emailCon.text, _passwordCon.text));
    }
  }
}
