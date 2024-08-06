import '../models/product_model.dart';

abstract class LocalProductDataSource {
    Future<List<ProductModel>> getAllProducts();
    Future<ProductModel> getProduct(String id);
}