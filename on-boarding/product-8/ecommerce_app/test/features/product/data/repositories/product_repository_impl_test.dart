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
      /// Test for offline calls
      group('Offline actions', () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        });

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
      });

      /// Test for online calls
      group('Online actions', () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });
      });
    });
  });
}
