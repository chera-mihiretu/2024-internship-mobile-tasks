import 'package:ecommerce_app/core/platform/network_info.dart';
import 'package:ecommerce_app/features/product/data/data_resources/local_product_data_source.dart';
import 'package:ecommerce_app/features/product/data/data_resources/remote_product_data_source.dart';
import 'package:ecommerce_app/features/product/domain/repositories/product_repository.dart';
import 'package:mockito/annotations.dart';


@GenerateMocks(
  [
    ProductRepository,
    NetworkInfo,
    RemoteProductDataSource,
    LocalProductDataSource,
  ],
)

void main(){

}