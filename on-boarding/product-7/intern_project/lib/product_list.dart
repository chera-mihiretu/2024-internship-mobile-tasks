import 'package:flutter/material.dart';
import 'package:intern_project/MainPage.dart';
import 'package:intern_project/components/common_components.dart';
import 'package:intern_project/components/product_view.dart';
import 'package:intern_project/constants.dart';
import 'package:intern_project/product_page.dart';
import 'package:intern_project/search_product.dart';

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
        onPressed: () {
          Navigator.pushNamed(context, MainPage.routes);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const UserProfile(
              userName: "Yohannes",
              day: "July 14, 2023",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Available Product",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppConstants.greyColor, 
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Expanded(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SearchProduct.routes);
                        },
                        icon: Icon(
                          Icons.search,
                          color: AppConstants.greyColor,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Product(
                    pressed: (){
                      Navigator.pushNamed(context, SingleProduct.routes);
                    },
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
