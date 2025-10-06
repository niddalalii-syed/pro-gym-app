
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_gym/bloc/members_bloc_event.dart';
import 'package:pro_gym/bloc/members_bloc_state.dart';
import 'package:pro_gym/service/firebase_service.dart';

class membersBloc extends Bloc<membersEvent, membersState> {
  final FirestoreService _firestoreService;

  membersBloc(this._firestoreService) : super(membersInitial()) {
    on<Loadmemberss>((event, emit) async {
      try {
        emit(membersLoading());
        final memberss = await _firestoreService.getMembers().first;
        emit(membersLoaded(memberss));
      } catch (e) {
        emit(membersError('Failed to load memberss.'));
      }
    });

    on<Addmembers>((event, emit) async {
      try {
        emit(membersLoading());
        await _firestoreService.addMembers(event.members);
        emit(membersOperationSuccess('members added successfully.'));
      } catch (e) {
        emit(membersError('Failed to add members.'));
      }
    });

    on<Updatemembers>((event, emit)  async {
      try {
        emit(membersLoading());
        await _firestoreService.updateMembers(event.members);
        emit(membersOperationSuccess('members updated successfully.'));
      } catch (e) {
        emit(membersError('Failed to update members.'));
      }
    });

    on<Deletemembers>((event, emit) async {
      try {
        emit(membersLoading());
        await _firestoreService.deleteMembers(event.membersId);
        emit(membersOperationSuccess('members deleted successfully.'));
      } catch (e) {
        emit(membersError('Failed to delete members.'));
      }
    });

  }
}