import '../../../../api_provider/api.dart';
import '../../../../data/model/daily_word_model.dart';

class WordRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Word> getWordById(String wordId) async {
    return await _apiProvider.getWordById(wordId);
  }
}
