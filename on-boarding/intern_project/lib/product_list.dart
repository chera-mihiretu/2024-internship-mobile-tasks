import 'package:flutter/material.dart';
import 'package:intern_project/components/common_components.dart';
import 'package:intern_project/components/product_view.dart';
import 'package:intern_project/constants.dart';

class ProductList extends StatefulWidget {
  static String routes = '/product_list';

  const ProductList({super.key});

  @override
  State<StatefulWidget> createState() => _ProductList();
}

class _ProductList extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConstants.blueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
          const UserProfile(userName: "Yohannes", day: "July 14, 2023",),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Product(
                    imageUrl: AppConstants.imageUrl,
                    productName: "Derby Leather Shoes",
                    price: 150,
                    productType: "Men’s shoe",
                    rating: "4.0",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
