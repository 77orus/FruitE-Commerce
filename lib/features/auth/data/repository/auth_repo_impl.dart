import 'dart:developer';

import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruietecommerceapp/core/errors/exepciton.dart';
import 'package:fruietecommerceapp/core/errors/failure.dart';
import 'package:fruietecommerceapp/core/helpers/database_services.dart';
import 'package:fruietecommerceapp/core/helpers/firebase_services.dart';
import 'package:fruietecommerceapp/core/utils/endpoints.dart';
import 'package:fruietecommerceapp/features/auth/data/models/user_model.dart';
import 'package:fruietecommerceapp/features/auth/domain/entitys/user_entity.dart';
import 'package:fruietecommerceapp/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepository {
  final FirebaseServices firebaseServices;
  final DataBaseServices dataBaseServices;

  AuthRepoImpl(
      {required this.firebaseServices, required this.dataBaseServices});

  @override
  Future<Either<ServerFailure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await firebaseServices.createUserWithEmailAndPassword(
        email,
        password,
      );
      var userEntity = UserEntity(
        name: name,
        email: email,
        uid: user.uid,
      );
      await addUserData(userEntity);
      return Right(userEntity);
    } on CustomExepciton catch (e) {
      if (user != null) {
        await firebaseServices.deleteUser();
      }
      return Left(ServerFailure(message: e.message));
    } on ServerFailure catch (e) {
      log("error occurred in authRepoImpl.createUserWithEmailAndPassword ${e.message}");
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await firebaseServices.signInWithEmailAndPasswrod(
        email,
        password,
      );

      var userEntity = await getUserData(uid: user.uid);

      return Right(userEntity);
    } on CustomExepciton catch (e) {
      log("error occurred in authRepoImpl.signInWithEmailAndPassword ${e.message}");
      return Left(ServerFailure(message: e.message));
    } on ServerFailure catch (e) {
      log("error occurred in authRepoImpl.signInWithEmailAndPassword ${e.message}");
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebase(user);
      var ifUserExists = await dataBaseServices.checkIfUserExists(
        path: Endpoints.getUser,
        uid: user.uid,
      );
      if (ifUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(userEntity);
      }

      return Right(userEntity);
    } on CustomExepciton catch (e) {
      if (user != null) {
        await firebaseServices.deleteUser();
      }
      return Left(ServerFailure(message: e.message));
    } on ServerFailure catch (e) {
      log("error occurred in authRepoImpl.signInWithGoogle ${e.message}");
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebase(user);
      var ifUserExists = await dataBaseServices.checkIfUserExists(
        path: Endpoints.getUser,
        uid: user.uid,
      );
      if (ifUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(userEntity);
      }

      return Right(userEntity);
    } on CustomExepciton catch (e) {
      log("error occurred in authRepoImpl.signInWithFacebook ${e.message}");
      return Left(ServerFailure(message: e.message));
    } on ServerFailure catch (e) {
      log("error occurred in authRepoImpl.signInWithFacebook ${e.message}");
      return Left(e);
    }
  }

  @override
  Future<void> addUserData(UserEntity user) async {
    try {
      await dataBaseServices.addData(
        path: Endpoints.addUser,
        data: user.toMap(),
        documentId: user.uid,
      );
    } catch (e) {
      log("error occurred in authRepoImpl.addUser ${e.toString()}");
    }
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await dataBaseServices.getData(
      path: Endpoints.getUser,
      uid: uid,
    );
    return UserModel.fromMap(userData);
  }
}
