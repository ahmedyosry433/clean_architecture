import 'package:clean_architecture/core/databases/api/end_points.dart';
import 'package:clean_architecture/features/users/data/models/sub_models/address_model.dart';
import 'package:clean_architecture/features/users/data/models/sub_models/company_model.dart';
import 'package:clean_architecture/features/users/domain/entities/user_entities.dart';

class UserModel extends UserEntity {
  final int id;
  final String userName;
  final String website;
  final CompanyModel company;

  UserModel({
    required this.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required this.userName,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json[ApiKey.id],
        name: json[ApiKey.name],
        phone: json[ApiKey.phone],
        email: json[ApiKey.email],
        userName: json[ApiKey.username],
        website: json[ApiKey.website],
        address: AddressModel.fromJson(json[ApiKey.address]),
        company: CompanyModel.fromJson(json[ApiKey.company]));
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.phone: phone,
      ApiKey.email: email,
      ApiKey.username: userName,
      ApiKey.website: website,
      ApiKey.address: address,
      ApiKey.company: company,
    };
  }
}
