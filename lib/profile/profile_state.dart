part of 'profile_cubit.dart';

// sealed class ProfileState extends Equatable {
//   const ProfileState();

//   @override
//   List<Object> get props => [];
// }

// final class ProfileInitial extends ProfileState {}
enum ProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProfileState extends Equatable {
  final ProfileStatus profileStatus;
  final User user;
  final CustomError error;

  const ProfileState(
      {required this.profileStatus, required this.user, required this.error});


  factory ProfileState.initial(){
    return ProfileState(profileStatus: ProfileStatus.initial, user: User.initializeUser(), error: CustomError());
  }
  @override
  List<Object?> get props => [profileStatus, user, error];

  @override
  String toString() =>
      'ProfileState(profileStatus : $profileStatus,user:$user,error;$error)';

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    User? user,
    CustomError? error,
  }) {
    return ProfileState(
        profileStatus: profileStatus ?? this.profileStatus,
        user: user ?? this.user,
        error: error ?? this.error);
  }
}
