import 'package:clean_architecture/core/databases/api/api_consumer.dart';
import 'package:clean_architecture/core/databases/api/end_points.dart';
import 'package:clean_architecture/core/params/params.dart';
import 'package:clean_architecture/features/users/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});

  Future<UserModel> getUser({required UserParams userParam}) async {
    final response = await api.get(EndPoints.user + userParam.id);
    return UserModel.fromJson(response);
  }
}
