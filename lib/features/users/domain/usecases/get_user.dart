import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/features/users/domain/entities/user_entities.dart';
import 'package:clean_architecture/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final UserRepository userRepository;

  GetUser({required this.userRepository});
  Future<Either<Failure, UserEntity>> call() {
    return userRepository.getUser();
  }
}
