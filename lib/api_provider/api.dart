import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tusindirme_sozlik_flutter/data/model/daily_word_model.dart';
import 'package:tusindirme_sozlik_flutter/data/model/popular_words_model.dart';

String processResponse(http.Response response) {
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return response.body;
  } else {
    throw Exception('Ошибка сервера: ${response.statusCode} - ${response.reasonPhrase}');
  }
}

class ApiProvider {
  final String _baseUrl = "https://api.tusindirmesozlik.uz";

  Future<List<Word>> fetchAlbums(int page) async {
    final response = await http.get(Uri.parse("$_baseUrl/api/get-all-words?page=$page"));

    if (response.statusCode == 200) {
      List<Word> words = PopularWordsModel.fromRawJson(response.body).data!;
      return words;
    } else {
      throw "Error loading product";
    }
    // final responseBody = processResponse(response);
    //
    // List jsonResponse = json.decode(responseBody);
    // return jsonResponse.map((album) => PopularWordsModel.fromRawJson(album).data);
  }
}

class Album {
  final int id;
  final String title;
  final int year;
  final String cover;
  final String color;
  final String label;
  final int artistId;
  final int listens;

  Album({
    required this.id,
    required this.title,
    required this.year,
    required this.cover,
    required this.color,
    required this.label,
    required this.artistId,
    required this.listens,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      cover: json['cover'],
      color: json['color'],
      label: json['label'],
      artistId: json['artistId'],
      listens: json['listens'],
    );
  }
}