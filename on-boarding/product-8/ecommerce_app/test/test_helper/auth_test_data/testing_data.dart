import 'package:ecommerce_app/features/auth/data/model/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';

class AuthData {
  static const String name = 'Mr. User';
  static const String email = 'user@gmail.com';
  static const String password = 'userpassword';

  static const userEntity =
      UserEntity(name: name, email: email, password: password);
  static const userModel =
      UserModel(name: name, email: email, password: password);
}
