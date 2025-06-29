import 'dart:io';

import 'package:insaf/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:insaf/features/auth%20views/data/model/login_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> charityRegister(
    String name,
    String email,
    String location,
    String phoneNumber,
    File commercialRegister,
  );
  Future<Either<Failure, String>> supplierRegister(
    String name,
    String email,
    String location,
    String phoneNumber,
    File commercialRegister,
    File healthCertificate,
  );
  Future<Either<Failure, LoginResponse>> charityLogin(
    String email,
    String password,
  );

  Future<Either<Failure, String>> verifyEmail({
    required String email,
    required String code,
  });

  Future<Either<String, String>> sendResetCode({
    required String email,
    required String code,
  });

  Future<Either<Failure, String>> resetPassword({
    required String email,
    required String code,
    required String newPassword,
    required String passwordConfirmation,
  });
}
