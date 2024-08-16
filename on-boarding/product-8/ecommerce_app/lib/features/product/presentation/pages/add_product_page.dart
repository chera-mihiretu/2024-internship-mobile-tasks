import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failures/failure.dart';
import '../bloc/cubit/input_validation_cubit.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_events.dart';
import '../bloc/product_states.dart';
import '../widgets/app_bar.dart';
import '../widgets/costum_input.dart';
import '../widgets/fill_custom_button.dart';
import '../widgets/image_pick.dart';
import '../widgets/outline_custom_button.dart';

class AddProductPage extends StatelessWidget with AppBars {
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController catagoryControl = TextEditingController();
  final TextEditingController priceControl = TextEditingController();
  final TextEditingController descControl = TextEditingController();
  late InputValidationCubit myCubit;
  static const String routes = '/add_product_page';

  AddProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    myCubit = BlocProvider.of<InputValidationCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: normalAppBar('Add Product', () {
        Navigator.pop(context);
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<ProductBloc, ProductStates>(
            listener: (context, state) {
              if (state is SuccessfullState) {
                Navigator.pop(context);
              } else if (state is ErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Column(
              children: [
                const PickImage(),
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
                    Expanded(
                      child: FillCustomButton(
                          press: () {
                            final state =
                                BlocProvider.of<InputValidationCubit>(context)
                                    .state;
                            if (state is InputValidatedState) {
                              if (state.isValidated()) {
                                BlocProvider.of<ProductBloc>(context)
                                    .add(InsertProductEvent(
                                  name: nameControl.text,
                                  description: descControl.text,
                                  price: priceControl.text,
                                  imageUrl: state.imageUrl!,
                                ));

                                return;
                              }
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Invalid Input'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          label: 'ADD'),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            OutlineCustomButton(press: () {}, label: 'DELETE'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
