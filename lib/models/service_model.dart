import 'enums.dart';

class ServiceModel {
  final String id;
  final ServiceType type;
  final String name;
  final String emoji;
  final String description;
  final double minimumPrice;

  const ServiceModel({
    required this.id,
    required this.type,
    required this.name,
    required this.emoji,
    required this.description,
    required this.minimumPrice,
  });

  factory ServiceModel.fromType(ServiceType type) {
    return ServiceModel(
      id: type.index.toString(),
      type: type,
      name: type.displayName,
      emoji: type.emoji,
      description: _getDescription(type),
      minimumPrice: type.minimumPrice,
    );
  }

  static String _getDescription(ServiceType type) {
    switch (type) {
      case ServiceType.carCleaning:
        return 'تنظيف شامل للسيارة من الخارج والداخل';
      case ServiceType.carDeepCleaning:
        return 'تنظيف عميق وشامل أو للسيارات الكبيرة';
      case ServiceType.homeCleaning:
        return 'تنظيف شامل للمنزل والغرف';
      case ServiceType.acCleaning:
        return 'تنظيف وصيانة المكيفات والتكييف';
      case ServiceType.sofaCarpetCleaning:
        return 'تنظيف الأثاث والكنب والسجاد';
      case ServiceType.gardenCleaning:
        return 'تنظيف وتنسيق الحدائق والمساحات الخضراء';
      case ServiceType.poolCleaning:
        return 'تنظيف وصيانة حمامات السباحة';
      case ServiceType.shopOfficeCleaning:
        return 'تنظيف المحلات والمكاتب والمؤسسات';
    }
  }

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as String,
      type: ServiceType.values[json['type'] as int],
      name: json['name'] as String,
      emoji: json['emoji'] as String,
      description: json['description'] as String,
      minimumPrice: json['minimumPrice'] as double,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.index,
    'name': name,
    'emoji': emoji,
    'description': description,
    'minimumPrice': minimumPrice,
  };
}
