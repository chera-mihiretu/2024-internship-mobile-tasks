import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';



class TestingDatas {

  static const testDataEntity = ProductEntity(
    id: '6672752cbd218790438efdb0',
    name: 'Anime website',
    description: 'Explore anime characters.',
    price: 123,
    imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
  );

  static const testDataModel = ProductModel(
    id: '6672752cbd218790438efdb0',
    name: 'Anime website',
    description: 'Explore anime characters.',
    price: 123,
    imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
  );


  static String readJson() {
    String dir = Directory.current.path;
    if(dir.contains('/test')){
      dir = dir.replaceAll('/test', '');
    }

    dir = '$dir/test/test_helper/testing_datas/single_api_response_data.json';



     return File(dir).readAsStringSync();
  }
}

void main(){
  debugPrint(json.decode(TestingDatas.readJson()).toString());
}
