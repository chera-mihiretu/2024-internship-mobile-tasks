import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/get_all_products_usecase.dart';
import 'package:ecommerce_app/features/product/domain/usecases/get_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_helper/test_helper_generation.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;
  late GetProductUseCase getProductUseCase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getProductUseCase = GetProductUseCase(mockProductRepository);
  });
  int id = 0;
  const  testingProducts =
    ProductEntity(
      id: 0,
      name: 'Derby Leather Sheos',
      description: 'men\'s shoes',
      price: 150.0,
      imageUrl: '',);

  test('Testing the data flow inside the Repositrory of product list return', () async {
    /// Rearranging the functionality
    when(
        mockProductRepository.getProduct(id)
    ).thenAnswer((_) async => const Right(testingProducts));

    /// action

    final result = await getProductUseCase.execute(id);

    /// assertion
    ///
    expect(result, const Right(testingProducts));
  });
}