import '../../../data/data_provider.dart';
import '../model/models.dart';

class ProductRepository {
  DataProvider dataProvider = DataProvider();
  Future<Data> getProducts() async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "https://api.tusindirmesozlik.uz/api/word-of-the-day");
      if (response.statusCode == 200) {
        Data products =
            DailyWordModel.fromRawJson(response.body).data!;
        return products;
      } else {
        throw "Error loading product";
      }
    } catch (e) {
      rethrow;
    }
  }
}
