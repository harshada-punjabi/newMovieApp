class StaticStrings {
  StaticStrings._();

  static const String terms_eng = "https://cdn.lokofood.com/public/Docs/LOKOFOOD_TermsConditions_EN.htm";
  static const String terms_ro = "https://cdn.lokofood.com/public/Docs/LOKOFOOD_TermeniConditii_RO.htm";
  static const String privacy_eng = "https://cdn.lokofood.com/public/Docs/LOKOFOOD_PrivacyPolicy_EN.htm";
  static const String privacy_ro = "https://cdn.lokofood.com/public/Docs/LOKOFOOD_PoliticaConfidentialitate_RO.htm";

  ///Static Smtp host details
  static const String HOST = "smtp.office365.com";
  static const String PORT = "587";
  static const String USERNAME = "noreply@lokofood.com";
  static const String PASSWORD = "Soy16261";
  static const String FROM_ADDRESS = "noreply@lokofood.com";
  static const String FROM_NAME = "LOKOFOOD by Expressoft";
  static const String TO_ADDRESS = "contact@lokofood.com";

  static const String RECAPTCHA_KEY = "6LeiNM4aAAAAAE2aUPdP2oo-yR-IIDJK4_Thr9l7";
  static const String RECAPTCHA_SECRET = "6LeiNM4aAAAAAByFGsVQqUQaJ4sI6fgWlZVMRxxv";

  ///Static download from store links
  static const String APP_STORE = "https://apps.apple.com/us/app/lokofood/id1508498111#?platform=iphone";
  static const String PLAY_STORE = "https://play.google.com/store/apps/details?id=eu.expressoft.lokofood&hl=en&gl=US";

  static const String theMovieBbApiKey = "802b2c4b88ea1183e50e6b285a27696e";

  static const String baseUrl = "http://api.themoviedb.org/3/movie/";

  static const String imageAppendUrl = "https://image.tmdb.org/t/p/w185";

  static const String placeHolderImgPath = 'images/place_holder.png';

  static const String popularRequestTag = 'popular?';

  static const String apiKeyRequestTag = 'api_key=';

  static const String languageRequestTag = '&language=en-US';

  static const String pageRequestTag = '&page=';

  static const String videosRequestTag = '/videos?';

  static const String youtubeBaseUrl =
      'https://www.youtube.com/watch?v='; //'http://youtu.be/';

  static const SHARED_PREF_KEY_THEME = "theme_code";
}