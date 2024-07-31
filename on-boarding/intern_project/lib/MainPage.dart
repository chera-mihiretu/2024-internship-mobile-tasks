import 'package:flutter/material.dart';
import 'package:intern_project/components/Buttons.dart';
import 'components/inputs.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static String routes = "/main_page";

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController name_contriol = TextEditingController();
  final TextEditingController catagory_contriol = TextEditingController();
  final TextEditingController price_contriol = TextEditingController();
  final TextEditingController desc_contriol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
        title: const Text(
          "Add Product",
          style: TextStyle(fontSize: 20),
          textDirection: TextDirection.rtl,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 231, 231),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.image,
                          size: 100,
                        ),
                      ),
                      const Text("Upload Image")
                    ],
                  ),
                ],
              ),
              CostumInput(
                hint: "",
                control: name_contriol,
                text: "Name",
              ),
              CostumInput(
                hint: "",
                control: catagory_contriol,
                text: "Catagory",
              ),
              CostumInput(
                hint: "",
                control: price_contriol,
                text: "Price",
              ),
              CostumInput(
                hint: "",
                control: desc_contriol,
                text: "Description",
                maxLine: 5,
              ),
              Row(
                children: [
                  FillCustomButton(press: (){}, label: "ADD")
                ],
              ),
              Row(
                children: [
                  OutlineCustomButton(press: (){}, label: "DELETE")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
