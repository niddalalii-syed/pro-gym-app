import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_gym/bloc/Auth/auth_bloc.dart';
import 'package:pro_gym/pages/card_front.dart';
import 'package:pro_gym/pages/profile_page.dart';
import 'package:pro_gym/pages/reqistered_members.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async=> false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('ProGym'),
          actions: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return CardFront();
                }));
              },
              child: Icon(Icons.add)),
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
               return ProfileScreen();
              }));
    
            }, icon: Icon(Icons.account_circle)),
            IconButton(onPressed: (){
              context.read<AuthBloc>().add(SignoutRequestedEvent());
    
            }, icon: Icon(Icons.exit_to_app))
          ],
          ),
        body: DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: AppBar(title: Text('Registered Members'),
            automaticallyImplyLeading: false,),
            bottomSheet: TabBar(  
              tabs: [  
                Tab(icon: Icon(Icons.contacts), text: "Registered Members"),  
                // Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")  
              ],  
            ),  
            
          body: TabBarView(  
            children: [  
              RegisteredMembers(),   
            ],  
          ), 
            
          )),
      ),
    );
  }
}
