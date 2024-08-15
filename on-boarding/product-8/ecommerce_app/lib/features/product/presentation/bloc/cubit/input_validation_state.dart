part of 'input_validation_cubit.dart';

sealed class InputValidationState extends Equatable {
  final bool name;
  final bool catagory;
  final bool price;
  String? nameMessage;
  String? catagoryMessage;
  String? priceMessage;
  InputValidationState(
      {required this.name,
      required this.catagory,
      required this.price,
      this.nameMessage,
      this.catagoryMessage,
      this.priceMessage});

  @override
  List<Object> get props => [name, catagory, price];
}

final class InputValidationInitial extends InputValidationState {
  InputValidationInitial() : super(name: true, catagory: true, price: true);
}

// ignore: must_be_immutable
final class InputValidatedState extends InputValidationState {
  @override
  // ignore: overridden_fields
  final bool name;
  @override
  // ignore: overridden_fields
  final bool catagory;
  @override
  // ignore: overridden_fields
  final bool price;
  @override
  // ignore: overridden_fields
  String? nameMessage;
  @override
  // ignore: overridden_fields
  String? catagoryMessage;
  @override
  // ignore: overridden_fields
  String? priceMessage;
  InputValidatedState(
      {required this.name,
      required this.catagory,
      required this.price,
      this.nameMessage,
      this.catagoryMessage,
      this.priceMessage})
      : super(name: name, catagory: catagory, price: price);
  List<dynamic> getState(String type) {
    Map<String, List<dynamic>> correspond = {
      'Name': [name, nameMessage],
      'Price': [price, priceMessage],
      'Catagory': [catagory, catagoryMessage]
    };
    if (!correspond.containsKey(type)) {
      return [true, ''];
    } else {
      return correspond[type]!;
    }
  }
}
