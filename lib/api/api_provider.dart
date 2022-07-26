import 'dart:convert';

import 'package:http/http.dart' as http;

import '../home_screen/model/track_model.dart';
import '../print_in_color/color_print.dart';
import '../secondary_screen/model/model.dart';

class ApiProvider {
  // final String url;
  static const String apiKey = '23017ec149c4b30f8d20e510a9e801b6';
  static const String initialUrl =
      'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$apiKey';

  // ApiProvider({this.url = initialUrl});
  Future<List<HomePageTrackModel>?> getData({url = initialUrl}) async {
    final response = await http
        .get(Uri.parse(url), headers: {'application': "application/json"});
    printWarning(response.body);
    printError(((jsonDecode(response.body)) as Map<String, dynamic>)
        .length
        .toString());
    if (response.statusCode == 200) {
      var list = (jsonDecode(response.body) as Map<String, dynamic>)["message"]
          ['body']['track_list'] as List;
      return list.map((e) {
        return HomePageTrackModel.fromJson(e);
      }).toList();
      // return HomePageTrackModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<SecondPageTrackModel?> getSecondPageData(
      {required int trackId}) async {
    final String url =
        'https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=$apiKey';
    final String lyricsUrl =
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=$apiKey';

    final response = await http
        .get(Uri.parse(url), headers: {'application': "application/json"});
    final responseLyrics = await http.get(Uri.parse(lyricsUrl),
        headers: {'application': "application/json"});
    // printWarning(response.body);
    // printError(((jsonDecode(response.body)) as Map<String, dynamic>)
    //     .length
    //     .toString());
    if (response.statusCode == 200) {
      String bodyLyrics = '';
      var body = (jsonDecode(response.body) as Map<String, dynamic>)["message"]
          ['body'] as Map<String, dynamic>;
      print(body);
      if (responseLyrics.statusCode == 200) {
        bodyLyrics = ((jsonDecode(responseLyrics.body)
                as Map<String, dynamic>)["message"]['body']['lyrics']
            ['lyrics_body'] as String);
      }
      body['lyrics'] = bodyLyrics;

      return SecondPageTrackModel.fromJson(body);
    }
  }
}
