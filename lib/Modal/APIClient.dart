import 'dart:convert';

List<APIClient> welcomeFromJson(String str) => List<APIClient>.from(json.decode(str).map((x) => APIClient.fromJson(x)));

class APIClient {
  APIClient({
    this.id,
    this.title,
    this.url,
    this.imageUrl,
    this.newsSite,
    this.summary,
    this.publishedAt,
    this.updatedAt,
    this.featured,
    this.events,
  });

  String id;
  String title;
  String url;
  String imageUrl;
  String newsSite;
  String summary;
  DateTime publishedAt;
  DateTime updatedAt;
  bool featured;
  List<dynamic> events;

  factory APIClient.fromJson(Map<String, dynamic> json) => APIClient(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    imageUrl: json["imageUrl"],
    newsSite: json["newsSite"],
    summary: json["summary"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    featured: json["featured"],
    events: List<dynamic>.from(json["events"].map((x) => x)),
  );

}