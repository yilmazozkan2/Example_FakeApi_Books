// To parse this JSON data, do
//
//     final BooksModel = BooksModelFromJson(jsonString);

import 'dart:convert';

List<BooksModel> BooksModelFromJson(String str) => List<BooksModel>.from(json.decode(str).map((x) => BooksModel.fromJson(x)));

String BooksModelToJson(List<BooksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BooksModel {
  BooksModel({
    this.id,
    this.title,
    this.description,
    this.pageCount,
    this.publishDate,
  });

  int? id;
  String? title;
  String? description;
  int? pageCount;
  DateTime? publishDate;

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    pageCount: json["pageCount"],
    publishDate: json["publishDate"] == null ? null : DateTime.parse(json["publishDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "pageCount": pageCount,
    "publishDate": publishDate?.toIso8601String(),
  };
}
