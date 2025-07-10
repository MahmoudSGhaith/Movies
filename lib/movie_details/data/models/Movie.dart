import 'Cast.dart';
import 'Torrents.dart';

/// id : 70077
/// url : "https://yts.mx/movies/reloaded-3-2025"
/// imdb_code : "tt32549557"
/// title : "Reloaded 3"
/// title_english : "Reloaded 3"
/// title_long : "Reloaded 3 (2025)"
/// slug : "reloaded-3-2025"
/// year : 2025
/// rating : 6.1
/// runtime : 50
/// genres : ["Action","Crime","Romance","Thriller"]
/// like_count : 2
/// description_intro : ""
/// description_full : ""
/// yt_trailer_code : ""
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.mx/assets/images/movies/reloaded_3_2025/background.jpg"
/// background_image_original : "https://yts.mx/assets/images/movies/reloaded_3_2025/background.jpg"
/// small_cover_image : "https://yts.mx/assets/images/movies/reloaded_3_2025/small-cover.jpg"
/// medium_cover_image : "https://yts.mx/assets/images/movies/reloaded_3_2025/medium-cover.jpg"
/// large_cover_image : "https://yts.mx/assets/images/movies/reloaded_3_2025/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.mx/assets/images/movies/reloaded_3_2025/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.mx/assets/images/movies/reloaded_3_2025/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.mx/assets/images/movies/reloaded_3_2025/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.mx/assets/images/movies/reloaded_3_2025/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.mx/assets/images/movies/reloaded_3_2025/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.mx/assets/images/movies/reloaded_3_2025/large-screenshot3.jpg"
/// cast : [{"name":"Dean Morgan","character_name":"Mel","imdb_code":"5925816"},{"name":"George Tounas","character_name":"Jimmy Cloud","imdb_code":"2466502"},{"name":"Rudy Ledbetter","character_name":"Drug victim","imdb_code":"7819823"},{"name":"Marissa Cox","character_name":"Self","imdb_code":"11359922"}]
/// torrents : [{"url":"https://yts.mx/torrent/download/79B6A8687F26A26D0D65E3A4F37FA24BFB057F17","hash":"79B6A8687F26A26D0D65E3A4F37FA24BFB057F17","quality":"720p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":100,"peers":32,"size":"463.79 MB","size_bytes":486319063,"date_uploaded":"2025-07-08 13:11:21","date_uploaded_unix":1751973081},{"url":"https://yts.mx/torrent/download/B172C0C9D3BE2112FC38FE117E0F0DE9705089B1","hash":"B172C0C9D3BE2112FC38FE117E0F0DE9705089B1","quality":"1080p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":100,"peers":54,"size":"859.3 MB","size_bytes":901041357,"date_uploaded":"2025-07-08 13:43:08","date_uploaded_unix":1751974988}]
/// date_uploaded : "2025-07-08 13:11:21"
/// date_uploaded_unix : 1751973081

class Movie {
  Movie({
      this.id, 
      this.url, 
      this.imdbCode, 
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.slug, 
      this.year, 
      this.rating, 
      this.runtime, 
      this.genres, 
      this.likeCount, 
      this.descriptionIntro, 
      this.descriptionFull, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.mediumScreenshotImage1, 
      this.mediumScreenshotImage2, 
      this.mediumScreenshotImage3, 
      this.largeScreenshotImage1, 
      this.largeScreenshotImage2, 
      this.largeScreenshotImage3, 
      this.cast, 
      this.torrents, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Movie.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = (json['rating'] as num?)?.toDouble();
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    mediumScreenshotImage1 = json['medium_screenshot_image1'];
    mediumScreenshotImage2 = json['medium_screenshot_image2'];
    mediumScreenshotImage3 = json['medium_screenshot_image3'];
    largeScreenshotImage1 = json['large_screenshot_image1'];
    largeScreenshotImage2 = json['large_screenshot_image2'];
    largeScreenshotImage3 = json['large_screenshot_image3'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;
  List<Cast>? cast;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['like_count'] = likeCount;
    map['description_intro'] = descriptionIntro;
    map['description_full'] = descriptionFull;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['medium_screenshot_image1'] = mediumScreenshotImage1;
    map['medium_screenshot_image2'] = mediumScreenshotImage2;
    map['medium_screenshot_image3'] = mediumScreenshotImage3;
    map['large_screenshot_image1'] = largeScreenshotImage1;
    map['large_screenshot_image2'] = largeScreenshotImage2;
    map['large_screenshot_image3'] = largeScreenshotImage3;
    if (cast != null) {
      map['cast'] = cast?.map((v) => v.toJson()).toList();
    }
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}