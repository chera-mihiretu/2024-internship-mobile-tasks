import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/product/data/data_resources/local_product_data_source.dart';
import 'features/product/data/data_resources/remote_product_data_source.dart';
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecases/delete_product_usecase.dart';
import 'features/product/domain/usecases/get_all_products_usecase.dart';
import 'features/product/domain/usecases/get_product_usecase.dart';
import 'features/product/domain/usecases/insert_product_usecase.dart';
import 'features/product/domain/usecases/update_product_usecase.dart';

final locator = GetIt.instance;

void init() {
  //! External Instances
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => SharedPreferences.getInstance);
  //! Core instances
  locator.registerLazySingleton(() => InternetConnectionChecker());
  locator.registerLazySingleton(() => NetworkInfoImpl(locator()));
  //! Features of app

  // data layers
  // Remote Data
  locator.registerLazySingleton(() => RemoteProductDataSourceImp(locator()));
  locator.registerLazySingleton(() => LocalProductDataSourceImpl(locator()));
  // Use cases
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteProductDataSource: locator(),
      localProductDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  locator.registerLazySingleton(() => UpdateProductUsecase(locator()));
  locator.registerLazySingleton(() => InsertProductUseCase(locator()));
  locator.registerLazySingleton(() => DeleteProductUseCase(locator()));
  locator.registerLazySingleton(() => GetAllProductUseCase(locator()));
  locator.registerLazySingleton(() => GetProductUseCase(locator()));
}
