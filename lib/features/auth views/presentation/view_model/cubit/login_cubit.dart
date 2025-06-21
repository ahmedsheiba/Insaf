import 'package:bloc/bloc.dart';
import 'package:insaf/features/auth%20views/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    final result = await authRepo.charityLogin(email, password);

    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
      (loginResponse) => emit(LoginSuccess(message: loginResponse.message)),
    );
  }
}
