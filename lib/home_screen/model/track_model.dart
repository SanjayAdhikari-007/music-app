class HomePageTrackModel {
  late String songName;
  late String albumName;
  late String artistName;
  late int trackId;

  HomePageTrackModel({
    required this.songName,
    required this.albumName,
    required this.artistName,
    required this.trackId,
  });

  HomePageTrackModel.fromJson(Map<String, dynamic> json) {
    var temp = json['track'];
    songName = temp['track_name'];
    albumName = temp['album_name'];
    artistName = temp['artist_name'];
    trackId = temp['track_id'] as int;
  }
}
