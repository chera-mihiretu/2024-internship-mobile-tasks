import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const ProductEntity(
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
      ];
}
