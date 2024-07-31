import 'package:flutter/material.dart';
import 'package:intern_project/components/bars.dart';
import 'package:intern_project/components/buttons.dart';
import 'package:intern_project/components/inputs.dart';
import 'package:intern_project/constants.dart';

import 'components/product_view.dart';

class SearchProduct extends StatefulWidget {
  static String routes = '/search_product';

  const SearchProduct({super.key});

  @override
  State<StatefulWidget> createState() => _SearchProduct();
}

class _SearchProduct extends State<SearchProduct> with AppBars {
  final TextEditingController searchControl = TextEditingController();
  final TextEditingController catagory = TextEditingController();
  RangeValues theRange = const RangeValues(10, 90);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: normalAppBar("Search Product", () {}),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: SearchInput(
                  hint: "Search Item",
                  control: searchControl,
                  search: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: AppConstants.blueColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: const Icon(Icons.filter_list),
                ),
              )
            ],
          ),
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
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CostumInput(
                  hint: "",
                  text: "Catagory",
                  control: catagory,
                  fillColor: Colors.white,
                  borderColor: AppConstants.greyColor,
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text(
                        "Price",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: RangeSlider(
                        min: 0,
                        max: 100,
                        activeColor: AppConstants.blueColor,
                        inactiveColor: AppConstants.greyColor,
                        values: theRange,
                        divisions: 10,
                        onChanged: (newVal) {
                          setState(() {
                            theRange = newVal;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FillCustomButton(press: () {}, label: "Apply")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
