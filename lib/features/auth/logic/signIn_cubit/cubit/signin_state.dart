part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity userEntity;

  SigninSuccess({required this.userEntity});
}

final class SigninErrors extends SigninState {
  final String error;

  SigninErrors({required this.error});
}
