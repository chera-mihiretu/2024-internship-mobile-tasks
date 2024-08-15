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
import 'features/product/presentation/bloc/product_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //! External Instances

  locator.registerLazySingleton(() => http.Client());

  //! Core instances
  locator.registerLazySingleton(() => InternetConnectionChecker());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  //! Features of app

  // data layers
  // Remote Data
  locator.registerLazySingleton<RemoteProductDataSource>(
      () => RemoteProductDataSourceImp(locator()));
  locator.registerLazySingleton<LocalProductDataSource>(
      () => LocalProductDataSourceImpl(locator()));
  // Repositories
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteProductDataSource: locator(),
      localProductDataSource: locator(),
      networkInfo: locator(),
    ),
  );
  // usecases
  locator.registerLazySingleton(() => UpdateProductUsecase(locator()));
  locator.registerLazySingleton(() => InsertProductUseCase(locator()));
  locator.registerLazySingleton(() => DeleteProductUseCase(locator()));
  locator.registerLazySingleton(() => GetAllProductUseCase(locator()));
  locator.registerLazySingleton(() => GetProductUseCase(locator()));
  // bloc
  locator.registerFactory(
    () => ProductBloc(
      getAllProductUseCase: locator(),
      deleteProductUseCase: locator(),
      getProductUseCase: locator(),
      insertProductUseCase: locator(),
      updateProductUsecase: locator(),
    ),
  );
  //! Shared pref

  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
}
