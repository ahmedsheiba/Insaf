import 'package:bloc/bloc.dart';
import 'package:insaf/features/auth%20views/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final AuthRepo authRepo;
  VerifyEmailCubit(this.authRepo) : super(VerifyEmailInitial());
  Future<void> verifyEmail(
      {required String email, required String code}) async {
    emit(VerifyEmailLoading());

    final result = await authRepo.verifyEmail(email: email, code: code);

    result.fold(
      (failure) => emit(VerifyEmailFailure(errorMessage: failure.errorMessage)),
      (message) => emit(VerifyEmailSuccess(message: message)),
    );
  }
}
