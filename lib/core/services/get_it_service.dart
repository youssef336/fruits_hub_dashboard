import 'package:fruits_hub_dashboard/core/repos/product_image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_image_repo/image_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/mains/auth_service.dart';
import 'package:fruits_hub_dashboard/core/services/mains/database_servies.dart';
import 'package:fruits_hub_dashboard/core/services/firebase_auth.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_services.dart';
import 'package:fruits_hub_dashboard/core/services/mains/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage.dart';

import 'package:fruits_hub_dashboard/feature/auth/data/repo/login_repo_impl.dart';
import 'package:fruits_hub_dashboard/feature/auth/domain/repo/login_repo.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/data/repo/notification_repo_impl.dart';
import 'package:fruits_hub_dashboard/feature/delete_notification.dart/domain/repo/notification_repo.dart';
import 'package:get_it/get_it.dart';

import '../../feature/orders/data/repo/order_repo_impl.dart';
import '../../feature/orders/domain/repo/order_repo.dart';
import '../../feature/notification/data/repo/notification_repo_impl.dart';
import '../../feature/notification/domain/repo/notification_repo.dart';
import '../repos/notification_image_repo/notification_image_repo.dart';
import '../repos/notification_image_repo/notification_image_repo_impl.dart';

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
  getIt.registerLazySingleton<NotificationImageRepo>(
    () => NotificationImageRepoImpl(getIt.get<StorageService>()),
  );
  getIt.registerLazySingleton<OrderRepo>(
    () => OrderRepoImpl(getIt.get<DatabaseServies>()),
  );
  getIt.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(getIt.get<AuthService>()),
  );

  // Register notification dependencies
  getIt.registerLazySingleton<NotificationRepo>(
    () => NotificationRepoImpl(getIt.get<DatabaseServies>()),
  );
  getIt.registerLazySingleton<NotificationRepoDelete>(
    () => NotificationRepoImplDelete(getIt.get<DatabaseServies>()),
  );
}
