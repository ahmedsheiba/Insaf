part of 'surpluses_by_categories_cubit.dart';

@immutable
sealed class SurplusesByCategoriesState {}

final class SurplusesByCategoriesInitial extends SurplusesByCategoriesState {}

final class SurplusesByCategoriesLoading extends SurplusesByCategoriesState {}

final class SurplusesByCategoriesSuccess extends SurplusesByCategoriesState {
  final List<SurplusModel> surpluses;

  SurplusesByCategoriesSuccess({required this.surpluses});
}

final class SurplusesByCategoriesFailure extends SurplusesByCategoriesState {
  final String errorMesage;

  SurplusesByCategoriesFailure({required this.errorMesage});
}
