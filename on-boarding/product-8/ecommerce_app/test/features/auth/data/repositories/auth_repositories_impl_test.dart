import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:ecommerce_app/core/errors/exceptions/product_exceptions.dart';
import 'package:ecommerce_app/core/errors/failures/failure.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_helper/auth_test_data/testing_data.dart';
import '../../../../test_helper/test_helper_generation.mocks.dart';

void main() {
  late MockRemoteAuthDataSource mockRemoteAuthDataSource;
  late AuthRepositoryImpl authRepositoryImpl;
  setUp(() {
    mockRemoteAuthDataSource = MockRemoteAuthDataSource();
    authRepositoryImpl =
        AuthRepositoryImpl(remoteAuthDataSource: mockRemoteAuthDataSource);
  });

  group('logIn test', () {
    test('Should return Right true when eth go smooth', () async {
      /// arrange
      when(mockRemoteAuthDataSource.logIn(any)).thenAnswer((_) async => true);

      /// action
      final result = await authRepositoryImpl.logIn(AuthData.userEntity);

      /// assert
      expect(result, const Right(true));
    });
    test('Should return Left on failure', () async {
      /// arrange
      when(mockRemoteAuthDataSource.logIn(any)).thenThrow(ServerException());

      /// action
      final result = await authRepositoryImpl.logIn(AuthData.userEntity);

      /// assert
      expect(
          result, Left(ServerFailure(AppData.getMessage(AppData.serverError))));
    });
  });

  group('SignUp  test', () {
    test('Should return Right true when eth go smooth register', () async {
      /// arrange
      when(mockRemoteAuthDataSource.signUp(any)).thenAnswer((_) async => true);

      /// action
      final result = await authRepositoryImpl.signUp(AuthData.userEntity);

      /// assert
      expect(result, const Right(true));
    });
    test('Should return Left on failure register', () async {
      /// arrange
      when(mockRemoteAuthDataSource.signUp(any)).thenThrow(ServerException());

      /// action
      final result = await authRepositoryImpl.signUp(AuthData.userEntity);

      /// assert
      expect(
          result, Left(ServerFailure(AppData.getMessage(AppData.serverError))));
    });
  });
}
