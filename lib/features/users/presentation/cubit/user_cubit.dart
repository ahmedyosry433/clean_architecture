// ignore_for_file: depend_on_referenced_packages

import 'package:clean_architecture/core/connection/network_info.dart';
import 'package:clean_architecture/core/databases/api/dio_consumer.dart';
import 'package:clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:clean_architecture/core/params/params.dart';
import 'package:clean_architecture/features/users/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/users/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture/features/users/data/repositories/user_repository_immplement.dart';
import 'package:clean_architecture/features/users/domain/entities/user_entities.dart';
import 'package:clean_architecture/features/users/domain/usecases/get_user.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  eitherFailuerOrUser(int id) async {
    emit(GetUserLoading());
    final failuerOrUser = await GetUser(
      userRepository: UserRepositoryImmplementation(
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        userRemoteDataSource:
            UserRemoteDataSource(api: DioConsumer(dio: Dio())),
        userLocalDataSource: UserLocalDataSource(
          cacheHelper: CacheHelper(),
        ),
      ),
    ).call(
      userParams: UserParams(id: id.toString()),
    );
    failuerOrUser.fold(
      (failuer) => emit(GetUserFailure(failuer.errMessage)),
      (user) => emit(GetUserSuccess(user)),
    );
  }
}
