import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:insaf/core/errors/failures.dart';
import 'package:insaf/core/utils/api_service.dart';
import 'package:insaf/features/auth%20views/data/model/login_response.dart';

import 'package:insaf/features/auth%20views/data/repos/auth_repo.dart';

class AuthRepoImplement extends AuthRepo {
  final ApiService apiService;

  AuthRepoImplement(this.apiService);

  @override
  Future<Either<Failure, String>> charityRegister(String name, String email,
      String location, String phoneNumber, File commercialRegister) async {
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'email': email,
        'location': location,
        'phone_number': phoneNumber,
        'commercial_register':
            await MultipartFile.fromFile(commercialRegister.path),
      });
      var data = await apiService.post(
        endPoint: 'charity/register',
        data: formData,
      );
      print("API Response: $data");
      Map<String, dynamic> charityMessages = data;

      String message = charityMessages['message'];
      return right(message);
    } catch (e) {
      if (e is DioException) {
        print("Dio error: ${e.response?.data}");
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

  @override
  Future<Either<Failure, String>> supplierRegister(
      String name,
      String email,
      String location,
      String phoneNumber,
      File commercialRegister,
      File healthCertificate) async {
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'email': email,
        'location': location,
        'phone_number': phoneNumber,
        'commercial_register':
            await MultipartFile.fromFile(commercialRegister.path),
        'health_certificate':
            await MultipartFile.fromFile(healthCertificate.path),
      });
      var data = await apiService.post(
        endPoint: 'supplier/register',
        data: formData,
      );

      Map<String, dynamic> messages = data;

      String message = messages['message'];
      return right(message);
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

  @override
  Future<Either<Failure, LoginResponse>> charityLogin(
      String email, String password) async {
    try {
      FormData formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      final data = await apiService.post(endPoint: 'login', data: formData);

      final loginResponse = LoginResponse.fromJson(data);

      return right(loginResponse);
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

  @override
  Future<Either<Failure, String>> verifyEmail({
    required String email,
    required String code,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: 'email/verify',
        data: {
          'email': email,
          'code': code,
        },
      );

      return right(response['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioException(e));
      }
      return left(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<String, String>> sendResetCode({required String email}) async {
    try {
      final response = await apiService.post(
        endPoint: 'forget-password',
        data: {"email": email},
      );

      if (response['success'] == true) {
        return right(response['message']);
      } else {
        return left(response['message'] ?? 'Unknown error');
      }
    } catch (e) {
      return left('Something went wrong');
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: 'reset-password',
        data: {
          "email": email,
          "code": code,
          "password": newPassword,
        },
      );

      if (response['success'] == true) {
        return right(response['message']);
      } else {
        return left(
            Failure(errorMessage: response['message'] ?? 'Reset failed'));
      }
    } catch (e) {
      return left(Failure(errorMessage: 'Something went wrong'));
    }
  }
}
