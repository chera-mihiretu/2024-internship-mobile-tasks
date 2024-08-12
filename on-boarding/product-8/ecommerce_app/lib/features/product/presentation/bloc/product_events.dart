import 'package:equatable/equatable.dart';

import '../../domain/entities/product.dart';

abstract class ProductEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAllProductEvents extends ProductEvents {}

class GetSingleProductEvents extends ProductEvents {
  final String id;
  GetSingleProductEvents({required this.id});
}

class UpdateProductEvent extends ProductEvents {
  final String id;
  final String name;
  final String description;
  final int price;

  UpdateProductEvent({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });
}

class DeleteProductEvent extends ProductEvents {
  final String id;

  DeleteProductEvent({required this.id});
}

class CreateProductEvent extends ProductEvents {
  final String name;
  final String description;
  final int price;
  final String imageUrl;

  CreateProductEvent({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}