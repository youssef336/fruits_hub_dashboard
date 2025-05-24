import 'package:fruits_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/image_repo/image_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/auth_service.dart';
import 'package:fruits_hub_dashboard/core/services/database_servies.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_services.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/supadase_auth.dart';
import 'package:fruits_hub_dashboard/feature/auth/data/repo/login_repo_impl.dart';
import 'package:fruits_hub_dashboard/feature/auth/domain/repo/login_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<StorageService>(() => SupabaseStorageServices());

  getIt.registerLazySingleton<DatabaseServies>(() => FirestoreServices());
  getIt.registerLazySingleton<AddProductRepo>(
    () => AddProductRepoImpl(getIt.get<DatabaseServies>()),
  );
  getIt.registerLazySingleton<ImageRepo>(
    () => ImageRepoImpl(getIt.get<StorageService>()),
  );
  getIt.registerLazySingleton<AuthService>(() => SupadaseAuth());
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(getIt.get<AuthService>()),
  );
}
