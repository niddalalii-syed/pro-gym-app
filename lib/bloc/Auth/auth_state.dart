// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';

part of 'auth_bloc.dart';

enum AuthStatus{
  unknown,
  authenticated,
  unauthenticated,
}

class AuthState{
  final AuthStatus authStatus;
  final fbAuth.User? user;

  AuthState({required this.authStatus, this.user});

  factory AuthState.unknown(){
    return AuthState(authStatus: AuthStatus.unknown);
  }

  @override
  List<Object?> get props => [authStatus, user!];

  AuthState copyWith({
    AuthStatus? authStatus,
    fbAuth.User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }
}
