import '../../../../core/errors/failures/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/product.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/product_repository.dart';
import '../data_resources/local_product_data_source.dart';
import '../data_resources/remote_product_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteProductDataSource remoteProductDataSource;
  final LocalProductDataSource localProductDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteProductDataSource,
    required this.localProductDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, int>> deleteProduct(String id) async {
    await networkInfo.isConnected;
    return Right(await remoteProductDataSource.deleteProduct(id));
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    await networkInfo.isConnected;
    final result = await remoteProductDataSource.getAllProducts();
    return Right(ProductModel.allToEntity(result));
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(String id) async {
    await networkInfo.isConnected;
    final result = await remoteProductDataSource.getProduct(id);
    return Right(result.toEntity());
  }

  @override
  Future<Either<Failure, int>> insertProduct(ProductEntity product) async {
    await networkInfo.isConnected;
    return Right(await remoteProductDataSource.insertProduct(ProductModel.fromEntity(product)));
  }

  @override
  Future<Either<Failure, int>> updateProduct(ProductEntity product) async {
    await networkInfo.isConnected;
    return Right(await remoteProductDataSource.updateProduct(ProductModel.fromEntity(product)));
  }
}
