// To parse this JSON data, do
//
//     final videoCollection = videoCollectionFromJson(jsonString);

import 'dart:convert';

class ThumbnailInfo {
  String title;
  String url;
  String thumnailImg;
  String description;
  ThumbnailInfo({
    required this.title,
    required this.url,
    required this.thumnailImg,
    required this.description,
  });
}

class VideoCollection {
  VideoCollection({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    this.items,
  });

  String? kind;
  String? etag;
  String? nextPageToken;
  String? regionCode;
  PageInfo? pageInfo;
  List<Item>? items;

  factory VideoCollection.fromRawJson(String str) =>
      VideoCollection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoCollection.fromJson(Map<String, dynamic> json) =>
      VideoCollection(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        regionCode: json["regionCode"],
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromJson(json["pageInfo"]),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "regionCode": regionCode,
        "pageInfo": pageInfo?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };

  List<ThumbnailInfo> getThumnailInfo() {
    List<ThumbnailInfo> thumnails = [];
    items?.forEach((e) {
      String? title = e.snippet?.title;
      String url = 'https://www.youtube.com/watch?v=${e.id?.videoId}';
      String? thumnailImg = e.snippet?.thumbnails?.medium?.url;
      String? description = e.snippet?.description;
      if (title != null &&
          e.id?.videoId != null &&
          thumnailImg != null &&
          description != null) {
        thumnails.add(ThumbnailInfo(
            title: title,
            url: url,
            thumnailImg: thumnailImg,
            description: description));
      }
    });
    return thumnails;
  }
}

class Item {
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  ItemKind? kind;
  String? etag;
  Id? id;
  Snippet? snippet;

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: itemKindValues.map[json["kind"]]!,
        etag: json["etag"],
        id: json["id"] == null ? null : Id.fromJson(json["id"]),
        snippet:
            json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": itemKindValues.reverse[kind],
        "etag": etag,
        "id": id?.toJson(),
        "snippet": snippet?.toJson(),
      };
}

class Id {
  Id({
    this.kind,
    this.videoId,
  });

  IdKind? kind;
  String? videoId;

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: idKindValues.map[json["kind"]]!,
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "kind": idKindValues.reverse[kind],
        "videoId": videoId,
      };
}

enum IdKind { youtubeVideo }

final idKindValues = EnumValues({"youtube#video": IdKind.youtubeVideo});

enum ItemKind { youtubeSearchResult }

final itemKindValues =
    EnumValues({"youtube#searchResult": ItemKind.youtubeSearchResult});

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.liveBroadcastContent,
    this.publishTime,
  });

  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  LiveBroadcastContent? liveBroadcastContent;
  DateTime? publishTime;

  factory Snippet.fromRawJson(String str) => Snippet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"] == null
            ? null
            : Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        liveBroadcastContent:
            liveBroadcastContentValues.map[json["liveBroadcastContent"]],
        publishTime: json["publishTime"] == null
            ? null
            : DateTime.parse(json["publishTime"]),
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails?.toJson(),
        "channelTitle": channelTitle,
        "liveBroadcastContent":
            liveBroadcastContentValues.reverse[liveBroadcastContent],
        "publishTime": publishTime?.toIso8601String(),
      };
}

enum LiveBroadcastContent { none }

final liveBroadcastContentValues =
    EnumValues({"none": LiveBroadcastContent.none});

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
  });

  Default? thumbnailsDefault;
  Default? medium;
  Default? high;

  factory Thumbnails.fromRawJson(String str) =>
      Thumbnails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault:
            json["default"] == null ? null : Default.fromJson(json["default"]),
        medium:
            json["medium"] == null ? null : Default.fromJson(json["medium"]),
        high: json["high"] == null ? null : Default.fromJson(json["high"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault?.toJson(),
        "medium": medium?.toJson(),
        "high": high?.toJson(),
      };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

  factory Default.fromRawJson(String str) => Default.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int? totalResults;
  int? resultsPerPage;

  factory PageInfo.fromRawJson(String str) =>
      PageInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
