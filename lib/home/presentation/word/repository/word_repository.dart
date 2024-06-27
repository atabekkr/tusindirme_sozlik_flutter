import '../../../../data/data_provider.dart';
import '../../../../data/model/daily_word_model.dart';

class WordRepository {
  DataProvider dataProvider = DataProvider();

  Future<Word> getWordById(String wordId) async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "https://api.tusindirmesozlik.uz/api/all-words/$wordId");
      if (response.statusCode == 200) {
        Word word = DailyWordModel.fromRawJson(response.body).data!;
        return word;
      } else {
        throw "Error loading product";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Word>> getSearchResult(String searchText) async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "https://api.tusindirmesozlik.uz/api/get-all-words?$searchText");
      if (response.statusCode == 200) {
        List<Word> words = SearchResultModel.fromRawJson(response.body).words!;
        return words;
      } else {
        throw "Error loading product";
      }
    } catch (e) {
      rethrow;
    }
  }

}