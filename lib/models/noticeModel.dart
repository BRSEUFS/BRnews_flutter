import 'package:json_annotation/json_annotation.dart';

part 'noticeModel.g.dart';

@JsonSerializable(nullable: false)
class NoticeModel {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  NoticeModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  factory NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeModelToJson(this);
}

@JsonSerializable(nullable: false)
class Source {
  Source({this.id, this.name});

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable(nullable: false)
class NoticeResponse {
  String status;
  int totalResults;
  List<NoticeModel> articles;

  NoticeResponse({this.status, this.totalResults, this.articles});
  factory NoticeResponse.fromJson(Map<String, dynamic> json) =>
      _$NoticeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeResponseToJson(this);
}
