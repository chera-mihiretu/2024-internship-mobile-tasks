import '../models/product_model.dart';

abstract class RemoteProductDataSource {
  Future<int> deleteProduct(String id);
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(String id);
  Future<int> insertProduct(ProductModel productModel);
  Future<int> updateProduct(ProductModel productModel);
}