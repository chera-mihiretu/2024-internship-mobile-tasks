import '../models/product_model.dart';

abstract class LocalProductDataSource {
    Future<List<ProductModel>> getAllProducts();
    Future<ProductModel> getProduct(String id);

    Future<void> addProduct(ProductModel model);
    Future<void> addListOfProduct(List<ProductModel> models);
    Future<void> removeProduct(String id);
    Future<void> updateProduct(ProductModel model);
}