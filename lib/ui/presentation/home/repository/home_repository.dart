import '../../../../api_provider/api.dart';
import '../../../../data/model/daily_word_model.dart';

class HomeRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Word> getDailyWord() async {
    return await _apiProvider.getDailyWord();
  }

  Future<List<Word>> getPopularWords() async {
    return _apiProvider.getPopularWords();
  }
}
