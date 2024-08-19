import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_events.dart';
import '../widgets/product_list_displayer.dart';
import '../widgets/search_available.dart';
import '../widgets/user_info.dart';
import 'add_product_page.dart';

class ProductListPage extends StatelessWidget {
  static String routes = '/product_list_page';
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductBloc>(context).add(LoadAllProductEvents());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddProductPage.routes);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            UserInfo(
              userName: 'Yohannes',
              day: 'July 14, 2023',
            ),
            SearchNavigator(),
            //ProductListDisplayer(),
          ],
        ),
      ),
    );
  }
}
