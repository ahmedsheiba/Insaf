part of 'reset_verify_email_cubit.dart';

@immutable
sealed class ResetVerifyEmailState {}

final class ResetVerifyEmailInitial extends ResetVerifyEmailState {}

class ResetVerifyEmailLoading extends ResetVerifyEmailState {}

class ResetVerifyEmailSuccess extends ResetVerifyEmailState {}

class ResetVerifyEmailFailure extends ResetVerifyEmailState {
  final String errorMessage;
  ResetVerifyEmailFailure({required this.errorMessage});

  List<Object> get props => [errorMessage];
}
