import 'dart:convert';
import 'dart:io';
import 'package:goly/models/video_collection.dart';
import 'package:goly/utils/constants.dart';
import 'package:http/http.dart' as http;

class VideoService {
  static const _baseURL = 'www.googleapis.com';
  static Future<VideoCollection> getVideosFromSearch({required String search}) async {
    Map<String, dynamic> parameters = {
      'part': 'snippet',
      'maxResults': '10',
      'q': search,
      'key': Constants.youtubeAPiKey,
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'applications/json',
    };
    Uri uri = Uri.https(_baseURL, '/youtube/v3/search', parameters);

    http.Response response = await http.get(uri, headers: headers);
    return VideoCollection.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
}
