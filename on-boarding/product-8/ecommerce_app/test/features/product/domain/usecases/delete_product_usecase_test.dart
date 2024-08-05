import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/product/domain/usecases/delete_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_helper/test_helper_generation.mocks.dart';

void main(){
  late MockProductRepository mockProductRepository;
  late DeleteProductUseCase deleteProductUseCase;

  setUp((){
    mockProductRepository = MockProductRepository();
    deleteProductUseCase = DeleteProductUseCase(mockProductRepository);
  });

  int id = 8;

  test('Testing the data flow inside the Repositrory of deleting product', () async {
    /// Rearranging the functionality
    when(
      mockProductRepository.deleteProduct(id)
    ).thenAnswer((_)async =>  const Right(1));

    /// action

    final result = await deleteProductUseCase.execute(id);

    /// assertion
    ///
    expect(result, const Right(1));


  });
}