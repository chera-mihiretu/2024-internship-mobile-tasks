import '../../../../core/constants/constants.dart';
import '../../../../core/errors/exceptions/product_exceptions.dart';
import '../../../../core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_source/remote_auth_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RemoteAuthDataSource remoteAuthDataSource;

  AuthRepositoryImpl({required this.remoteAuthDataSource});

  @override
  Future<Either<Failure, bool>> logIn(UserEntity user) async {
    try {
      final result = await remoteAuthDataSource.logIn(user);
      if (result) {
        return const Right(true);
      } else {
        return Left(ServerFailure(AppData.getMessage(AppData.serverError)));
      }
    } on ServerException {
      return Left(ServerFailure(AppData.getMessage(AppData.serverError)));
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(UserEntity user) async {
    try {
      final result = await remoteAuthDataSource.signUp(user);
      if (result) {
        return const Right(true);
      } else {
        return Left(ServerFailure(AppData.getMessage(AppData.serverError)));
      }
    } on ServerException {
      return Left(ServerFailure(AppData.getMessage(AppData.serverError)));
    }
  }
}
