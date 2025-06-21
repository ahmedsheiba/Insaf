part of 'verify_email_cubit.dart';

@immutable
sealed class VerifyEmailState {}

final class VerifyEmailInitial extends VerifyEmailState {}

final class VerifyEmailLoading extends VerifyEmailState {}

final class VerifyEmailSuccess extends VerifyEmailState {
  final String message;

  VerifyEmailSuccess({required this.message});
}

final class VerifyEmailFailure extends VerifyEmailState {
  final String errorMessage;

  VerifyEmailFailure({required this.errorMessage});
}
