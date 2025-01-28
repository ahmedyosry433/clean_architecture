import 'dart:convert';

import 'package:clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:clean_architecture/core/errors/expentions.dart';
import 'package:clean_architecture/features/users/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cacheHelper;
  UserLocalDataSource({required this.cacheHelper});
  final String key = "CachedUser";

  void cacheUser(UserModel? userToCache) {
    if (userToCache != null) {
      cacheHelper.saveData(
        key: key,
        value: json.encode(
          userToCache.toJson(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<UserModel> getCachedUser() async {
    final cachedData = cacheHelper.getDataString(key: key);

    if (cachedData != null) {
      return Future.value(UserModel.fromJson(json.decode(cachedData)));
    } else {
      throw CacheExeption(errorMessage: "No cached user data");
    }
  }
}
