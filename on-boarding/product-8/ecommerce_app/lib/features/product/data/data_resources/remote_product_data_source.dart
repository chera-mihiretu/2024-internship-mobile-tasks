import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exceptions/product_exceptions.dart';
import '../models/product_model.dart';

abstract class RemoteProductDataSource {
  Future<int> deleteProduct(String id);
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(String id);
  Future<int> insertProduct(ProductModel productModel);
  Future<int> updateProduct(ProductModel productModel);
}

class  RemoteProductDataSourceImp implements RemoteProductDataSource{
  final http.Client client;

  RemoteProductDataSourceImp(this.client);
  @override
  Future<int> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> final_result = <ProductModel>[];
    try{
      final result = await client.get(Uri.parse(AppData.allProductUrl),
          headers: AppData.jsonHeader);
      if (result.statusCode == 200){
        Map<String, dynamic> finalResult = json.decode(result.body);
        for (Map<String, dynamic> jsonModel in finalResult['data']){
          final_result.add(ProductModel.fromJson(jsonModel));
        }
      }else{
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
    return final_result;
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<int> insertProduct(ProductModel productModel) {
    // TODO: implement insertProduct
    throw UnimplementedError();
  }

  @override
  Future<int> updateProduct(ProductModel productModel) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

}