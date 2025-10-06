import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_gym/pages/home_page.dart';
import 'package:pro_gym/pages/login_screen.dart';

import '../bloc/Auth/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print('listener: $state');
        if(state.authStatus==AuthStatus.unauthenticated){
          Navigator.pushNamed(context,LoginScreen.routeName);
        }else if(state.authStatus==AuthStatus.authenticated){
          Navigator.pushNamed(context,HomeScreen.routeName);
        }
      },
      builder: (context, state) {
        print('Builder: $state');
        return Scaffold(
          body: CircularProgressIndicator(),
        );
      },
    );
  }
}
