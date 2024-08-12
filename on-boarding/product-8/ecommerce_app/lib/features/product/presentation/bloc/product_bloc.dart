import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/get_all_products_usecase.dart';
import '../../domain/usecases/get_product_usecase.dart';
import '../../domain/usecases/insert_product_usecase.dart';
import '../../domain/usecases/update_product_usecase.dart';
import 'product_events.dart';
import 'product_states.dart';

class ProductBloc extends Bloc<ProductEvents, ProductStates> {
  final GetProductUseCase getProductUseCase;
  final GetAllProductUseCase getAllProductUseCase;
  final UpdateProductUsecase updateProductUsecase;
  final DeleteProductUseCase deleteProductUseCase;
  final InsertProductUseCase insertProductUseCase;
  ProductBloc({
    required this.getAllProductUseCase,
    required this.deleteProductUseCase,
    required this.getProductUseCase,
    required this.insertProductUseCase,
    required this.updateProductUsecase,
  }) : super(InitialState()) {
    on<GetSingleProductEvents>((event, emit) {
      // TODO : implement this
    });

    on<GetSingleProductEvents>((event, emit) {
      // TODO : implement this
    });

    on<CreateProductEvent>((event, emit) {
      // TODO : implement this
    });

    on<UpdateProductEvent>((event, emit) {
      // TODO : implement this
    });

    on<DeleteProductEvent>((event, emit) {
      // TODO : implement this
    });
  }
}
