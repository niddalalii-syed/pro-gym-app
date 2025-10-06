import 'package:pro_gym/Models/gym_members.dart';


abstract class membersEvent {}

class Loadmemberss extends membersEvent {}

class Addmembers extends membersEvent {
  final gymmembers members;

  Addmembers(this.members);
}

class Updatemembers extends membersEvent {
  final gymmembers members;

  Updatemembers(this.members);
}

class Deletemembers extends membersEvent {
  final String membersId;

  Deletemembers(this.membersId);
}