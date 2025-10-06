import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_gym/pages/signup_screen.dart';
import 'package:validators/validators.dart';

import '../signin/signin_cubit.dart';
import '../utils/error_dialog.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  String string = 'PRO GYM';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _email, _password;

  final stringForTweenAnimationBuidler = 'From TweenAnimationBuilder';
  final stringForAnimatedBuilder = 'From AnimatedBuidler';
  final stringForTypingTextWidget = 'From TypingText';

  late AnimationController controller;
  Animation<int>? animation;
  // late Animation<int> animationForTypingText;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = IntTween(begin: 0, end: string.length).animate(controller);
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();

    print('email: $_email, password: $_password');
    context.read<SigninCubit>().signin(email: _email!, password: _password!);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state.signinStatus == SigninStatus.error) {
              errorDialog(context, state.error);
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Form(
                      key: _formKey,
                      autovalidateMode: _autovalidateMode,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/icon.png',
                                height: 230,
                                width: 230,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              AnimatedBuilder(
                                animation: animation!,
                                
                                builder: (context, child) {
                                  return Text(
                                    string.substring(0, animation!.value),
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (String? value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required';
                              }
                              if (!isEmail(value.trim())) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              _email = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            validator: (String? value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Password is required';
                              }
                              if (value.trim().length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                            onSaved: (String? value) {
                              _password = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              state.signinStatus == SigninStatus.submitting
                                  ? null
                                  : _submit();
                            },
                            child: Text(
                                state.signinStatus == SigninStatus.submitting
                                    ? 'Loading...'
                                    : 'Sign In'),
                            style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: state.signinStatus ==
                                    SigninStatus.submitting
                                ? null
                                : () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return SignupScreen();
                                    }));
                                  },
                            child: Text(
                              'Not a member? SignUp!',
                            ),
                            style: TextButton.styleFrom(
                                textStyle: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            )),
                          )
                        ],
                      )),
                ),
              ),
              // floatingActionButton: FloatingActionButton(
              //     child: Icon(Icons.play_arrow),
              //     onPressed: () {
              //       controller.repeat();
              //     }),
            );
          },
        ),
      ),
    );
  }
}

class TypingText extends AnimatedWidget {
  final String string;

  TypingText({required this.string, required Listenable animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<int>;
    return Text(
      string.substring(0, animation.value),
      style: TextStyle(color: Colors.black),
    );
  }
}
