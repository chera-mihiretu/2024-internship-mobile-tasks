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

class RemoteProductDataSourceImp implements RemoteProductDataSource {
  final http.Client client;

  RemoteProductDataSourceImp(this.client);

  @override
  Future<int> deleteProduct(String id) async {
    try {
      final result = await client.delete(
          Uri.parse('${AppData.allProductUrl}/$id'),
          headers: AppData.jsonHeader);
      if (result.statusCode == 200) {
        return 1;
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> finalResult = <ProductModel>[];
    try {
      final result = await client.get(Uri.parse(AppData.allProductUrl),
          headers: AppData.jsonHeader);
      if (result.statusCode == 200) {
        Map<String, dynamic> jsonModel = json.decode(result.body);
        for (Map<String, dynamic> jsonModel in jsonModel['data']) {
          finalResult.add(ProductModel.fromJson(jsonModel));
        }
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
    return finalResult;
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    try {
      final result = await client.get(Uri.parse('${AppData.baseUrl}/$id'),
          headers: AppData.jsonHeader);
      if (result.statusCode == 200) {
        Map<String, dynamic> finalResult = json.decode(result.body);
        return ProductModel.fromJson(finalResult['data']);
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }

  @override
  Future<int> insertProduct(ProductModel productModel) async {
    try {
      final result = await client.post(Uri.parse(AppData.allProductUrl),
          body: {
            'image': productModel.imageUrl,
            'name': productModel.name,
            'description': productModel.description,
            'price': '${productModel.price}',
          },
          headers: AppData.jsonHeader);
      if (result.statusCode == 200) {
        return 1;
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }

  @override
  Future<int> updateProduct(ProductModel productModel) async {
    try {
      final result = await client.put(
          Uri.parse('${AppData.allProductUrl}/${productModel.id}'),
          body: {
            'name': productModel.name,
            'description': productModel.description,
            'price': '${productModel.price}',
          },
          headers: AppData.jsonHeader);
      if (result.statusCode == 200) {
        return 1;
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }

  Future<int> getStatus(String requestType, String url, [Map<String, String>? data]) async {
    Map<String, dynamic> typeMap = {
      AppData.post : client.post,
      AppData.get : client.get,
      AppData.delete : client.delete,
      AppData.put : client.put


    };
  }

}
