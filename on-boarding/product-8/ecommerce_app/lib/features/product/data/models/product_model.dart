import '../../domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      int id,
      String name,
      String description,
      double price,
      String imageUrl,
      ):
      super(
        id: id,
        name: name,
        description: description,
        price : price,
        imageUrl: imageUrl
      );
}