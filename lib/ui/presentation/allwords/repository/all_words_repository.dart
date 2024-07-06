import 'package:tusindirme_sozlik_flutter/api_provider/api.dart';

import '../../../../data/model/daily_word_model.dart';

class AllWordsRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<Word>> getSearchResult(String searchText) async {
    return await _apiProvider.getSearchResult(searchText);
  }

  Future<List<Word>> getNewWords(int pageIndex) async {
    return await _apiProvider.fetchWords(pageIndex);
  }
}
