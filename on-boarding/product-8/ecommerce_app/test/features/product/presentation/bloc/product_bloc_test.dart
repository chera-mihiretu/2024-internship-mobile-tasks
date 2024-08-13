import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:ecommerce_app/core/errors/failures/failure.dart';
import 'package:ecommerce_app/features/product/domain/usecases/get_all_products_usecase.dart';
import 'package:ecommerce_app/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_app/features/product/presentation/bloc/product_events.dart';
import 'package:ecommerce_app/features/product/presentation/bloc/product_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_helper/test_helper_generation.mocks.dart';
import '../../../../test_helper/testing_datas/product_testing_data.dart';

void main() {
  late MockGetAllProductUseCase mockGetAllProductUseCase;
  late MockUpdateProductUsecase mockUpdateProductUsecase;
  late MockDeleteProductUseCase mockDeleteProductUseCase;
  late MockInsertProductUseCase mockInsertProductUseCase;
  late MockGetProductUseCase mockGetProductUseCase;
  late ProductBloc productBloc;

  setUp(() {
    mockGetProductUseCase = MockGetProductUseCase();
    mockGetAllProductUseCase = MockGetAllProductUseCase();
    mockUpdateProductUsecase = MockUpdateProductUsecase();
    mockInsertProductUseCase = MockInsertProductUseCase();
    mockDeleteProductUseCase = MockDeleteProductUseCase();
    productBloc = ProductBloc(
      getAllProductUseCase: mockGetAllProductUseCase,
      deleteProductUseCase: mockDeleteProductUseCase,
      getProductUseCase: mockGetProductUseCase,
      insertProductUseCase: mockInsertProductUseCase,
      updateProductUsecase: mockUpdateProductUsecase,
    );
  });

  group('Bloc initial state check', () {
    test('Initial State should be InitialStateInstance', () {
      /// assert
      expect(productBloc.state, InitialState());
    });
  });

  group('getProducts test', () {
    blocTest<ProductBloc, ProductStates>(
      'Should return actual value when succes',
      build: () {
        when(mockGetProductUseCase.execute(any))
            .thenAnswer((_) async => const Right(TestingDatas.testDataEntity));
        return productBloc;
      },
      act: (bloc) => bloc.add(GetSingleProductEvents(id: TestingDatas.id)),
      expect: () => [
        LoadingState(),
        const LoadedSingleProductState(
            productEntity: TestingDatas.testDataEntity)
      ],
    );

    blocTest<ProductBloc, ProductStates>(
      'Should return server error state  when failed',
      build: () {
        when(mockGetProductUseCase.execute(any)).thenAnswer(
            (_) async => const Left(ServerFailure(AppData.serverError)));
        return productBloc;
      },
      act: (bloc) => bloc.add(GetSingleProductEvents(id: TestingDatas.id)),
      expect: () => [
        LoadingState(),
        ErrorState(message: AppData.serverError),
      ],
    );

    blocTest<ProductBloc, ProductStates>(
      'Should return cache error when no network',
      build: () {
        when(mockGetProductUseCase.execute(any)).thenAnswer(
            (_) async => const Left(CacheFailure(AppData.cacheError)));
        return productBloc;
      },
      act: (bloc) => bloc.add(GetSingleProductEvents(id: TestingDatas.id)),
      expect: () => [
        LoadingState(),
        ErrorState(message: AppData.cacheError),
      ],
    );
  });

  group('getAllProduct test', () {
    blocTest<ProductBloc, ProductStates>(
      'Should return actual value when succes',
      build: () {
        when(mockGetAllProductUseCase.execute()).thenAnswer(
            (_) async => const Right(TestingDatas.productEntityList));
        return productBloc;
      },
      act: (bloc) => bloc.add(LoadAllProductEvents()),
      expect: () => [
        LoadingState(),
        const LoadedAllProductState(data: TestingDatas.productEntityList)
      ],
    );

    blocTest<ProductBloc, ProductStates>(
      'Should return Server error  when failed',
      build: () {
        when(mockGetAllProductUseCase.execute()).thenAnswer(
            (_) async => const Left(ServerFailure(AppData.serverError)));
        return productBloc;
      },
      act: (bloc) => bloc.add(LoadAllProductEvents()),
      expect: () => [LoadingState(), ErrorState(message: AppData.serverError)],
    );

    blocTest<ProductBloc, ProductStates>(
      'Should return cache error when there is caching problem',
      build: () {
        when(mockGetAllProductUseCase.execute()).thenAnswer(
            (_) async => const Left(CacheFailure(AppData.cacheError)));
        return productBloc;
      },
      act: (bloc) => bloc.add(LoadAllProductEvents()),
      expect: () => [LoadingState(), ErrorState(message: AppData.cacheError)],
    );
  });

  group('insert Product test', () {
    blocTest<ProductBloc, ProductStates>(
      'Should return int 1 when success',
      build: () {
        when(mockInsertProductUseCase.execute(any))
            .thenAnswer((_) async => const Right(1));
        return productBloc;
      },
      act: (bloc) => bloc.add(InsertProductEvent(
          name: TestingDatas.testDataEntity.name,
          imageUrl: TestingDatas.testDataEntity.imageUrl,
          price: TestingDatas.testDataEntity.price,
          description: TestingDatas.testDataEntity.description)),
      expect: () => [LoadingState(), (message: AppData.successInsert)],
    );
  });
}
