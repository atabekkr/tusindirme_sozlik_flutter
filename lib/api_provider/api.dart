import 'package:http/http.dart' as http;
import 'package:tusindirme_sozlik_flutter/data/model/daily_word_model.dart';
import 'package:tusindirme_sozlik_flutter/data/model/popular_words_model.dart';

class ApiProvider {
  final String _baseUrl = "https://api.tusindirmesozlik.uz";

  Future<List<Word>> fetchWords(int page) async {
    final response =
        await http.get(Uri.parse("$_baseUrl/api/get-all-words?page=$page"));

    if (response.statusCode == 200) {
      List<Word> words = PopularWordsModel.fromRawJson(response.body).data!;
      return words;
    } else {
      throw "Error loading product";
    }
  }
}
