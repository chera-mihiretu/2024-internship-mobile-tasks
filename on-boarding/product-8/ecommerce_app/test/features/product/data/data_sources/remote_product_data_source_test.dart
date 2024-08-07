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
  http.Client client = http.Client();
  late RemoteProductDataSourceImp remoteProductDataSourceImp;
  List<ProductModel> expectedListOfModel = <ProductModel>[];
  Map<String, dynamic> finalResult = json.decode(TestingDatas.getAllProductResponce());
  for (Map<String, dynamic> jsonModel in finalResult['data']){
    expectedListOfModel.add(ProductModel.fromJson(jsonModel));
  }
  ProductModel expectedSingleProduct = ProductModel.fromJson(json.decode(TestingDatas.getSingleProduct())['data']);
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
    test('Should return product model when single data with id is required', () async {
      /// arrange
      when(
        mockHttpClient.get(Uri.parse('${AppData.baseUrl}/${TestingDatas.id}'), headers: anyNamed('headers'))
      ).thenAnswer((_) async  => http.Response(TestingDatas.getSingleProduct(), 200));
      /// action
      ///
      final result = await  remoteProductDataSourceImp.getProduct(TestingDatas.id);


      /// assert
      expect(result, expectedSingleProduct);
      verify(mockHttpClient.get(any, headers: anyNamed('headers')));
    });

    test('Should throw ServerExceptoiin when query failed', () async {
      /// arrange
      when(
          mockHttpClient.get(Uri.parse('${AppData.baseUrl}/${TestingDatas.apiId}'), headers: anyNamed('headers'))
      ).thenThrow(const SocketException('Failed'));
      /// action
      ///
      final result =  remoteProductDataSourceImp.getProduct;


      /// assert
      expect(() async => result(TestingDatas.apiId), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(any, headers: anyNamed('headers')));
    });
    
    test('Should return Server exception when status code is not 200', () async{
      /// arrange
      when(
          mockHttpClient.get(Uri.parse('${AppData.baseUrl}/${TestingDatas.apiId}'), headers: anyNamed('headers'))
      ).thenAnswer((_) async => http.Response('Not found', 404));
      /// action
      ///
      final result =  remoteProductDataSourceImp.getProduct(TestingDatas.apiId);


      /// assert
      expect(result, throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(any, headers: anyNamed('headers')));
    });
  });


  group('insertList', (){
    test('Should add user into the data', () async {
      /// arrange
      when(
        mockHttpClient.post(Uri.parse(AppData.allProductUrl), body: {
          'image' : TestingDatas.testDataModel.imageUrl,
          'name' : TestingDatas.testDataModel.name,
          'description' : TestingDatas.testDataModel.description,
          'price' : '${TestingDatas.testDataModel.price}',

        } , headers: anyNamed('headers'))
      ).thenAnswer((_) async => http.Response('', 200));
      /// action
      final result = await remoteProductDataSourceImp.insertProduct(TestingDatas.testDataModel);
      
      /// assert
      expect(result, 1);
      verify(mockHttpClient.post(any, body: {
        'image' : TestingDatas.testDataModel.imageUrl,
        'name' : TestingDatas.testDataModel.name,
        'description' : TestingDatas.testDataModel.description,
        'price' : '${TestingDatas.testDataModel.price}',
      }, headers: anyNamed('headers')));
      
      
      
      
    });

    test('Should throw server exception when request fails, socket exception', () async {
      /// arrange
      when(
          mockHttpClient.post(Uri.parse(AppData.allProductUrl), body: {
            'image' : TestingDatas.testDataModel.imageUrl,
            'name' : TestingDatas.testDataModel.name,
            'description' : TestingDatas.testDataModel.description,
            'price' : '${TestingDatas.testDataModel.price}',

          } , headers: anyNamed('headers'))
      ).thenThrow(const SocketException('Failed'));
      /// action
      final result =  remoteProductDataSourceImp.insertProduct;

      /// assert
      expect(() async => result(TestingDatas.testDataModel), throwsA(isA<ServerException>()));
      verify(mockHttpClient.post(any, body: {
        'image' : TestingDatas.testDataModel.imageUrl,
        'name' : TestingDatas.testDataModel.name,
        'description' : TestingDatas.testDataModel.description,
        'price' : '${TestingDatas.testDataModel.price}',
      }, headers: anyNamed('headers')));
    });


    test('Should throw server exception when status code is not 200', () async {
      /// arrange
      when(
          mockHttpClient.post(Uri.parse(AppData.allProductUrl), body: {
            'image' : TestingDatas.testDataModel.imageUrl,
            'name' : TestingDatas.testDataModel.name,
            'description' : TestingDatas.testDataModel.description,
            'price' : '${TestingDatas.testDataModel.price}',

          } , headers: anyNamed('headers'))
      ).thenAnswer((_) async => http.Response('Not found', 404));
      /// action
      final result =  remoteProductDataSourceImp.insertProduct;

      /// assert
      expect(() async => result(TestingDatas.testDataModel), throwsA(isA<ServerException>()));
      verify(mockHttpClient.post(any, body: {
        'image' : TestingDatas.testDataModel.imageUrl,
        'name' : TestingDatas.testDataModel.name,
        'description' : TestingDatas.testDataModel.description,
        'price' : '${TestingDatas.testDataModel.price}',
      }, headers: anyNamed('headers')));
    });
  });


  group('updateProducr', ()  {
    test('Should update the product if all value are valid', () async {
      /// arrange
      when(
          mockHttpClient.put(Uri.parse('${AppData.allProductUrl}/${TestingDatas.id}'), body: {
            'name' : TestingDatas.testDataModel.name,
            'description' : TestingDatas.testDataModel.description,
            'price' : '${TestingDatas.testDataModel.price}',

          } , headers: anyNamed('headers'))
      ).thenAnswer((_) async => http.Response('', 200));
      /// action
      final result = await remoteProductDataSourceImp.updateProduct(TestingDatas.testDataModel);

      /// assert
      expect(result, 1);
      verify(mockHttpClient.put(any, body: {
        'name' : TestingDatas.testDataModel.name,
        'description' : TestingDatas.testDataModel.description,
        'price' : '${TestingDatas.testDataModel.price}',
      }, headers: anyNamed('headers')));




    });

    test('Should throw server exception when request fails, socket exception', () async {
      /// arrange
      when(
          mockHttpClient.put(any, body: {
            'name' : TestingDatas.testDataModel.name,
            'description' : TestingDatas.testDataModel.description,
            'price' : '${TestingDatas.testDataModel.price}',
          } , headers: anyNamed('headers'))
      ).thenThrow(const SocketException('Failed'));
      /// action
      final result =  remoteProductDataSourceImp.updateProduct;

      /// assert
      expect(() async => result(TestingDatas.testDataModel), throwsA(isA<ServerException>()));
      verify(mockHttpClient.put(any, body: {
        'name' : TestingDatas.testDataModel.name,
        'description' : TestingDatas.testDataModel.description,
        'price' : '${TestingDatas.testDataModel.price}',
      }, headers: anyNamed('headers')));
    });


    test('Should throw server exception when status code is not 200', () async {
      /// arrange
      when(
          mockHttpClient.put(any, body: {
            'name' : TestingDatas.testDataModel.name,
            'description' : TestingDatas.testDataModel.description,
            'price' : '${TestingDatas.testDataModel.price}',

          } , headers: anyNamed('headers'))
      ).thenAnswer((_) async => http.Response('Not found', 404));
      /// action
      final result =  remoteProductDataSourceImp.updateProduct;

      /// assert
      expect(() async => result(TestingDatas.testDataModel), throwsA(isA<ServerException>()));
      verify(mockHttpClient.put(any, body: {
        'name' : TestingDatas.testDataModel.name,
        'description' : TestingDatas.testDataModel.description,
        'price' : '${TestingDatas.testDataModel.price}',
      }, headers: anyNamed('headers')));
    });
  });


  group('deleteProduct', ()  {
    test('Should delete the product if all value is valid', () async {
      /// arrange
      when(
          mockHttpClient.delete(Uri.parse('${AppData.allProductUrl}/${TestingDatas.id}') , headers: anyNamed('headers'))
      ).thenAnswer((_) async => http.Response('', 200));
      /// action
      final result = await remoteProductDataSourceImp.deleteProduct(TestingDatas.id);

      /// assert
      expect(result, 1);
      verify(mockHttpClient.delete(any, headers: anyNamed('headers')));

    });

    test('Should throw server exception when request fails, socket exception', () async {
      /// arrange
      when(
          mockHttpClient.delete(any, headers: anyNamed('headers'))
      ).thenThrow(const SocketException('Failed'));
      /// action
      final result =  remoteProductDataSourceImp.deleteProduct;

      /// assert
      expect(() async => result(TestingDatas.id), throwsA(isA<ServerException>()));
      verify(mockHttpClient.delete(any, headers: anyNamed('headers')));
    });


    test('Should throw server exception when status code is not 200', () async {
      /// arrange
      when(
          mockHttpClient.delete(any, headers: anyNamed('headers'))
      ).thenAnswer((_) async => http.Response('Not found', 404));
      /// action
      final result =  remoteProductDataSourceImp.deleteProduct;

      /// assert
      expect(() async => result(TestingDatas.id), throwsA(isA<ServerException>()));
      verify(mockHttpClient.delete(any, headers: anyNamed('headers')));
    });
  });
}
