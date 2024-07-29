class Product {
  static int id = 0;
  String _name;
  String _description;
  int _price;
  Product(this._name, this._description, this._price) {
    id++;
  }

  // The following function are for the getting the private values from different class
  String get name {
    return _name;
  }

  String get description {
    return _description;
  }

  int get price {
    return _price;
  }

  // The following function are to set the private values

  void set name(String name) {
    this._name = name;
  }

  void set description(String desc) {
    this._description = desc;
  }

  void set price(int price) {
    this._price = price;
  }
}
