import 'enums.dart';

class RequestModel {
  final String id;
  final String hostId;
  final String? rescuerId;
  final ServiceType serviceType;
  final String description;
  final String location;
  final DateTime requestedDate;
  final String requestedTime;
  final double offeredPrice;
  final double minimumPrice;
  final RequestStatus status;
  final DateTime createdAt;
  final DateTime? completedAt;

  const RequestModel({
    required this.id,
    required this.hostId,
    this.rescuerId,
    required this.serviceType,
    required this.description,
    required this.location,
    required this.requestedDate,
    required this.requestedTime,
    required this.offeredPrice,
    required this.minimumPrice,
    required this.status,
    required this.createdAt,
    this.completedAt,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'] as String,
      hostId: json['hostId'] as String,
      rescuerId: json['rescuerId'] as String?,
      serviceType: ServiceType.values[json['serviceType'] as int],
      description: json['description'] as String,
      location: json['location'] as String,
      requestedDate: DateTime.parse(json['requestedDate'] as String),
      requestedTime: json['requestedTime'] as String,
      offeredPrice: json['offeredPrice'] as double,
      minimumPrice: json['minimumPrice'] as double,
      status: RequestStatus.values[json['status'] as int],
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] != null ? DateTime.parse(json['completedAt'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'hostId': hostId,
    'rescuerId': rescuerId,
    'serviceType': serviceType.index,
    'description': description,
    'location': location,
    'requestedDate': requestedDate.toIso8601String(),
    'requestedTime': requestedTime,
    'offeredPrice': offeredPrice,
    'minimumPrice': minimumPrice,
    'status': status.index,
    'createdAt': createdAt.toIso8601String(),
    'completedAt': completedAt?.toIso8601String(),
  };

  bool get isPriceValid => offeredPrice >= minimumPrice;
  String get serviceName => serviceType.displayName;
  String get serviceEmoji => serviceType.emoji;
}
