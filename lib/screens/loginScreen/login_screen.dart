import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soli/blocs/auth/auth_bloc.dart';
import 'package:soli/screens/homeScreen/home_screen.dart';
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
      appBar: AppBar(title: const Text("Login")),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text("Log In"),
                        ),
                        Form(
                          key: _loginFormKey,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: InputEmailField(
                                    textController: _emailCon,
                                    validatorText: "Enter an email",
                                    fieldName: "Email"),
                              ),
                              InputField(
                                  textController: _passwordCon,
                                  validatorText: "Enter min. 6 characters",
                                  fieldName: "Password"),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: SizedBox(
                                  height: 35,
                                  width: 240,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        return _authenticate(context);
                                      },
                                      child: const Text("Log In")),
                                ),
                              ),
                              const Text("Don't have an account?"),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: const Text("Sign Up"))
                            ],
                          ),
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
