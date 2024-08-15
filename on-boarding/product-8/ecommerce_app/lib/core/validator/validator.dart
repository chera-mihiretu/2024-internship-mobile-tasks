import 'package:dartz/dartz.dart';

import '../constants/constants.dart';
import '../errors/failures/failure.dart';

class InputDataValidator {
  Either<Failure, bool> checkPrice(String input) {
    if (input.isEmpty) return const Right(true);
    int value = 0;
    try {
      value = int.parse(input);
      if (value < 0) {
        return Left(
            InvalidInputFailure(AppData.getMessage(AppData.negativePrice)));
      }
      return const Right(true);
    } on FormatException {
      return Left(InvalidInputFailure(
          AppData.getMessage(AppData.invalidPriceCharacter)));
    }
  }

  Either<Failure, bool> checkNameOrCatagory(String input) {
    if (input.isEmpty) return const Right(true);

    /// The name validator will goo here
    ///
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (nameRegExp.hasMatch(input)) {
      return const Right(true);
    } else {
      return Left(InvalidInputFailure(AppData.getMessage(AppData.invalidName)));
    }
  }
}
