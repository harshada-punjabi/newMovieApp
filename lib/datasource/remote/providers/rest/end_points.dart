import 'package:newfluttermovieapp/presentation/utils/strings.dart';

class Endpoint {

  static const POPULAR_MOVIE = '${StaticStrings.popularRequestTag}${StaticStrings.apiKeyRequestTag}'
      '${StaticStrings.theMovieBbApiKey}${StaticStrings.languageRequestTag}'
      '${StaticStrings.pageRequestTag}';

  static const MOVIE_TRAILER = '${StaticStrings.videosRequestTag}${StaticStrings.apiKeyRequestTag}'
      '${StaticStrings.theMovieBbApiKey}${StaticStrings.languageRequestTag}';


}
