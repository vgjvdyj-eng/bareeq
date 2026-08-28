class AppConstants {
  static const String appName = 'بريق';
  static const String appSubtitle = 'Bareeq';
  static const String appDescription = 'منصة تربط بين المستضيفين ومقدمي الخدمات';

  static const Map<String, double> serviceMinimumPrices = {
    'car_cleaning': 30.0,
    'car_deep_cleaning': 40.0,
    'home_cleaning': 50.0,
    'ac_cleaning': 35.0,
    'sofa_carpet_cleaning': 45.0,
    'garden_cleaning': 40.0,
    'pool_cleaning': 60.0,
    'shop_office_cleaning': 55.0,
  };

  static const double paddingXSmall = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusXLarge = 16.0;

  static const Duration animationDurationShort = Duration(milliseconds: 200);
  static const Duration animationDurationMedium = Duration(milliseconds: 400);
  static const Duration animationDurationLong = Duration(milliseconds: 600);

  static const Duration splashDuration = Duration(seconds: 3);
}
