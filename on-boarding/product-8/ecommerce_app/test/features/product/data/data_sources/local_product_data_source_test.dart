import 'dart:convert';

import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:ecommerce_app/core/errors/exceptions/product_exceptions.dart';
import 'package:ecommerce_app/features/product/data/data_resources/local_product_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_helper/test_helper_generation.mocks.dart';
import '../../../../test_helper/testing_datas/product_testing_data.dart';

void main(){
  late MockSharedPreferences mockSharedPreferences;
  late LocalProductDataSourceImpl localProductDataSourceImpl;
  setUp((){
    mockSharedPreferences = MockSharedPreferences();
    localProductDataSourceImpl = LocalProductDataSourceImpl(mockSharedPreferences);
  });

  group('getProduct test', (){

    test('should return ProductModel if the key of the product exist on shared preferences', () async {
      /// arrange
      when(
        mockSharedPreferences.getString(any)
      ).thenAnswer((_) => TestingDatas.readJson());
      /// action
      final result = await localProductDataSourceImpl.getProduct(TestingDatas.id);


      /// assert
      verify(mockSharedPreferences.getString(TestingDatas.id));

      expect(result, TestingDatas.testDataModel);

    });


    test('should return ProductModel if the key of the product exist on shared preferences', () async {
      /// arrange
      when(
          mockSharedPreferences.getString(any)
      ).thenThrow(CacheException());
      /// action
      final result =  localProductDataSourceImpl.getProduct;

      /// assert
      //verify(mockSharedPreferences.getString(TestingDatas.id));

      expect(() async  => await result(TestingDatas.id), throwsA(isA<CacheException>()));

    });
  });

  group('getAllProduc test', (){
    test('getProduct should return list of available products on shared preferences', () async {
      /// arrange

      when(
        mockSharedPreferences.getString(any)
      ).thenAnswer((invocation) {
        if (invocation.positionalArguments[0] == AppData.SHARED_PRODUCTS){
          return TestingDatas.sharedPrefTest;
        }else{
          return TestingDatas.readJson();
        }
      });
      /// action

      final result = await localProductDataSourceImpl.getAllProducts();


      /// assert
      verify(mockSharedPreferences.getString(AppData.SHARED_PRODUCTS));
      verify(mockSharedPreferences.getString(TestingDatas.id));
      expect(result, TestingDatas.productModelList);
    });
  });
  
  group('removeProduct test', (){
    test('Should return true when data is removed', () async {
      /// arrange
      when(
          mockSharedPreferences.remove(any)
      ).thenAnswer((_) async => true);
      /// action
      final result = await localProductDataSourceImpl.removeProduct(TestingDatas.id);
      /// assert

      verify(mockSharedPreferences.remove(TestingDatas.id));
      expect(result , true);
    });

    test('Should return false when the data is not found locally', () async {
      /// arrange
      when(
          mockSharedPreferences.remove(any)
      ).thenAnswer((_) async => false);
      /// action
      final result = await localProductDataSourceImpl.removeProduct(TestingDatas.id);
      /// assert

      verify(mockSharedPreferences.remove(TestingDatas.id));
      expect(result , false);
    });
  });


  group('updateProduct Test', (){
    test('Should return true if the value is updated, and the list update should not be visited', () async {
      /// arrange
      when(
        mockSharedPreferences.getString(any)
      ).thenAnswer((invocation){
        if (invocation.positionalArguments[0] == AppData.SHARED_PRODUCTS){
            return TestingDatas.sharedPrefTest;
        }else{
          return TestingDatas.readJson();
        }
      });
      when(
        mockSharedPreferences.setString(any, any)
      ).thenAnswer((_) async => true);
      /// action
      final result = await localProductDataSourceImpl.updateProduct(TestingDatas.testDataModel);
      verify(mockSharedPreferences.getString(TestingDatas.id));
      verify(mockSharedPreferences.setString(TestingDatas.id, json.encode(TestingDatas.testDataModel)));
      /// verify
      expect(result, true);
    });

    test('Should also act accordingly when the list doesn\'t present', () async {

    });
  });
}