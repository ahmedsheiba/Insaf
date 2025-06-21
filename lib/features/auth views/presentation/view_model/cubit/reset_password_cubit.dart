import 'package:bloc/bloc.dart';
import 'package:insaf/features/auth%20views/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo authRepo;
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  Future<void> sendResetCode({required String email}) async {
    emit(ResetPasswordLoading());
    final result = await authRepo.sendResetCode(email: email);

    result.fold(
      (failure) => emit(ResetPasswordFailure(errorMessage: failure)),
      (message) => emit(ResetPasswordSuccess(message: message)),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());
    final result = await authRepo.resetPassword(
      email: email,
      code: code,
      newPassword: newPassword,
    );

    result.fold(
      (failure) =>
          emit(ResetPasswordFailure(errorMessage: failure.errorMessage)),
      (message) => emit(ResetPasswordSuccess(message: message)),
    );
  }
}
