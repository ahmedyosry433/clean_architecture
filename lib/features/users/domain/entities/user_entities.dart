import 'package:clean_architecture/features/users/domain/entities/sub_entities/address_entity.dart';

class UserEntity {
  final String name;
  final String phone;
  final String email;
  final AddressEntity adress;
  UserEntity({
    required this.name,
    required this.phone,
    required this.email,
    required this.adress,
  });
}
