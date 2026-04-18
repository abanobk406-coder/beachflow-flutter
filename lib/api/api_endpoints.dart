class ApiEndpoints {
  static const String baseUrl =
      'https://beachflow-app-final-production.up.railway.app/';
  static const String loginApi = 'api/auth/login';

  static const String forgetPasswordApi = 'api/auth/forgot-password';
  static const String resetCodeApi = 'api/auth/verify-reset-code';

  static const String resetPasswordApi = 'api/auth/reset-password';
  static const String resendOtpApi = 'api/auth/resend-otp';
  static const String getProfileApi = 'api/users/profile';
  static const String editProfileApi = 'api/users/edit-profile';
  static const String favoritesApi = 'api/favorites';
  static const String toggleFavoriteApi = 'api/favorites/toggle';
  static const String myNotificationsApi = 'api/notifications/my-notifications';
  static const String myBookingsApi = 'api/bookings/my-bookings';
  static const String requestAdminApi = 'api/users/request-admin';
}
