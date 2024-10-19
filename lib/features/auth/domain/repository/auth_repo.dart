import 'package:either_dart/either.dart';
import 'package:fruietecommerceapp/core/errors/failure.dart';
import 'package:fruietecommerceapp/features/auth/domain/entitys/user_entity.dart';

abstract class AuthRepository {
  Future<Either<ServerFailure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  );

  Future<Either<ServerFailure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future addUserData(UserEntity user);

  Future<UserEntity> getUserData({required String uid});

  Future<Either<ServerFailure, UserEntity>> signInWithGoogle();

  Future<Either<ServerFailure, UserEntity>> signInWithFacebook();
}
