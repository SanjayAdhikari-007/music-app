class SecondPageTrackModel {
  late String songName;
  late String albumName;
  late String artistName;
  late int trackId;
  late int rating;
  late bool isExplicit;
  late String lyrics;

  SecondPageTrackModel({
    required this.songName,
    required this.albumName,
    required this.artistName,
    required this.trackId,
    required this.isExplicit,
    required this.rating,
    required this.lyrics,
  });

  SecondPageTrackModel.fromJson(Map<String, dynamic> json) {
    var temp = json['track'];
    songName = temp['track_name'];
    albumName = temp['album_name'];
    artistName = temp['artist_name'];
    trackId = temp['track_id'] as int;
    isExplicit = (temp['explicit'] as int) == 1 ? true : false;
    rating = temp['track_rating'] as int;
    lyrics = json['lyrics'] as String;
  }
}
