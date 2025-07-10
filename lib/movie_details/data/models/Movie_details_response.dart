import 'Data.dart';
import '@meta.dart';

/// status : "ok"
/// status_message : "Query was successful"
/// data : {"movie":{"id":70077,"url":"https://yts.mx/movies/reloaded-3-2025","imdb_code":"tt32549557","title":"Reloaded 3","title_english":"Reloaded 3","title_long":"Reloaded 3 (2025)","slug":"reloaded-3-2025","year":2025,"rating":6.1,"runtime":50,"genres":["Action","Crime","Romance","Thriller"],"like_count":2,"description_intro":"","description_full":"","yt_trailer_code":"","language":"en","mpa_rating":"","background_image":"https://yts.mx/assets/images/movies/reloaded_3_2025/background.jpg","background_image_original":"https://yts.mx/assets/images/movies/reloaded_3_2025/background.jpg","small_cover_image":"https://yts.mx/assets/images/movies/reloaded_3_2025/small-cover.jpg","medium_cover_image":"https://yts.mx/assets/images/movies/reloaded_3_2025/medium-cover.jpg","large_cover_image":"https://yts.mx/assets/images/movies/reloaded_3_2025/large-cover.jpg","medium_screenshot_image1":"https://yts.mx/assets/images/movies/reloaded_3_2025/medium-screenshot1.jpg","medium_screenshot_image2":"https://yts.mx/assets/images/movies/reloaded_3_2025/medium-screenshot2.jpg","medium_screenshot_image3":"https://yts.mx/assets/images/movies/reloaded_3_2025/medium-screenshot3.jpg","large_screenshot_image1":"https://yts.mx/assets/images/movies/reloaded_3_2025/large-screenshot1.jpg","large_screenshot_image2":"https://yts.mx/assets/images/movies/reloaded_3_2025/large-screenshot2.jpg","large_screenshot_image3":"https://yts.mx/assets/images/movies/reloaded_3_2025/large-screenshot3.jpg","cast":[{"name":"Dean Morgan","character_name":"Mel","imdb_code":"5925816"},{"name":"George Tounas","character_name":"Jimmy Cloud","imdb_code":"2466502"},{"name":"Rudy Ledbetter","character_name":"Drug victim","imdb_code":"7819823"},{"name":"Marissa Cox","character_name":"Self","imdb_code":"11359922"}],"torrents":[{"url":"https://yts.mx/torrent/download/79B6A8687F26A26D0D65E3A4F37FA24BFB057F17","hash":"79B6A8687F26A26D0D65E3A4F37FA24BFB057F17","quality":"720p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":100,"peers":32,"size":"463.79 MB","size_bytes":486319063,"date_uploaded":"2025-07-08 13:11:21","date_uploaded_unix":1751973081},{"url":"https://yts.mx/torrent/download/B172C0C9D3BE2112FC38FE117E0F0DE9705089B1","hash":"B172C0C9D3BE2112FC38FE117E0F0DE9705089B1","quality":"1080p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":100,"peers":54,"size":"859.3 MB","size_bytes":901041357,"date_uploaded":"2025-07-08 13:43:08","date_uploaded_unix":1751974988}],"date_uploaded":"2025-07-08 13:11:21","date_uploaded_unix":1751973081}}
/// @meta : {"server_time":1752145448,"server_timezone":"CET","api_version":2,"execution_time":"0 ms"}

class MovieDetailsResponse {
  MovieDetailsResponse({
      this.status, 
      this.statusMessage, 
      this.data, 
      this.meta,});

  MovieDetailsResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (meta != null) {
      map['@meta'] = meta?.toJson();
    }
    return map;
  }

}