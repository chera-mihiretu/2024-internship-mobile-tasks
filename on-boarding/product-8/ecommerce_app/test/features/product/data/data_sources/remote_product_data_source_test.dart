import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:ecommerce_app/core/errors/exceptions/product_exceptions.dart';
import 'package:ecommerce_app/features/product/data/data_resources/remote_product_data_source.dart';
import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import '../../../../test_helper/test_helper_generation.mocks.dart';
import '../../../../test_helper/testing_datas/product_testing_data.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteProductDataSourceImp remoteProductDataSourceImp;
  List<ProductModel> expectedListOfModel = <ProductModel>[];
  Map<String, dynamic> finalResult = json.decode(TestingDatas.getAllProductResponce());
  for (Map<String, dynamic> jsonModel in finalResult['data']){
    expectedListOfModel.add(ProductModel.fromJson(jsonModel));
  }
  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteProductDataSourceImp = RemoteProductDataSourceImp(mockHttpClient);
  });

  group('testing the getAllProducts', () {
    test('Should list prouct of model when success', () async {
      /// arrange
      when(
          mockHttpClient.get(Uri.parse(AppData.allProductUrl),headers:AppData.jsonHeader)
      ).thenAnswer((_) async => http.Response(TestingDatas.getAllProductResponce(), 200));
      /// action
      final result = await remoteProductDataSourceImp.getAllProducts();
      verify(mockHttpClient.get(any, headers: anyNamed('headers')));

      expect(result, expectedListOfModel);
    });

    test('Should return ServerException  when socket exception is thrown',  (){
      /// arrange
      when(
        mockHttpClient.get(Uri.parse(AppData.allProductUrl), headers: AppData.jsonHeader)
      ).thenThrow(const SocketException('Failed'));

      /// action
      final result = remoteProductDataSourceImp.getAllProducts;
      /// assert
      expect(() async => result() , throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(any, headers: anyNamed('headers')));

    });

    test('Should return ServerException when status code is not 200', (){
      /// arrange
      when(
          mockHttpClient.get(Uri.parse(AppData.allProductUrl), headers: AppData.jsonHeader)
      ).thenAnswer((_) async => http.Response('Not Found', 404));
      /// action
      ///
      final result = remoteProductDataSourceImp.getAllProducts();

      expect(result, throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(any, headers: anyNamed('headers')));

    });
  });



  group('This is to test getProduct ', (){

  });
}
