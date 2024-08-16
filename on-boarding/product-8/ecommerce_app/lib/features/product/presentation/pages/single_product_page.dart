import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/themes.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_events.dart';
import '../bloc/product_states.dart';
import '../widgets/fill_custom_button.dart';
import '../widgets/outline_custom_button.dart';

// ignore: must_be_immutable
class SingleProduct extends StatelessWidget {
  static String routes = '/single_product';
  List<List<int>> size = [
    [1, 39],
    [0, 40],
    [0, 41],
    [0, 42],
    [0, 43],
    [0, 44],
    [0, -1]
  ];
  SingleProduct({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    const textStyle = TextStyle(
      fontFamily: 'poppins',
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<ProductBloc, ProductStates>(
          listener: (context, state) {
            if (state is SuccessfullState) {
              BlocProvider.of<ProductBloc>(context).add(LoadAllProductEvents());
              Navigator.pop(context);
            } else if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                  ),
                ),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  BlocBuilder<ProductBloc, ProductStates>(
                    builder: (context, state) {
                      if (state is LoadedSingleProductState) {
                        return Container(
                          height: 250,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: MyTheme.ecGrey,
                          ),
                          child: Image.network(
                            fit: BoxFit.fill,
                            state.productEntity.imageUrl,
                            loadingBuilder: (context, myChild, progress) {
                              if (progress == null) {
                                return myChild;
                              } else {
                                return const SizedBox();
                              }
                            },
                            errorBuilder: (context, exception, trace) {
                              return const SizedBox();
                            },
                          ),
                        );
                      } else if (state is ErrorState) {
                        return Container(
                          decoration:
                              const BoxDecoration(color: MyTheme.ecGrey),
                          height: 250,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              state.message,
                              style: const TextStyle(
                                color: MyTheme.ecRed,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          height: 250,
                          width: double.infinity,
                          decoration:
                              const BoxDecoration(color: MyTheme.ecGrey),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: IconButton(
                        onPressed: () {
                          BlocProvider.of<ProductBloc>(context)
                              .add(LoadAllProductEvents());
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.blue,
                        ),
                        style:
                            IconButton.styleFrom(backgroundColor: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<ProductBloc, ProductStates>(
                      builder: (context, state) {
                        if (state is LoadedSingleProductState) {
                          return Text(
                            state.productEntity.description,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontFamily: 'poppins',
                            ),
                          );
                        } else {
                          return const Text('...');
                        }
                      },
                    ),
                    const Wrap(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 184, 100),
                        ),
                        Text(
                          '(5.0)',
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: BlocBuilder<ProductBloc, ProductStates>(
                  builder: (context, state) {
                    if (state is LoadedSingleProductState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.productEntity.name,
                            style: const TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${state.productEntity.price}\$',
                            style: textStyle,
                          ),
                        ],
                      );
                    } else {
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '...',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '0\$',
                            style: textStyle,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  'Size:',
                  style: TextStyle(
                    fontFamily: 'poppins',
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
                        onTap: () {},
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: (size[index][0] == 0)
                                    ? Colors.white
                                    : MyTheme.ecBlue,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(11, 11, 11, 11),
                                      spreadRadius: 1,
                                      blurRadius: 2)
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              size[index][1].toString(),
                              style: TextStyle(
                                  color: (size[index][0] == 0)
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ))),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: BlocBuilder<ProductBloc, ProductStates>(
                  builder: (context, state) {
                    if (state is LoadedSingleProductState) {
                      return Text(
                        state.productEntity.description,
                        style: const TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 12,
                        ),
                      );
                    } else {
                      return const LinearProgressIndicator();
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlineCustomButton(
                      press: () {
                        final result =
                            BlocProvider.of<ProductBloc>(context).state;
                        if (result is LoadedSingleProductState) {
                          String id = result.productEntity.id;
                          BlocProvider.of<ProductBloc>(context)
                              .add(DeleteProductEvent(id: id));
                        }
                      },
                      label: 'DELETE',
                    ),
                    FillCustomButton(press: () {}, label: 'ADD'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
