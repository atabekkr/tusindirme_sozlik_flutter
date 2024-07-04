import 'package:tusindirme_sozlik_flutter/data/model/popular_words_model.dart';

import '../../../../data/data_provider.dart';
import '../../../../data/model/daily_word_model.dart';

class HomeRepository {
  DataProvider dataProvider = DataProvider();

  Future<Word> getDailyWord() async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "https://api.tusindirmesozlik.uz/api/word-of-the-day");
      if (response.statusCode == 200) {
        Word dailyWord = DailyWordModel.fromRawJson(response.body).data!;
        return dailyWord;
      } else {
        throw "Error loading product";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Word>> getPopularWords() async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "https://api.tusindirmesozlik.uz/api/random-words");
      if (response.statusCode == 200) {
        List<Word> words = PopularWordsModel.fromRawJson(response.body).data!;
        return words;
      } else {
        throw "Error loading product";
      }
    } catch (e) {
      rethrow;
    }
  }
}
