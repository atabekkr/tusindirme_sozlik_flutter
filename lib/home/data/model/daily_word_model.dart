import 'dart:convert';

class DailyWordModel {
  Data? data;

  DailyWordModel({this.data});

  factory DailyWordModel.fromRawJson(String str) =>
      DailyWordModel.fromJson(json.decode(str));

  DailyWordModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? categoryId;
  Category? category;
  Category? title;
  Category? description;
  Null audio;
  Null status;
  bool? isCorrect;
  String? quantity;
  List<Null>? antonym;
  List<Null>? synonym;

  Data(
      {this.id,
      this.categoryId,
      this.category,
      this.title,
      this.description,
      this.audio,
      this.status,
      this.isCorrect,
      this.quantity,
      this.antonym,
      this.synonym});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    title = json['title'] != null ? new Category.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Category.fromJson(json['description'])
        : null;
    audio = json['audio'];
    status = json['status'];
    isCorrect = json['is_correct'];
    quantity = json['quantity'];
    if (json['antonym'] != null) {
      antonym = <Null>[];
      json['antonym'].forEach((v) {
        antonym!.add(null);
      });
    }
    if (json['synonym'] != null) {
      synonym = <Null>[];
      json['synonym'].forEach((v) {
        synonym!.add(null);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['audio'] = this.audio;
    data['status'] = this.status;
    data['is_correct'] = this.isCorrect;
    data['quantity'] = this.quantity;
    if (this.antonym != null) {
      data['antonym'] = this.antonym!.map((v) => v).toList();
    }
    if (this.synonym != null) {
      data['synonym'] = this.synonym!.map((v) => v).toList();
    }
    return data;
  }
}

class Category {
  String? kiril;
  String? latin;

  Category({this.kiril, this.latin});

  Category.fromJson(Map<String, dynamic> json) {
    kiril = json['kiril'];
    latin = json['latin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kiril'] = this.kiril;
    data['latin'] = this.latin;
    return data;
  }
}
