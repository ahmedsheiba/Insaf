import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:insaf/features/auth%20views/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  Future<void> charityRegister({
    required String name,
    required String email,
    required String location,
    required String phoneNumber,
    required File commercialRegister,
  }) async {
    emit(RegisterLoading());

    final result = await authRepo.charityRegister(
      name,
      email,
      location,
      phoneNumber,
      commercialRegister,
    );

    result.fold(
      (failure) {
        emit(RegisterFailure(errorMesage: failure.errorMessage));
      },
      (message) {
        emit(RegisterSuccess(message: message));
      },
    );
  }

  Future<void> supplierRegister({
    required String name,
    required String email,
    required String location,
    required String phoneNumber,
    required File commercialRegister,
    required File healthCertificate,
  }) async {
    emit(RegisterLoading());

    final result = await authRepo.supplierRegister(
      name,
      email,
      location,
      phoneNumber,
      commercialRegister,
      healthCertificate,
    );

    result.fold(
      (failure) {
        emit(RegisterFailure(errorMesage: failure.errorMessage));
      },
      (message) {
        emit(RegisterSuccess(message: message));
      },
    );
  }
}
