import 'package:flutter/material.dart';
import 'package:intern_project/constants.dart';

import 'components/buttons.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  static String routes = '/single_product';

  @override
  State<StatefulWidget> createState() => _SingleProduct();
}

class _SingleProduct extends State<SingleProduct> {
  List<List<int>> size = [[1, 39], [0, 40], [0, 41], [0, 42], [0,43], [0, 44], [0, -1]];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.network(
                   AppConstants.imageUrl),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.blue,
                      ),
                      style: IconButton.styleFrom(backgroundColor: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Men’s shoe",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: 'poppins',
                    ),
                  ),
                  Wrap(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 184, 100),
                      ),
                      Text(
                        "(4.0)",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Derby Leather",
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "150\$",
                    style: TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "Size:",
                style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: mediaQuery.size.width,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: size.length - 1,
        
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          size[index][0] = 1;
                          int preIndex = size[size.length -1 ][0];
                          size[preIndex][0] = 0;
                          size[size.length - 1][0] = index;
        
                        });
                      },
                      child: Container(
                       margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.all(20),
                        decoration:  BoxDecoration(
                          color: (size[index][0] == 0) ? Colors.white : AppConstants.blueColor,
                            boxShadow:  const [
                               BoxShadow(color: Color.fromARGB(11, 11, 11, 11), spreadRadius: 1, blurRadius: 2)
                            ],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(size[index][1].toString(), style:  TextStyle(color: (size[index][0] == 0) ? Colors.black : Colors.white,fontWeight:  FontWeight.bold, fontSize: 20),)
                        )
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.:",
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineCustomButton(
                    press: () {},
                    label: "DELETE",
                  ),
                  FillCustomButton(press: () {}, label: "ADD"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
