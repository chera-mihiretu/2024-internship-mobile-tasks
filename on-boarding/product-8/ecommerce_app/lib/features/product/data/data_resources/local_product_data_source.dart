import '../models/product_model.dart';

abstract class LocalProductDataSource {
    Future<List<ProductModel>> getAllProducts(ProductModel productModel);
    Future<ProductModel> getProduct(ProductModel productModel);
}