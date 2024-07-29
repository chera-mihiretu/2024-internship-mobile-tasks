import 'product.dart';

class ECommerce {
  Map<int, Product> _my_products = {}; // [id : Procuts] products mapped with id

  // this function will add product to the list
  void addProduct(int id, String name, String description, int price) {
    print('--------------------------------');
    _my_products[id] = Product(name, description, price);
    print("product added successfully.");
    print('--------------------------------');
  }

  // this will show the products
  List<dynamic> viewProducts() {
    List<dynamic> answer = [];
    for (int i in _my_products.keys) {
      // adding the product to the list
      answer.add([
        i.toString(),
        _my_products[i]!.name,
        _my_products[i]!.description,
        _my_products[i]!.price.toString()
      ]);
    }
    return answer;
  }

  //  shows single product
  List<String> viewSingleProduct(String? pro_id) {
    if (pro_id != null && pro_id.length > 0) {
      int id = int.parse(pro_id);
      // when user searches with id
      if (_my_products.containsKey(id)) {
        return [
          id.toString(),
          _my_products[id]!.name,
          _my_products[id]!.description,
          _my_products[id]!.price.toString()
        ];
      }
    }

    print('--------------------------------');
    print('No products found');
    print('--------------------------------');
    return []; // return this when product not found  by name or id  in the list of products.
  }

  // this will help to update the products
  void updateProduct(int id,
      [String? name, String? description, String? price]) {
    if (!_my_products.containsKey(id)) {
      print("Product not found");
      return;
    }
    // update the name
    if (name != null && name.length > 0) {
      _my_products[id]!.name = name;
    }

    // update the description
    if (description != null && description.length > 0) {
      _my_products[id]!.description = description;
    }

    // update the price
    if (price != null && price.length > 0) {
      _my_products[id]!.price = int.parse(price);
    }
    print("product updated");
    print('-----------------------------------');
  }

  // this will help to delete the products
  void deleteProduct(int key) {
    if (_my_products.containsKey(key)) {
      _my_products.remove(key); // remove the product from the list by key.
      print("Product deleted successfully");
      print('--------------------------------');
    } else {
      print("Product not found");
      print("--------------------------------");
    }
  }
}
