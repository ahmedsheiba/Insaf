import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:insaf/core/errors/failures.dart';
import 'package:insaf/core/models/surplus_model.dart';
import 'package:insaf/core/utils/api_service.dart';
import 'package:insaf/features/Home/data/repos/home%20repo/home_repo.dart';

class HomeRepoImplement extends HomeRepo {
  final ApiService apiService;

  HomeRepoImplement(this.apiService);

  @override
  Future<Either<Failure, List<SurplusModel>>> fetchSurplusItems() async {
    try {
      var data = await apiService.get(
        endPoint: 'surpluses',
      );

      List<SurplusModel> surpluses = [];

      for (var surplus in data['data']['surpluses']) {
        surpluses.add(SurplusModel.fromJson(surplus));
      }
      return right(surpluses);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailuer.fromDioException(e),
        );
      }
      return left(
        ServerFailuer(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
