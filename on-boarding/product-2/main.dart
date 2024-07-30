import 'dart:io';
import 'eCommerce.dart';
import 'product.dart';

// Starting the application
void main() {
  ECommerce commerce = new ECommerce();
  // commands
  List<String> commands = [
    'Add Product',
    'View Product',
    'Update Product',
    'Delete Product',
    'Search Product'
  ];
  List<String> titles = ['[ID]:', '[NAME]:', '[DESCRIPTION]:', '[PRICE]:'];
  String? input;
  while (true) {
    print("Choose a command");
    for (int i = 0; i < commands.length; i++) {
      print("($i) ${commands[i]}");
    }
    input = stdin.readLineSync();
    if (input != null) {
      switch (int.parse(input)) {
        case 0:
          // accept name
          stdout.write("Enter a Name: ");
          input = stdin.readLineSync();
          if (input == null) {
            print("Name is required");
            break;
          }
          String name = input!;

          // accept description
          stdout.write('Description: ');
          input = stdin.readLineSync();
          if (input == null) {
            print("Description is required");
            break;
          }
          String desc = input;

          // enter price
          stdout.write('Price: ');
          input = stdin.readLineSync();
          if (input == null) {
            print("Price is required");
            break;
          }
          int price = int.parse(input!);

          // adding the product to the list
          commerce.addProduct(Product.id, name, desc, price);
          break;
        case 1:
          print('-------------------------------------');
          List<dynamic> answer = commerce.viewProducts();
          for (int i = 0; i < answer.length; i++) {
            int counter = 0;
            for (String value in answer[i]) {
              stdout.write('${titles[counter]} $value \t');
              counter += 1;
            }
            print('');
          }
          print('-------------------------------------');
          break;
        case 2:
          stdout.write("Enter the ID of the product to update: ");
          input = stdin.readLineSync();
          if (input == null) {
            print("ID is required");
            break;
          }

          int id = int.parse(input!);
          stdout.write("Enter the new name: ");
          String? name = stdin.readLineSync();
          stdout.write("Enter the new description: ");
          String? desc = stdin.readLineSync();
          stdout.write("Enter the new price: ");
          String? price = stdin.readLineSync();
          commerce.updateProduct(id, name, desc, price);

          break;
        case 3:
          // delete a product by id
          stdout.write("Enter the ID of the product to update: ");
          input = stdin.readLineSync();
          if (input == null) {
            print("ID is required");
            break;
          }
          commerce.deleteProduct(int.parse(input));
          break;
        case 4:
          // here we colect a user based on his id
          stdout.write("Enter the ID of the product to search: ");
          input = stdin.readLineSync();
          if (input == null) {
            print("ID is required");
            break;
          }
          List<dynamic> answer = commerce.viewSingleProduct(input);

          if (answer.length > 0) {
            print('--------------------------------');
            int counter = 0;
            for (String value in answer) {
              stdout.write('${titles[counter]} $value \t');
              counter++;
            }
            print('');
            print('--------------------------------');
          }
          break;
        default:
          print("Invalid command. Please try again.");
      }
    }
  }
}
