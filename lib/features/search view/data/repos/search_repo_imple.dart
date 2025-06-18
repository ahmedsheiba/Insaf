import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:insaf/core/errors/failures.dart';
import 'package:insaf/core/models/surplus_model.dart';
import 'package:insaf/core/utils/api_service.dart';
import 'package:insaf/features/search%20view/data/repos/search_repo.dart';

class SearchRepoImplement extends SearchRepo {
  final ApiService apiService;

  SearchRepoImplement(this.apiService);

  @override
  Future<Either<Failure, List<SurplusModel>>> fetchSurplusItems(
      {required String searchKeyWord}) async {
    try {
      var data = await apiService.get(
        endPoint: 'api/surpluses?',
      );
      List<SurplusModel> books = [];
      for (var item in data['items']) {
        books.add(SurplusModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioException(e));
      }
      return left(
        ServerFailuer(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
