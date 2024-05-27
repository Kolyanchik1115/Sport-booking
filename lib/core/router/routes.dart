class AppRoutes {
  AppRoutes._();

  static const String splashPage = '/';

  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';

  static const String search = '/search';
  static const String favorites = '/favorites';
  static const String reservation = '/reservation';
  static const String mainProfile = '/main_profile';

  static const String editProfile = '/edit_profile';
  static const String facilityDetails = '/facility_details';
  static const String facilityBooking = '/facility_booking';
  static const String confirmBooking = '/confirm_booking';

  static const String facilitiesMap = '/facilities_map';
  static const String payment = '/payment';

  //DEEP LINKS
  static const String deepLinkEmailConfirmation = '/link/email-confirmation';
  static const String deepLinkFacilityDetails = '/link/facility/:id';

}
