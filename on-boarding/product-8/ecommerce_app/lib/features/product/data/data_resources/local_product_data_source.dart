import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exceptions/product_exceptions.dart';
import '../models/product_model.dart';

abstract class LocalProductDataSource {
    Future<List<ProductModel>> getAllProducts();
    Future<ProductModel> getProduct(String id);

    Future<void> addProduct(ProductModel model);
    Future<void> addListOfProduct(List<ProductModel> models);
    Future<void> removeProduct(String id);
    Future<void> updateProduct(ProductModel model);
}

class LocalProductDataSourceImpl implements LocalProductDataSource {
    final SharedPreferences sharedPreferences;

  LocalProductDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> addListOfProduct(List<ProductModel> models) {
    // TODO: implement addListOfProduct
    throw UnimplementedError();
  }
  /// Simply add the product using the id and also add it into the product list
  @override
  Future<bool> addProduct(ProductModel model) async {
    var id = model.id;
    if (await sharedPreferences.setString(id, json.encode(model.toJson()))){
      var list = sharedPreferences.getString(AppData.SHARED_PRODUCTS);
      if (list != null) {
        /// Add the id of the product into the list
        Map<String, dynamic> listPresent = json.decode(list);
        listPresent[id] = 1;
        if (!await sharedPreferences.setString(
            AppData.SHARED_PRODUCTS, json.encode(listPresent))){
          return false;
        }
        return true;
      } else {
        if (!await sharedPreferences.setString(
            AppData.SHARED_PRODUCTS, json.encode({id: 1}))){
          return false;
        }
        return true;
      }
    }else{
      return false;
    }

  }


    /// Get all product from the shared preference based on the ids that are already saved in [AppData.SHARED_PRODUCTS] key
    ///
    /// Iterates over the key after decoding it to map
    ///
    /// Throws [CacheException] if the list is null meaning there is no product saved
  @override
  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> answer = <ProductModel>[];
    final lists = sharedPreferences.getString(AppData.SHARED_PRODUCTS);
    if (lists != null){
        Map<String, dynamic> validList = json.decode(lists);
        for (String key in validList.keys){
            String? value =  sharedPreferences.getString(key);
            if (value != null){
              answer.add(ProductModel.fromJson(json.decode(value)));
            }

        }
        return answer;
    }else{
      throw CacheException();
    }
  }


    /// Return the product with the given key
    ///
    /// Throws [CacheException] if it couldn't find any data with that id
  @override
  Future<ProductModel> getProduct(String id)  async {
    final result = sharedPreferences.getString(id);
    if (result != null){
      return ProductModel.fromJson(json.decode(result));
    }else{
      throw CacheException();
    }


  }

  /// Remove product from shared preference by given id if the data present
  @override
  Future<bool> removeProduct(String id) async {
      final result =  await sharedPreferences.remove(id);
      return result;
  }

    /// Update the Existing data if not add new data into shared preferences
    ///
    /// If data not in shared preference it also add to the list models presents locally
    /// if there is no list of data locally it creates one
    /// Return false if  any of the shared preferences fails
  @override
  Future<bool> updateProduct(ProductModel model) async {
    var id = model.id;
    final result = sharedPreferences.getString(id);
    /// Check if the data exists, for avoiding updating the list of local products
    ///
    /// if the data doesn't exist in shared pref meaning it should be added to the locally present Models
    try {
      if (result != null) {

        if (!await sharedPreferences.setString(id, json.encode(model.toJson()))){
          return false;
        }
      } else {
        /// Extracting the list of local products
        var list = sharedPreferences.getString(AppData.SHARED_PRODUCTS);
        if (list != null) {
          /// Add the id of the product into the list
          Map<String, dynamic> listPresent = json.decode(list);
          listPresent[id] = 1;
          if (!await sharedPreferences.setString(
              AppData.SHARED_PRODUCTS, json.encode(listPresent))){
            return false;
          }
        } else {
          if (!await sharedPreferences.setString(
              AppData.SHARED_PRODUCTS, json.encode({id: 1}))){
            return false;
          }
        }
      }
    } on Exception {
      /// if the json decode failed in the process
      return false;
    }
    return true;
  }

}