import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exceptions/product_exceptions.dart';
import '../../domain/entities/token_entity.dart';
import '../model/token_model.dart';

class AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSource(this.sharedPreferences);

  Future<bool> saveToken(TokenModel token) async {
    try {
      await sharedPreferences.setString(AppData.tokenPlacement, token.token);
      return true;
    } on Exception {
      return false;
    }
  }

  Future<TokenModel> getToken() async {
    try {
      final result = sharedPreferences.getString(AppData.tokenPlacement);
      if (result == null) {
        throw CacheException();
      } else {
        return TokenModel(token: result);
      }
    } on Exception {
      throw CacheException();
    }
  }
}
