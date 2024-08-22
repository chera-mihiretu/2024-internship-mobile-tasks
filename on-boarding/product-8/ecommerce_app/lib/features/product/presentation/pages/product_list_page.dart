import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/page/login_page.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_events.dart';
import '../widgets/product_widgets.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            UserInfo(
              iconPres: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout.'),
                        actions: [
                          FillCustomButton(
                              press: () {
                                Navigator.pop(context);
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              label: 'Logout')
                        ],
                      );
                    });
              },
              userName: 'Yohannes',
              day: 'July 14, 2023',
            ),
            const SearchNavigator(),
            const ProductListDisplayer(),
          ],
        ),
      ),
    );
  }
}
