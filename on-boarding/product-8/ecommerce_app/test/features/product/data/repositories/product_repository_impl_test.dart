import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures/failure.dart';
import 'package:ecommerce_app/features/product/data/models/product_model.dart';

import 'package:ecommerce_app/features/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_helper/test_helper_generation.mocks.dart';
import '../../../../test_helper/testing_datas/product_testing_data.dart';

void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockLocalProductDataSource mockLocalProductDataSource;
  late MockRemoteProductDataSource mockRemoteProductDataSource;
  late ProductRepositoryImpl productRepositoryImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockLocalProductDataSource = MockLocalProductDataSource();
    mockRemoteProductDataSource = MockRemoteProductDataSource();

    productRepositoryImpl = ProductRepositoryImpl(
      remoteProductDataSource: mockRemoteProductDataSource,
      localProductDataSource: mockLocalProductDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('Checking if network info is being called', () {
    group('Testing the Implemented Repository by checking thee network info',
        () {
      /// Test for online calls
      group('Offline actions', () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });



        /// This test is for getAllProduct
        test('getAllProduct Should return valid list of ProductEntity',
            () async {
          /// arrange
          when(mockRemoteProductDataSource.getAllProducts())
              .thenAnswer((_) async => TestingDatas.productModelList);

          /// action
          ///
          final result = await productRepositoryImpl.getAllProducts();

          /// assert
          // will verify if isConnected method form network info is called
          verify(mockNetworkInfo.isConnected);
          result.fold((failure) {}, (data) {
            expect(data, TestingDatas.productEntityList);
          });
        });



        /// This test is for getProduct
        test('Should call the network method and return appropriate data',
            () async {
          /// arrange
          when(mockRemoteProductDataSource.getProduct(TestingDatas.id))
              .thenAnswer((_) async => TestingDatas.testDataModel);

          /// action

          final result =
              await productRepositoryImpl.getProduct(TestingDatas.id);

          /// assertion

          verify(mockNetworkInfo.isConnected);

          expect(result, const Right(TestingDatas.testDataEntity));
        });



        /// This test for updateProduct
        test('Should return number of row affected when succes when updated', () async {
          /// arrange
          when(mockRemoteProductDataSource
                  .updateProduct(TestingDatas.testDataModel))
              .thenAnswer((_) async => 1);

          ///action

          final result = await productRepositoryImpl
              .updateProduct(TestingDatas.testDataEntity);

          /// assert

          expect(result, const Right(1));
        });


        /// this test is for deleteProduct
        test('Should return number of row affected when succes when deleted', () async {
          /// arrange
          when(mockRemoteProductDataSource
              .deleteProduct(TestingDatas.id))
              .thenAnswer((_) async => 1);

          ///action

          final result = await productRepositoryImpl
              .deleteProduct(TestingDatas.id);

          /// assert

          expect(result, const Right(1));
        });


        /// This test is for insertProduct
        test('Should return number of row affected when succes when new data is inserted', () async {
          /// arrange
          when(mockRemoteProductDataSource
              .insertProduct(TestingDatas.testDataModel))
              .thenAnswer((_) async => 1);

          ///action

          final result = await productRepositoryImpl
              .insertProduct(TestingDatas.testDataEntity);

          /// assert

          expect(result, const Right(1));
        });
      });





      /// Test for offline calls
      group('offline actions', () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        });


        /// Similar to the online test but has to return when datamanipulation


        /// This test is for getAllProduct offline
        test('getAllProduct Should return valid list of ProductEntity from a cache',
                () async {
              /// arrange
              when( mockLocalProductDataSource.getAllProducts())
                  .thenAnswer((_) async => TestingDatas.productModelList);

              /// action
              ///
              final result = await productRepositoryImpl.getAllProducts();

              /// assert
              // will verify if isConnected method form network info is called
              verify(mockNetworkInfo.isConnected);
              result.fold((failure) {}, (data) {
                expect(data, TestingDatas.productEntityList);
              });
            });



        /// This test is for getProduct offline
        test('Should get data from local repo when offline',
                () async {
              /// arrange
              when(

                  mockLocalProductDataSource.getProduct(TestingDatas.id))
                  .thenAnswer((_) async => TestingDatas.testDataModel);

              /// action

              final result =
              await productRepositoryImpl.getProduct(TestingDatas.id);

              /// assertion

              verify(mockNetworkInfo.isConnected);

              expect(result, const Right(TestingDatas.testDataEntity));
            });



        /// This test for updateProduct offline
        test('Should return failure when update fails', () async {

          ///action

          final result = await productRepositoryImpl
              .updateProduct(TestingDatas.testDataEntity);

          /// assert

          expect(result, Left(ConnectionFailure()));
        });


        /// this test is for deleteProduct offline
        test('Should return failure when deletion fails', () async {

          ///action

          final result = await productRepositoryImpl
              .deleteProduct(TestingDatas.id);

          /// assert

          expect(result, Left(ConnectionFailure()));
        });


        /// This test is for insertProduct when offline
        test('Should return failure  insertion fails', () async {

          ///action

          final result = await productRepositoryImpl
              .insertProduct(TestingDatas.testDataEntity);

          /// assert

          expect(result,Left(ConnectionFailure()));
        });



      });
    });
  });
}
