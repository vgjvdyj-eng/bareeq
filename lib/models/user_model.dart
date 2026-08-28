import 'enums.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String profileImage;
  final UserRole role;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? identityImage;
  final RescuerVerificationStatus? verificationStatus;
  final double? rating;
  final int? completedRequests;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImage,
    required this.role,
    required this.createdAt,
    this.updatedAt,
    this.identityImage,
    this.verificationStatus,
    this.rating,
    this.completedRequests,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      profileImage: json['profileImage'] as String,
      role: UserRole.values[json['role'] as int],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
      identityImage: json['identityImage'] as String?,
      verificationStatus: json['verificationStatus'] != null ? RescuerVerificationStatus.values[json['verificationStatus'] as int] : null,
      rating: json['rating'] as double?,
      completedRequests: json['completedRequests'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'profileImage': profileImage,
    'role': role.index,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'identityImage': identityImage,
    'verificationStatus': verificationStatus?.index,
    'rating': rating,
    'completedRequests': completedRequests,
  };

  bool get isRescuerApproved => role == UserRole.rescuer && verificationStatus == RescuerVerificationStatus.approved;
  bool get isRescuerPending => role == UserRole.rescuer && verificationStatus == RescuerVerificationStatus.pending;
}
