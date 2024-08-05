import 'dart:convert';

import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_helper/testing_datas/product_data.dart';

void main () {

  const data = TestingDatas.testDataModel;
  test('Product model should subclass of product Entity', (){

    /// assert
    expect(data, isA<ProductEntity>());

  });

  test('This test is to make sure the Product is implemented correctly', (){
    /// action
    ///
    final result = ProductModel.fromJson(json.decode(TestingDatas.readJson()));
    /// assertion

    expect(result, TestingDatas.testDataModel);
  });

  test(
    'This is test to test the toJson of product class',
      () {
        /// arrange
        final expectedJson =json.decode(TestingDatas.readJson())['data'];
        /// action
        final result = TestingDatas.testDataModel.toJson();
        /// assertion
        expect(result, expectedJson);
      });
}