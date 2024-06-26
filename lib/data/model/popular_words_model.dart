import 'dart:convert';

import 'daily_word_model.dart';

class PopularWordsModel {
  List<Data>? data;

  PopularWordsModel({required this.data});

  factory PopularWordsModel.fromRawJson(String str) =>
      PopularWordsModel.fromJson(json.decode(str));


  factory PopularWordsModel.fromJson(Map<String, dynamic> json) => PopularWordsModel(
    data: List<Data>.from(
        json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}