import 'package:bloc/bloc.dart';
import 'package:fruietecommerceapp/features/auth/domain/entitys/user_entity.dart';
import 'package:fruietecommerceapp/features/auth/domain/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepository authRepo;

  Future<void> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    emit(RegisterLoading());
    var result = await authRepo.createUserWithEmailAndPassword(
      name,
      email,
      password,
    );
    result.fold(
      (error) => emit(RegisterError(error: error.message)),
      (result) => emit(RegisterSuccess(userEntity: result)),
    );
  }
}
