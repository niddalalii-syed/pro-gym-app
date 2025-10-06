import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pro_gym/repositories/auth_repository.dart';

import '../Models/error_model.dart';


part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepository authRepository;
  SigninCubit({required this.authRepository}) : super(SigninState.initial());

  Future<void>signin({
    required String email,
    required String password,
  })async{
    emit(state.copyWith(signinStatus: SigninStatus.submitting));
    try{
      await authRepository.signin(email: email,password: password);
    }on CustomError catch (e){
      emit(
        state.copyWith(
          signinStatus: SigninStatus.error,
          error: e,
        )

      );
    }
  }
}
