import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/product/data/data_resources/local_product_data_source.dart';
import 'package:ecommerce_app/features/product/data/data_resources/remote_product_data_source.dart';
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks(
  [
    ProductRepository,
    NetworkInfo,
    RemoteProductDataSource,
    LocalProductDataSource,
    InternetConnectionChecker,
    SharedPreferences,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)

void main(){

}