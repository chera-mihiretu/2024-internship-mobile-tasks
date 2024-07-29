import 'product.dart';

class ECommerce {
  Map<int, Product> _my_products = {}; // [id : Procuts] products mapped with id

  // this function will add product to the list
  String addProduct(int id, String name, String description, int price) {
    _my_products[id] = Product(name, description, price);
    return "product added successfully.";
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
  List<String> viewSingleProduct([String? name, int? id]) {
    if (id != null) {
      // when user searches with id
      if (_my_products.containsKey(id)) {
        return [
          id.toString(),
          _my_products[id]!.name,
          _my_products[id]!.description,
          _my_products[id]!.price.toString()
        ];
      }
    } else {
      // when user searches with name
      for (int i in _my_products.keys) {
        if (_my_products[i]!.name.toLowerCase() == name!.toLowerCase()) {
          return [
            i.toString(),
            _my_products[i]!.name,
            _my_products[i]!.description,
            _my_products[i]!.price.toString()
          ];
        }
      }
    }
    print('No products found');
    print('--------------------------------');
    return []; // return this when product not found  by name or id  in the list of products.
  }

  // this will help to update the products
  void updateProduct(int id, [String? name, String? description, int? price]) {
    if (!_my_products.containsKey(id)) {
      print("Product not found");
      return;
    }
    // update the name
    if (name != null) {
      _my_products[id]!.name = name;
    }

    // update the description
    if (description != null && description.length > 0) {
      _my_products[id]!.description = description;
    }

    // update the price
    if (price != null) {
      _my_products[id]!.price = price;
    }
    print("product updated");
    print('-----------------------------------');
  }

  // this will help to delete the products
  void deleteProduct(int key) {
    if (_my_products.containsKey(key)) {
      _my_products.remove(
          key); // remove the product from the list by key.  // this will also remove the product from the list of products.  // so, we have to use this function carefully.
      print("Product deleted successfully");
      print('--------------------------------');
    } else {
      print("Product not found");
      print("--------------------------------");
    }
  }
}
