import 'package:fruietecommerceapp/core/helpers/database_services.dart';
import 'package:fruietecommerceapp/core/helpers/firebase_services.dart';
import 'package:fruietecommerceapp/core/helpers/firestore_services.dart';
import 'package:fruietecommerceapp/features/auth/data/repository/auth_repo_impl.dart';
import 'package:fruietecommerceapp/features/auth/domain/repository/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setuptGetIt() {
  getIt.registerSingleton<FirebaseServices>(FirebaseServices());
  getIt.registerSingleton<DataBaseServices>(FirestoreServices());
  getIt.registerSingleton<AuthRepository>(AuthRepoImpl(
    dataBaseServices: getIt.get<DataBaseServices>(),
    firebaseServices: getIt.get<FirebaseServices>(),
  ));
}
