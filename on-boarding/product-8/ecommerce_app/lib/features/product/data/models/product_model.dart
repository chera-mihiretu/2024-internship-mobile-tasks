import '../../domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required String id,
    required String name,
    required String description,
    required int price,
    required String imageUrl,
  }) : super(
            id: id,
            name: name,
            description: description,
            price: price,
            imageUrl: imageUrl);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['data']['id'],
      name: json['data']['name'],
      description: json['data']['description'],
      price: json['data']['price'],
      imageUrl: json['data']['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': '$id',
      'name': '$name',
      'description': '$description',
      'price': price,
      'imageUrl': '$imageUrl',
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      imageUrl: entity.imageUrl,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }
  static List<ProductEntity> allToEntity(List<ProductModel> models) {
    List<ProductEntity> answer = <ProductEntity>[];
    for(int i = 0; i < models.length; i ++ ){
      answer.add(models[i].toEntity());
    }
    return answer;

  }
}
