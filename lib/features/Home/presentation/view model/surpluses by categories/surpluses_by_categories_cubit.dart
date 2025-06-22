import 'package:bloc/bloc.dart';
import 'package:insaf/core/models/surplus_model.dart';
import 'package:insaf/features/Home/data/repos/categories%20repo/categories_repo.dart';
import 'package:meta/meta.dart';

part 'surpluses_by_categories_state.dart';

class SurplusesByCategoriesCubit extends Cubit<SurplusesByCategoriesState> {
  SurplusesByCategoriesCubit(this.categoriesRepo) : super(SurplusesByCategoriesInitial());

  final CategoriesRepo categoriesRepo;


  Future<void> fetchSurplusesByCate(int catNum) async {
    emit(SurplusesByCategoriesLoading());

    var result = await categoriesRepo.fetchSurplusesByCate(catNum);

    result.fold(
      (failure) => emit(
        SurplusesByCategoriesFailure(
          errorMesage: failure.errorMessage,
        ),
      ),
      (surpluses) => emit(
        SurplusesByCategoriesSuccess(
          surpluses: surpluses,
        ),
      ),
    );
  }
}
