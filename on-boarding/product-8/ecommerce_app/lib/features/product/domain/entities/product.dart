import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

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
