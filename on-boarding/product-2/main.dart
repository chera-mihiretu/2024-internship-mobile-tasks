import 'dart:io';
import 'eCommerce.dart';
import 'product.dart';

// Starting the application
void main() {
  ECommerce commerce = new ECommerce();

  List<String> commands = [
    'Add Product',
    'View Product',
    'Update Product',
    'Delete Product'
  ];
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
          String desc = input!;

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
          List<dynamic> answer = commerce.viewProducts();
          for (int i = 0; i < answer.length; i++) {
            for (String value in answer[i]) {
              stdout.write('$value \t');
            }
            print('\n');
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
          input = stdin.readLineSync();
          if (input != null) {
            commerce.updateProduct(id, name, desc);
          } else {
            commerce.updateProduct(id, name, desc, int.parse(input!));
          }

          break;
        case 3:
          stdout.write("Enter the ID of the product to update: ");
          input = stdin.readLineSync();
          if (input == null) {
            print("ID is required");
            break;
          }
          commerce.deleteProduct(int.parse(input));
          break;
        default:
          print("Invalid command. Please try again.");
      }
    }
  }
}
