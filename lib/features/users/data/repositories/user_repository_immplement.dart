import 'package:clean_architecture/core/errors/expentions.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_architecture/core/connection/network_info.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/params/params.dart';
import 'package:clean_architecture/features/users/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/users/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture/features/users/domain/entities/user_entities.dart';
import 'package:clean_architecture/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImmplementation extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImmplementation({
    required this.networkInfo,
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser(
      {required UserParams userParams}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser =
            await userRemoteDataSource.getUser(userParam: userParams);
        userLocalDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await userLocalDataSource.getCachedUser();
        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
