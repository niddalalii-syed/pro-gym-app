import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_gym/bloc/Auth/auth_bloc.dart';
import 'package:pro_gym/bloc/members_bloc_bloc.dart';
import 'package:pro_gym/firebase_options.dart';
import 'package:pro_gym/pages/home_page.dart';
import 'package:pro_gym/pages/login_screen.dart';
import 'package:pro_gym/pages/profile_page.dart';
import 'package:pro_gym/pages/signup_screen.dart';
import 'package:pro_gym/pages/splash_screen.dart';
import 'package:pro_gym/profile/profile_cubit.dart';
import 'package:pro_gym/repositories/auth_repository.dart';
import 'package:pro_gym/repositories/profile_repository.dart';
import 'package:pro_gym/service/firebase_service.dart';
import 'package:pro_gym/signin/signin_cubit.dart';
import 'package:pro_gym/signup/signup_cubit.dart';
// import 'firebase_options.dart';

import 'pages/card_front.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository(
                firebaseFirestore: FirebaseFirestore.instance,
                firebaseAuth: FirebaseAuth.instance)),
                RepositoryProvider<ProfileRepository>(
            create: (context) => ProfileRepository(
                firebaseFirestore: FirebaseFirestore.instance,
               ))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<SigninCubit>(
            create: (context) => SigninCubit(
                authRepository: AuthRepository(
                    firebaseAuth: FirebaseAuth.instance,
                    firebaseFirestore: FirebaseFirestore
                        .instance)), // Adjust this to your implementation
          ),
          BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(
                authRepository: AuthRepository(
                    firebaseAuth: FirebaseAuth.instance,
                    firebaseFirestore: FirebaseFirestore
                        .instance)), // Adjust this to your implementation
          ),
          BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(
                profileRepository: 
                    context.read<ProfileRepository>()), // Adjust this to your implementation
          ),
           BlocProvider<membersBloc>(
              create: (context) => membersBloc(FirestoreService()),
            ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SplashScreen(),
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            SignupScreen.routeName: (context) => SignupScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            ProfileScreen.routeName: (context) => ProfileScreen(),
          },
        ),
      ),
    );
  }
}
