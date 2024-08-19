import 'package:http/http.dart' as http;

import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exceptions/product_exceptions.dart';
import '../../domain/entities/user_entity.dart';

abstract class RemoteAuthDataSource {
  Future<bool> logIn(UserEntity user);
  Future<bool> signUp(UserEntity user);
}

class RemoteAuthDataSourceImpl extends RemoteAuthDataSource {
  final http.Client client;

  RemoteAuthDataSourceImpl({required this.client});

  @override
  Future<bool> logIn(UserEntity user) async {
    try {
      final result = await client.post(Uri.parse(AppData.logInUser),
          body: {'email': user.email, 'password': user.password},
          headers: AppData.jsonHeader);
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ServerException();
      }
    } on ServerException {
      throw ServerException();
    }
  }

  @override
  Future<bool> signUp(UserEntity user) async {
    try {
      final result = await client.post(Uri.parse(AppData.registerUser),
          body: {
            'name': user.name,
            'email': user.email,
            'password': user.password
          },
          headers: AppData.jsonHeader);
      if (result.statusCode == 200) {
        return true;
      } else {
        throw ServerException();
      }
    } on ServerException {
      throw ServerException();
    }
  }
}
