part of 'signup_cubit.dart';

// sealed class SignupState extends Equatable {
//   const SignupState();

//   @override
//   List<Object> get props => [];
// }

// final class SignupInitial extends SignupState {}
// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';
enum SignupStatus {
  initial,
  submitting,
  success,
  error,
}

class SignupState {
  final SignupStatus signupStatus;
  final CustomError error;
  SignupState({
    required this.signupStatus,
    required this.error,
  });
  factory SignupState.initial() {
    return SignupState(
        signupStatus: SignupStatus.initial, error: CustomError());
  }
  @override
  List<Object> get props => [SignupStatus,error];

  SignupState copyWith({
    SignupStatus? signinStatus,
    CustomError? error, required SignupStatus signupStatus,
  }) {
    return SignupState(
      signupStatus: signinStatus ?? this.signupStatus,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'SigninState(signinStatus: $signupStatus, error: $error)';
}
