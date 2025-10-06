import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_gym/bloc/Auth/auth_bloc.dart';
import 'package:pro_gym/profile/profile_cubit.dart';
import 'package:pro_gym/utils/error_dialog.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    _getProfile();
    super.initState();
  }

  void _getProfile() {
    final String uid = context.read<AuthBloc>().state.user!.uid;

    print('uid : $uid');
    context.read<ProfileCubit>().getProfile(uid: 'uid');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.profileStatus == ProfileStatus.error) {
            errorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          if (state.profileStatus == ProfileStatus.initial) {
            return Container();
          } else if (state.profileStatus == ProfileStatus.loading) {
            return CircularProgressIndicator();
          } else if (state.profileStatus == ProfileStatus.error) {
            return Center(
                child: Row(
              children: [
                Image.asset(
                  'assets/error.png',
                  width: 75,
                  height: 75,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Ooops!\nTry Again',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.red),
                )
              ],
            ));
          }
          return Card(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInImage.assetNetwork(
                    placeholder: 'assets/error.png',
                    image: state.user.profileImage,
                    width: double.infinity,
                    fit:BoxFit.cover
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('-ID: ${state.user.id}',style: TextStyle(fontSize: 18),),
                        SizedBox(height: 10,),
                        Text('-Name: ${state.user.name}',style: TextStyle(fontSize: 18),),
                        SizedBox(height: 10,),
                        Text('-Email: ${state.user.email}',style: TextStyle(fontSize: 18),),
                        SizedBox(height: 10,),
                      ],
                    ),
                  )
                ]),
          );
        },
      ),
    );
  }
}