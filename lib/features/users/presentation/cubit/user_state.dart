part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class GetUserLoading extends UserState {}

final class GetUserSuccess extends UserState {
  final UserEntity user;

  GetUserSuccess(this.user);
}

final class GetUserFailure extends UserState {
  final String message;

  GetUserFailure(this.message);
}
