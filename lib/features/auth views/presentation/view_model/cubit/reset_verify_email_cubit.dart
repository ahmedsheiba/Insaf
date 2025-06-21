import 'package:bloc/bloc.dart';
import 'package:insaf/features/auth%20views/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'reset_verify_email_state.dart';

class ResetVerifyEmailCubit extends Cubit<ResetVerifyEmailState> {
  final AuthRepo authRepo;
  ResetVerifyEmailCubit(this.authRepo) : super(ResetVerifyEmailInitial());

  Future<void> verifyResetCode(
      {required String email, required String code}) async {
    emit(ResetVerifyEmailLoading());
    final result = await authRepo.verifyEmail(email: email, code: code);

    result.fold(
      (failure) =>
          emit(ResetVerifyEmailFailure(errorMessage: failure.errorMessage)),
      (_) => emit(ResetVerifyEmailSuccess()),
    );
  }
}
