import 'dart:io';

import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:ecommerce_app/core/network/custom_data_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../test_helper/test_helper_generation.mocks.dart';

void main(){
  late DataConnectionChecker dataConnectionChecker;
  late MockHttpClient mockHttpClient;

  setUp((){
    mockHttpClient = MockHttpClient();
    dataConnectionChecker = DataConnectionChecker(mockHttpClient);
  });


  group('Checking the working of Custom Data Connection Checker', (){
    test('Should return true when there is connection', () async {
      /// arrange
      when(
          mockHttpClient.get(Uri.parse(AppData.testUrl))
      ).thenAnswer((_) async => http.Response('result', 200));
      ///action
      final result = await dataConnectionChecker.hasConnection(AppData.testUrl);
      ///assert
      verify(mockHttpClient.get(Uri.parse(AppData.testUrl)));
      expect(result, true);
    });
    test('Should return false when the status code is not 200', () async {
      /// arrange
      when(
          mockHttpClient.get(Uri.parse(AppData.testUrl))
      ).thenAnswer((_) async => http.Response("result", 404));
      ///action
      final result = await dataConnectionChecker.hasConnection(AppData.testUrl);
      ///assert
      verify(mockHttpClient.get(Uri.parse(AppData.testUrl)));
      expect(result, false);
    });

    test('Should return false when exception is thrown', () async {
      /// arrange
      when(
          mockHttpClient.get(Uri.parse(AppData.testUrl))
      ).thenThrow(const SocketException('Failed'));
      ///action
      final result = await dataConnectionChecker.hasConnection(AppData.testUrl);
      ///assert
      verify(mockHttpClient.get(Uri.parse(AppData.testUrl)));
      expect(result, false);
    });
  });

}