enum UserRole { host, rescuer, admin }

enum ServiceType {
  carCleaning,
  carDeepCleaning,
  homeCleaning,
  acCleaning,
  sofaCarpetCleaning,
  gardenCleaning,
  poolCleaning,
  shopOfficeCleaning,
}

enum RequestStatus { pending, accepted, inProgress, completed, cancelled }

enum RescuerVerificationStatus { pending, approved, rejected, suspended }

extension ServiceTypeExtension on ServiceType {
  String get displayName {
    switch (this) {
      case ServiceType.carCleaning:
        return 'تنظيف السيارات';
      case ServiceType.carDeepCleaning:
        return 'تنظيف السيارات (عميق)';
      case ServiceType.homeCleaning:
        return 'تنظيف المنازل';
      case ServiceType.acCleaning:
        return 'تنظيف المكيفات';
      case ServiceType.sofaCarpetCleaning:
        return 'تنظيف الكنب والسجاد';
      case ServiceType.gardenCleaning:
        return 'تنظيف الحدائق';
      case ServiceType.poolCleaning:
        return 'تنظيف المسابح';
      case ServiceType.shopOfficeCleaning:
        return 'تنظيف المحلات والمكاتب';
    }
  }

  String get emoji {
    switch (this) {
      case ServiceType.carCleaning:
      case ServiceType.carDeepCleaning:
        return '🚗';
      case ServiceType.homeCleaning:
        return '🏠';
      case ServiceType.acCleaning:
        return '❄️';
      case ServiceType.sofaCarpetCleaning:
        return '🛋️';
      case ServiceType.gardenCleaning:
        return '🌳';
      case ServiceType.poolCleaning:
        return '🏊';
      case ServiceType.shopOfficeCleaning:
        return '🏢';
    }
  }

  double get minimumPrice {
    switch (this) {
      case ServiceType.carCleaning:
        return 30.0;
      case ServiceType.carDeepCleaning:
        return 40.0;
      case ServiceType.homeCleaning:
        return 50.0;
      case ServiceType.acCleaning:
        return 35.0;
      case ServiceType.sofaCarpetCleaning:
        return 45.0;
      case ServiceType.gardenCleaning:
        return 40.0;
      case ServiceType.poolCleaning:
        return 60.0;
      case ServiceType.shopOfficeCleaning:
        return 55.0;
    }
  }
}

extension RequestStatusExtension on RequestStatus {
  String get displayName {
    switch (this) {
      case RequestStatus.pending:
        return 'قيد الانتظار';
      case RequestStatus.accepted:
        return 'مقبول';
      case RequestStatus.inProgress:
        return 'قيد التنفيذ';
      case RequestStatus.completed:
        return 'مكتمل';
      case RequestStatus.cancelled:
        return 'ملغى';
    }
  }
}

extension RescuerVerificationStatusExtension on RescuerVerificationStatus {
  String get displayName {
    switch (this) {
      case RescuerVerificationStatus.pending:
        return 'قيد المراجعة';
      case RescuerVerificationStatus.approved:
        return 'موافق عليه';
      case RescuerVerificationStatus.rejected:
        return 'مرفوض';
      case RescuerVerificationStatus.suspended:
        return 'معلق';
    }
  }
}
