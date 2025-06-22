import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insaf/core/models/surplus_model.dart';
import 'package:insaf/features/Home/data/repos/home%20repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'surpluses_state.dart';

class SurplusesCubit extends Cubit<SurplusesState> {
  SurplusesCubit(this.homeRepo) : super(SurplusesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSearchBooks() async {
    emit(SurplusesLoading());

    var result = await homeRepo.fetchSurplusItems();

    result.fold(
      (failure) => emit(
        SurplusesFailure(
          errorMesage: failure.errorMessage,
        ),
      ),
      (surpluses) => emit(
        SurplusesSuccess(
          surpluses: surpluses,
        ),
      ),
    );
  }
}
