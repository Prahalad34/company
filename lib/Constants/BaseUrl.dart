class BaseUrl {
 //static String url = "http://grocetrip.codemeg.com/app/";
 static String url = "https://dev.codemeg.com/yak-taxi/api/";
 // static String url = "http://192.168.1.50:3000/app/";
 static String googleUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?";

  /// --------------------------- Post -------------------------- ///

  static var login = "${url}sendOTP";
  static var verifyOtp = "${url}verify_otp";
  static var resendOtp = "${url}resend_otp";
  static var updateDocument = "${url}update_Document";
  static var updateProfileImg = "${url}update-profile-img";
  static var updateUser = "${url}update-user";



  /// --------------------------- Get -------------------------- ///

  static String getSupermarket ="get-brand?";



}
