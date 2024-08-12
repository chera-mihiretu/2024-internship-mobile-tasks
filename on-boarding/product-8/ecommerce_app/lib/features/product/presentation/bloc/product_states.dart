import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';

abstract class ProductStates extends Equatable {
  final List<dynamic> data;
  const ProductStates([this.data = const <dynamic>[]]);

  @override
  List<Object?> get props => [data];
}

class InitialState extends ProductStates {}

class LoadingState extends ProductStates {}

class LoadedAllProductState extends ProductStates {
  final List<ProductEntity> data;
  const LoadedAllProductState({required this.data}) : super(data);
}

class ErrorState extends ProductStates {
  final String message;
  ErrorState({required this.message}) : super([message]);
}
