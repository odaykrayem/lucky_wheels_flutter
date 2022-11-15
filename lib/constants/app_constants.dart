class AppConstants {
  static const String appName = 'LuckyWheels';
  static const int appVersion = 1;

  static const String BASE_URL =
      'http://192.168.43.130/mvs.bslmeiyu.com/public';
  static const String POPULAR_PRODUCT_URI = '/api/v1/products/popular';
  static const String RECOMMENDED_PRODUCT_URI = '/api/v1/products/recommended';
  // static const String DRINKS_URI = '/api/v1/products/drinks';
  static const String UPLOAD_URL = '/uploads/';

  //User And Auth Endpoints
  static const String REGISTRATION_URI = '/api/v1/auth/register';
  static const String LOGIN_URI = '/api/v1/auth/login';
  static const String USER_INFO_URI = '/api/v1/customer/info';
  //new
  static const String USER_ADDRESS = 'user_address';
  static const String ADD_USER_ADDRESS = '/api/v1/customer/address/add';
  static const String ADDRESS_LIST_URI = '/api/v1/customer/address/list';
  static const String GEOCODE_URI = '/api/v1/config/geocode-api';

  static const String TOKEN = 'DBToken';
  static const String PHONE = 'phone';
  static const String PASSWORD = 'password';

  static const String LANGUAGE_CODE_KEY = 'languageCode';
  static const String COUNTRY_CODE_KEY = 'countryCode';
  static const String CART_LIST_KEY = 'cart-list';
  static const String CART_HISTORY_LIST_KEY = 'cart-history-list';
}
