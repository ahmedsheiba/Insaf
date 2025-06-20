// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:insaf/core/models/surplus_model.dart';
// import 'package:insaf/features/search%20view/data/repos/search_repo.dart';
// import 'package:meta/meta.dart';

// part 'search_surplus_state.dart';

// class SearchSurplusCubit extends Cubit<SearchSurplusState> {
//   SearchSurplusCubit(this.searchRepo) : super(SearchSurplusInitial());

//   final SearchRepo searchRepo;

//   Future<void> fetchSearchBooks({required String searchKeyWord}) async {
//     emit(SearchSurplusLoading());

//     var result =
//         await searchRepo.fetchSurplusItems(searchKeyWord: searchKeyWord);
//     result.fold(
//       (failure) => emit(
//         SearchSurplusFailure(
//           errorMesage: failure.errorMessage,
//         ),
//       ),
//       (surpluses) => emit(
//         SearchSurplusSuccess(
//           surpluses: surpluses,
//         ),
//       ),
//     );
//   }
// }
