
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/update_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_helper/test_helper_generation.mocks.dart';

void main(){
  late MockProductRepository mockProductRepository;
  late UpdateProductUsecase updateProductUsecase;

  setUp((){
    mockProductRepository = MockProductRepository();
    updateProductUsecase = UpdateProductUsecase(mockProductRepository);
  });

  const testData =  ProductEntity(
      id: 0,
      name: 'Derby Leather Sheos',
      description: 'men\'s shoes',
      price: 150.0,
      imageUrl: '');
  test('Testing the data flow inside the Repositrory of updating product', () async {
    /// Rearranging the functionality
    when(
        mockProductRepository.updateProduct(testData)
    ).thenAnswer((_) async =>  const Right(1));

    /// action

    final result = await updateProductUsecase.execute(testData);

    /// assertion
    ///
    expect(result, const Right(1));


  });
}