import 'package:http/http.dart' as http;
import 'package:tusindirme_sozlik_flutter/data/model/daily_word_model.dart';
import 'package:tusindirme_sozlik_flutter/data/model/popular_words_model.dart';

class ApiProvider {
  final String _baseUrl = "https://api.tusindirmesozlik.uz";

  Future<List<Word>> fetchWords(int page) async {
    try {
      final response =
          await http.get(Uri.parse("$_baseUrl/api/get-all-words?page=$page"));

      if (response.statusCode == 200) {
        List<Word> words = PopularWordsModel.fromRawJson(response.body).data!;
        return words;
      } else {
        throw "Error loading words";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Word> getDailyWord() async {
    try {
      final response =
          await http.get(Uri.parse("$_baseUrl/api/word-of-the-day"));

      if (response.statusCode == 200) {
        Word dailyWord = DailyWordModel.fromRawJson(response.body).data!;
        return dailyWord;
      } else {
        throw "Error loading word";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Word>> getPopularWords() async {
    try {
      final response = await http.get(Uri.parse("$_baseUrl/api/random-words"));

      if (response.statusCode == 200) {
        List<Word> words = PopularWordsModel.fromRawJson(response.body).data!;
        return words;
      } else {
        throw "Error loading words";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Word> getWordById(String wordId) async {
    try {
      final response =
          await http.get(Uri.parse("$_baseUrl/api/all-words/$wordId"));

      if (response.statusCode == 200) {
        Word word = DailyWordModel.fromRawJson(response.body).data!;
        return word;
      } else {
        throw "Error loading word";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Word>> getSearchResult(String searchText) async {
    try {
      final response =
          await http.get(Uri.parse("$_baseUrl/api/get-all-words?$searchText"));

      if (response.statusCode == 200) {
        List<Word> words = SearchResultModel.fromRawJson(response.body).words!;
        return words;
      } else {
        throw "Error loading words";
      }
    } catch (e) {
      rethrow;
    }
  }
}
