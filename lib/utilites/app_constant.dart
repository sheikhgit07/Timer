//constant key

class AppConstant {
  // API BASE URL
  // static const String baseUrl = "";
  static const String baseUrl = "https://kumarkia.in/wellbe/api/";
  static const String apiKey = "156c4675-9608-4591-b2ec-427503464aac";
  //authentication
  static const String register = "register";

  static const String login = "login";
  static const String logout = "logout";
  static const String updateProfile = "update-profile";
  static const String changePassword = "change-password";

  static const String addUserBreathIn = "add-user-breathin";
  static const String addUserAcademic = "add-user-academic";
  static const String addMoodTracker = "add-mood-tracker";

  static const String verifyOtp = "verify-otp";
  static const String resendOtp = "resend-otp";
  static const String forgotPassword = "forgot-password";
  static const String getUserInfo = "get-user-info";
  // moods
  static const String getAllMoods = "get-all-moods";
  static const String getAllSubMoods = "get-all-sub-moods";
  static const String getVideoMoodBase = "get-video-mood-based";
  static const String getAllQuestion = "get-all-question";
  static const String getMoodToday = "get-mood-today";
  static const String getMoodWeek = "get-mood-week";
  static const String getMoodMonth = "get-mood-month";
  static const String getMoodDataRange = 'get-mood-daterange';
  static const String addUserVideo = 'add-user-video';
  static const String addUserAudio = 'add-user-audio';

  //appointment
  static const String getDoctors = 'get-doctors';
  static const String addAppointment = 'add-appointment';
  static const String getExpertise = 'get-expertise';
  static const String getLanguages = 'get-languages';
  static const String getAvailableType = 'get-available-type';
  static const String getCouponCodeDetails = 'get-coupon-code-details';

  static const String getAppointment = 'get-appointment';
  static const String addReview = 'add-review';

  //journal
  static const String getJournals = 'get-journals';
  static const String getUserJournalQuestionAnswer =
      'get-user-journal-question-answer';
  static const String addUserJournalQuestion = 'add-user-journal-question';
  static const String getJournalsQuestionById = 'get-journalsquestion-by-id';

  //podcasts
  static const String getPodcasts = 'get-podcasts';
  static const String getPodcastsByMoods = 'get-podcasts-by-mood';
  static const String addUserPodcast = 'add-user-podcast';

  //thoughts
  static const String getThoughts = 'get-thoughts';
  static const String getThoughtCategory = 'get-thought-category';
  static const String getThoughtsByCategory = 'get-thoughts-by-category';
  static const String getUserThoughts = 'get-user-thoughts';

  static const String addUserThoughts = 'add-user-thought';

  //Groups
  static const String whatsAppGroup = "whatsapp-group";

  //Template
  static const String templateAll = "whatsapp/template/all";
  static const String templateDetail = "whatsapp/template/";

  static const String realEstateMobileURI = "real-estate/mobile";
  static const String userNotificationURI = "user/change-notification";
  static const String userURI = "user/";
  static const String statusSecurity = "user/2fa-status";
  static const String sendOtp = "user/2fa-active";
  static const String verifyWhatsapp = "user/2fa-active/verify";
  static const String clearDevicesPut = "user/2fa/clear-devices";
  static const String clearDevicesDelete = "user/2fa/clear-devices";

  static const String darkMode = "user/dark-mode?dark-mode=";
  static const String customerURI = "user/customer";
  static const String carURI = "car/mobile";
  static const String carPostURI = 'car';
  static const String carPostSlugURI = 'car/slug/';
  static const String categoryURI = "category";
  static const String unitsURI = "units";
  static const String currencyURI = "currency";
  static const String attributeURI = "attribute";
  static const String tagsURI = "tags";
  static const String tagsAssocited = "tags/associated/";
  static const String facilityURI = "facility";
  static const String featureURI = "feature/associated/";
  static const String makeURI = "make";
  static const String makeAssociatedURI = "make/associated";
  static const String carVariantsURI = "car-variant/carModelId/";

  static const String userLanguage = 'user/language?language=';

  //   static var getNotifications = Uri.parse(baseUrl+"fcmNotification/user");
  // static var clearAllNotifications = Uri.parse(baseUrl+"fcmNotification/user/clear");
  // static var deleteFcmNotification= Uri.parse(baseUrl+"fcmNotification/user?notificationIds=");

  static const String userID = 'userID';
  static const String deviceID = 'deviceID';

  // static var logout = Uri.parse(baseUrl+"auth/logout");
  // Shared Key
  static const String theme = 'theme';
  static const String light = 'light';
  static const String dark = 'dark';
  static const String token = 'token';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String user = 'user';
  static const String userEmail = 'user_email';
  static const String userEmail2 = 'user_email2';
  static const String userPassword = 'user_password';

  static const String phoneNumber = 'phoneNumber';
  static const String cartList = 'cart_list';
  static const String getCart = 'cart/user/';
  static const String tablePoi = 'poi-tables/poi/';
  //static const String tableBarcode = '${baseUrl}poi-tables/table-poi-details';

  static const String SEARCH_ADDRESS = 'search_address';
  static const String currencyName = 'currencyName';
  static const String currencySymbol = 'currencySymbol';
  static const String muteStatus = 'muteStatus';
  static const String variant = 'variant';
  static const String onBoardingStatus = 'onBoardingStatus';

  // order status
  static const String created = 'CREATED';
  static const String pickedUP = 'PICKED_UP';
  static const String forDelivery = 'FOR_DELIVERY';
  static const String waiting = 'WAITING';
  static const String confirmed = 'CONFIRMED';
  static const String packed = 'PACKED';
  static const String completed = 'COMPLETED';
  static const String RETURNED = 'RETURN';
  static const String canceled = 'CANCELED';
  static const String problematic = 'PROBLEMATIC';
  static const String rejected = 'REJECTED';
  static const String onHold = 'ON_HOLD';
  static const String approved = 'APPROVED';
  static const String refused = 'REFUSED';

  //

  // static List<LanguageModel> languages = [
  //   LanguageModel(imageUrl: 'assets/flags/al.svg', languageName: 'Albanian', countryCode: 'AL', languageCode: 'sq'),
  //   LanguageModel(imageUrl: 'assets/flags/gr.svg', languageName: 'Greece', countryCode: 'GR', languageCode: 'el'),
  //   LanguageModel(imageUrl: 'assets/flags/it.svg', languageName: 'Italy', countryCode: 'IT', languageCode: 'it'),
  //   LanguageModel(imageUrl: 'assets/flags/us.svg', languageName: 'English', countryCode: 'US', languageCode: 'en'),
  // ];
// LanguageModel(imageUrl: 'assets/flags/gr.png', languageName: 'Greece', countryCode: 'GR', languageCode: 'el'),
}
