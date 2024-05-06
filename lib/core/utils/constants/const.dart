class Const {
  final String dummyString = 'Welcome to democracy app';
  final String drawerBackgroundImg = "assets/images/drawer/drawer_back_img.svg";
  final String profilePicture = "assets/images/drawer/profile_picture.svg";
  final String profileImage = "assets/images/drawer/profile_img.png";

  // Drawer Icons
  final String profileIc = "assets/icons/drawer_ic/profile_ic.svg";
  final String enrolledContestsIc =
      "assets/icons/drawer_ic/enrolled_contests_ic.svg";
  final String aboutUsIc = "assets/icons/drawer_ic/about_us_ic.svg";
  final String contactUsIc = "assets/icons/drawer_ic/contact_ic.svg";
  final String notificationSettingsIc =
      "assets/icons/drawer_ic/notification_ic.svg";
  final String shareTheAppIc = "assets/icons/drawer_ic/share_ic.svg";
  final String faqIc = "assets/icons/drawer_ic/faq_ic.svg";
  final String privacyPolicyIc = "assets/icons/drawer_ic/tnc_ic.svg";
  final String logoutIc = "assets/icons/drawer_ic/logout_ic.svg";
  final String locationIc = "assets/icons/drawer_ic/location_ic.svg";
  final String deleteAcIc = "assets/icons/drawer_ic/delete_ac_ic.svg";
  final String uploadIC = "assets/icons/drawer_ic/upload_ic.svg";
  final String blankIC = "assets/icons/drawer_ic/blank_ic.svg";
  final String presentIC = "assets/icons/drawer_ic/present_ic.svg";
  final String calendarIC = "assets/icons/drawer_ic/calendar_ic.svg";
  final String genderIC = "assets/icons/drawer_ic/gender_ic.svg";
  final String editIC = "assets/icons/drawer_ic/edit_ic.svg";
  final String userBlockIC = "assets/icons/drawer_ic/user_block_ic.svg";
  final String plusIC = "assets/icons/drawer_ic/plus_ic.svg";
  final String cancelIC = "assets/icons/drawer_ic/cancel_ic.svg";
  final String dropDownIC = "assets/icons/drawer_ic/drop_down_ic.svg";
  final String defaultImage = "assets/images/empty_state/default_image.png";
  final String bannerDefaultImage =
      "assets/images/empty_state/banner_default_image.png";
  final String crossIC = "assets/icons/suggest_question/cross.svg";
  final String profileBackgroundImg =
      "assets/images/drawer/profile_background_img.svg";
  final String uploadIc = "assets/icons/general/upload_image.svg";
  final String cameraIc = "assets/icons/general/camera.svg";
  final String galleryIc = "assets/icons/general/gallery_pic.svg";

  final String userProfilePic = "assets/images/drawer/user_profile_pic.png";
  final String userProfilePicPlaceholder =
      "assets/images/drawer/user_profile_pic_placeholder.png";

  //Basic auth credentials
  static const String username = 'admin';
  static const String password = 'mypcot';
  static const String acceptedLanguage = 'en';
  static const String uuid = '1234';

  //Base URL
  static const String baseUrl =
      'http://skyonliners.com/demo/democracy-apis/webservices/v1/';

  static const String pincodeApiURL = "https://api.postalpincode.in/";

  /*----------------------------*/
  /*API Sub URLs*/
  /*----------------------------*/
  static const String login = 'register_api';
  static const String validateOtp = 'validate_otp';
  static const String aboutUs = 'policies';
  static const String profile = 'users/me';
  static const String resendOtp = 'resend_otp';
  static const String privacy = 'policies';
  static const String startupApi = 'startup_api';
  static const String contactUsCreateApi = 'contact/create';
  static const String updateFcmToken = 'notification_token/update';
  static const String stateList = 'state/list';
  static const String cityList = 'city/list';
  static const String pincode = 'pincode';
  static const String updateProfile = 'users/update';
  static const String notificationStatus = 'users/notification/status';
  static const String logout = 'users/logout';
  static const String delete = 'users/delete';
  static const String enrolledContestApi = 'contest/enrolled_contest';
  static const String contestPlayingApi = 'contest/start_playing';
  static const String suggestQuestion = 'suggest_question';
  static const String faq = 'faqs/list';
  static const String contactUsDetails = 'contact/show';
  static const String updateAddress = 'users/address/update';
  static const String createContestAnswer = 'contest_answer/create';
  static const String contestAnswerDetails = 'home/contest_answer_details';
  static const String homeList = 'home/list';
  static const String contestDetails = 'contest/show';
  static const String enrolledContest = 'contest/enrolling';
  static const String contestResultDetails = 'home/contest_result_details';
  static const String contestListing = 'contest/list';
  static const String notificationListing = 'notification/list';
}
