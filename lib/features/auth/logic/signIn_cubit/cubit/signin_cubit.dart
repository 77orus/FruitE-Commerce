import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:fruietecommerceapp/features/auth/domain/entitys/user_entity.dart';
import 'package:fruietecommerceapp/features/auth/domain/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepository authRepo;
  SigninCubit(this.authRepo) : super(SigninInitial());

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(SigninLoading());
    var result = authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (error) => emit(SigninErrors(error: error.message)),
      (result) => emit(SigninSuccess(userEntity: result)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    var result = authRepo.signInWithGoogle();
    result.fold(
      (error) => emit(SigninErrors(error: error.message)),
      (result) => emit(SigninSuccess(userEntity: result)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    var result = authRepo.signInWithFacebook();
    result.fold(
      (error) => emit(SigninErrors(error: error.message)),
      (result) => emit(SigninSuccess(userEntity: result)),
    );
  }
}
