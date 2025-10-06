import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_gym/Models/gym_members.dart';
import 'package:pro_gym/bloc/members_bloc_bloc.dart';
import 'package:pro_gym/bloc/members_bloc_event.dart';
import 'package:pro_gym/bloc/members_bloc_state.dart';

class RegisteredMembers extends StatefulWidget {
  const RegisteredMembers({super.key});

  @override
  State<RegisteredMembers> createState() => _RegisteredMembersState();
}

class _RegisteredMembersState extends State<RegisteredMembers> {
 @override
  Widget build(BuildContext context) {
    final membersBloc _membersBloc = BlocProvider.of<membersBloc>(context);
        return Scaffold(
          // appBar: AppBar(
          //   automaticallyImplyLeading: false,
          //   title: Text('Firestore'),
          // ),
          body: BlocBuilder<membersBloc, membersState>(
            builder: (context, state) {
              if (state is membersLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is membersLoaded) {
                final memberss = state.memberss;
                return ListView.builder(
                  itemCount: memberss.length,
                  itemBuilder: (context, index) {
                    final members = memberss[index];
                    return InkWell(
                      onTap: (){
                        showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return CupertinoPopupSurface(
          isSurfacePainted: true,
          child: Container(
              padding: const EdgeInsetsDirectional.all(20),
              color: CupertinoColors.white,
              // alignment: Alignment.,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).copyWith().size.height * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  // Image.asset(
                  //   "assets/img.png",
                  //   height: 160,
                  //   width: 250,
                  // ),
                  Material(
                      child: Text(
                    "Name : ${members.member_name}",
                    
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 18,
                    ),
                  )),
                  // const SizedBox(height: 5,),
                  Material(
                      child: Text(
                    "Due Date : ${members.member_admissionDate}",
                    
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 18,
                    ),
                  )),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       ElevatedButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //           child: const Text("NO")),
                  //       ElevatedButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //           child: const Text("YES")),
                  //     ]),
                ],
              )),
        );
      });
                      },
                      child: ListTile(
                        title: Text(members.member_name),
                        subtitle: Text(members.member_admissionDate),
                        // leading: Checkbox(
                        //   value: members.completed,
                        //   onChanged: (value) {
                        //     final updatedmembers = members.copyWith(completed: value);
                        //     _membersBloc.add(UpdateMembers(updatedmembers));
                        //   },
                        // ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _membersBloc.add(Deletemembers(members.member_id));
                          },
                        ),
                      ),
                    );
                  },
                );
              } else if (state is membersOperationSuccess) {
                _membersBloc.add(Loadmemberss()); // Reload memberss
                return Container(); // Or display a success message
              } else if (state is membersError) {
                return Center(child: Text(state.errorMessage));
              } else {
                return Container();
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showAddmembersDialog(context);
            },
            child: const Icon(Icons.add),
          ),
        );
  }
    void _showAddmembersDialog(BuildContext context) {
      final _titleController = TextEditingController();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const  Text('Add members'),
            content: TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'members title'),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  final members = gymmembers(
                    // id: DateTime.now().toString(),
                    // title: _titleController.text,
                    // completed: false, 
                    member_id: '1', 
                    member_name: 'Hammad', 
                    member_phone: '0334244442', 
                    member_admissionDate: 'today',
                  );
                  BlocProvider.of<membersBloc>(context).add(Addmembers(members));
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
}
