// part of 'members_bloc.dart';
import 'package:pro_gym/Models/gym_members.dart';



abstract class membersState {}

class membersInitial extends membersState {}

class membersLoading extends membersState {}

class membersLoaded extends membersState {
  final List<gymmembers> memberss;

  membersLoaded(this.memberss);
}

class membersOperationSuccess extends membersState {
  final String message;

  membersOperationSuccess(this.message);
}

class membersError extends membersState {
  final String errorMessage;

  membersError(this.errorMessage);
}