import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/themes.dart';
import 'dependency_injection.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/pages/product_list_page.dart';

void main() async {
  WidgetsFlutterBinding().ensureSemantics();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProductBloc>(),
      child: MaterialApp(
        theme: MyTheme.lightTheme,
        home: const Scaffold(),
        routes: {
          ProductListPage.routes: (context) => const ProductListPage(),
        },
        initialRoute: ProductListPage.routes,
      ),
    );
  }
}
