import 'package:flutter/material.dart';
import '../../../../core/themes/themes.dart';
import '../widgets/app_bar.dart';
import '../widgets/costum_input.dart';
import '../widgets/fill_custom_button.dart';
import '../widgets/outline_custom_button.dart';

class AddProductPage extends StatelessWidget with AppBars {
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController catagoryControl = TextEditingController();
  final TextEditingController priceControl = TextEditingController();
  final TextEditingController descControl = TextEditingController();
  static const String routes = '/add_product_page';
  AddProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: normalAppBar('Add Product', () {}),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 180,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: MyTheme.ecInputGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.image_outlined,
                          size: 80,
                        ),
                      ),
                      const Text('Upload Image')
                    ],
                  ),
                ],
              ),
              CostumInput(
                hint: '',
                control: nameControl,
                text: 'Name',
              ),
              CostumInput(
                hint: '',
                control: catagoryControl,
                text: 'Catagory',
              ),
              CostumInput(
                hint: '',
                control: priceControl,
                text: 'Price',
              ),
              CostumInput(
                hint: '',
                control: descControl,
                text: 'Description',
                maxLine: 5,
              ),
              Row(
                children: [
                  Expanded(child: FillCustomButton(press: () {}, label: 'ADD'))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlineCustomButton(press: () {}, label: 'DELETE'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
