import 'package:flutter/material.dart';
import 'package:intern_project/constants.dart';

class Product extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productType;
  final int price;
  final String rating;

  const Product({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.productName,
    required this.productType,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow:  [
            BoxShadow(
                color: AppConstants.shadowColor,
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: Column(
        children: [
          ClipRRect(

            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: SizedBox(
              height: 160,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                      fontFamily: "poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$price\$",
                  style: const TextStyle(
                    fontFamily: "poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productType,
                  style:  TextStyle(
                    color: AppConstants.darkGreyColor,
                    fontSize: 14,
                    fontFamily: 'poppins',
                  ),
                ),
                Wrap(
                  children: [
                     Icon(
                      Icons.star,
                      color: AppConstants.yellowColor,
                    ),
                    Text(
                      "($rating)",
                      style: TextStyle(
                        color: AppConstants.darkGreyColor,
                        fontSize: 14,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
