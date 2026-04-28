import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? profilePhoto;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.profilePhoto,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profilePhoto: json['profile_photo_url'] ?? json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profile_photo_url': profilePhoto,
    };
  }

  @override
  List<Object?> get props => [id, name, email, profilePhoto];
}
