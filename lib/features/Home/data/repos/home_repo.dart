import 'package:insaf/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:insaf/core/models/surplus_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SurplusModel>>> fetchSurplusItems();
}

