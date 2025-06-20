part of 'surpluses_cubit.dart';

@immutable
sealed class SurplusesState {}

final class SurplusesInitial extends SurplusesState {}

final class SurplusesLoading extends SurplusesState {}

final class SurplusesSuccess extends SurplusesState {
  final List<SurplusModel> surpluses;

  SurplusesSuccess({required this.surpluses});
}

final class SurplusesFailure extends SurplusesState {
  final String errorMesage;

  SurplusesFailure({required this.errorMesage});
}
