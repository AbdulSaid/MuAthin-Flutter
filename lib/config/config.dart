import 'dart:ui';

class Config {
  // General
  static Color pColor = Color(0xFF487EB0);
  static Color sColor = Color(0xFF2F3640);
  static Color bgColor = Color(0xFFF5F6FA);

  static List<String> categories = ['Fajr', 'Thuhr', 'Asr', 'Maghreb', 'Isha'];

  // Permissions
  static String permissions = 'permissions';
  static String permissionCamera = 'permission-camera';
  static String permissionGallery = 'permission-gallery';
  static String permissionLocation = 'permission-location';
  static String permissionAddressIndex = 'permission-address-index';

  // Assets Paths
  static String pathIconGallery = 'lib/assets/images/icon-gallery.png';
  static String pathUploadPhoto = 'lib/assets/images/upload-photo.png';
  static String pathPlaceholderUser = 'lib/assets/images/placeholder-profile.png';
  static String pathNoProducts = 'lib/assets/images/no-products.png';
  static String pathGradient = 'lib/assets/images/gradient.png';

  // Database Ref
  static String alerts = 'alerts';
  static String chats = 'chats';
  static String messages = 'messages';
  static String orders = 'orders';
  static String mosques = 'mosques';
  static String productsGeoFire = 'Products-GeoFire';
  static String requests = 'requests';
  static String users = 'users';
}