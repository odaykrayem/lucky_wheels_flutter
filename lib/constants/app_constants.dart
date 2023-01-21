class AppConstants {
  static const String appName = 'LuckyWheels';
  static const int appVersion = 1;

  // static const String BASE_URL =
  //     'http://192.168.43.130/mvs.bslmeiyu.com/public';
  // static const String BASE_URL = 'http://192.168.43.130:8000';
  static const String BASE_URL = 'http://192.168.1.107:8000';

  static const String UPLOAD_URL = '/uploads/';

  //User And Auth Endpoints
  static const String REGISTRATION_URI = '/api/auth/register';
  static const String LOGIN_URI = '/api/auth/login';
  static const String WHEEL_POINTS_URI = '/api/v1/wheel_points';
  static const String CONTEST_LIST = '/api/v1/contest_list';
  static const String REWARD_LIST = '/api/v1/reward_list';
  static const String PARTICIPATE_CONTEST = '/api/v1/participants';
  static const String MIN_POINTS = '/api/v1/get_min_points';
  static const String MIN_BALANCE = '/api/v1/get_min_balance';
  static const String TRANSFER_POINTS = '/api/v1/transfer_points';
  static const String WITHDRAW_BALANCE = '/api/v1/withdraw_balance';
  static const String REWARD = '/api/v1/reward';

  static const String USER_INFO_URI = '/api/v1/user_info';

  static const String TOKEN = 'DBToken';
  static const String PHONE = 'phone';
  static const String PASSWORD = 'password';

  static const String LANGUAGE_CODE_KEY = 'languageCode';
  static const String COUNTRY_CODE_KEY = 'countryCode';
  static const String CART_LIST_KEY = 'cart-list';
  static const String CART_HISTORY_LIST_KEY = 'cart-history-list';
  static const String USER_DATA_KEY = 'user-data';
  static const String USER_TOKEN_KEY = 'user-token';
}
