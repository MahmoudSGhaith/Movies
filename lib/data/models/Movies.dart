import 'Torrents.dart';

/// id : 67347
/// url : "https://yts.mx/movies/bloat-2025"
/// imdb_code : "tt23131648"
/// title : "Bloat"
/// title_english : "Bloat"
/// title_long : "Bloat (2025)"
/// slug : "bloat-2025"
/// year : 2025
/// rating : 3.8
/// runtime : 86
/// genres : ["Horror"]
/// summary : ""
/// description_full : ""
/// synopsis : ""
/// yt_trailer_code : "4VZfmgLLXgY"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.mx/assets/images/movies/bloat_2025/background.jpg"
/// background_image_original : "https://yts.mx/assets/images/movies/bloat_2025/background.jpg"
/// small_cover_image : "https://yts.mx/assets/images/movies/bloat_2025/small-cover.jpg"
/// medium_cover_image : "https://yts.mx/assets/images/movies/bloat_2025/medium-cover.jpg"
/// large_cover_image : "https://yts.mx/assets/images/movies/bloat_2025/large-cover.jpg"
/// state : "ok"
/// torrents : [{"url":"https://yts.mx/torrent/download/2B0E863465F8F2D6E3C4FA5D574122AB59514579","hash":"2B0E863465F8F2D6E3C4FA5D574122AB59514579","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":11,"peers":0,"size":"797.36 MB","size_bytes":836092559,"date_uploaded":"2025-04-29 19:24:24","date_uploaded_unix":1745947464},{"url":"https://yts.mx/torrent/download/1C7E31E1AF6B2796E0C52B9277385F8047C73533","hash":"1C7E31E1AF6B2796E0C52B9277385F8047C73533","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":11,"peers":5,"size":"1.6 GB","size_bytes":1717986918,"date_uploaded":"2025-04-29 20:29:38","date_uploaded_unix":1745951378},{"url":"https://yts.mx/torrent/download/6C9BB6AF5E7353E6F380C8EEC5F3ADADDC346AB9","hash":"6C9BB6AF5E7353E6F380C8EEC5F3ADADDC346AB9","quality":"720p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":25,"peers":4,"size":"793.87 MB","size_bytes":832433029,"date_uploaded":"2025-03-07 09:31:04","date_uploaded_unix":1741336264},{"url":"https://yts.mx/torrent/download/B9FFF55C91CFDD03C84E9655D7B345C528BE2FD5","hash":"B9FFF55C91CFDD03C84E9655D7B345C528BE2FD5","quality":"1080p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":37,"peers":5,"size":"1.59 GB","size_bytes":1707249500,"date_uploaded":"2025-03-07 10:24:53","date_uploaded_unix":1741339493},{"url":"https://yts.mx/torrent/download/E910C2B1DF06DAD15EC7535A7165992F835F5E40","hash":"E910C2B1DF06DAD15EC7535A7165992F835F5E40","quality":"2160p","type":"web","is_repack":"0","video_codec":"x265","bit_depth":"10","audio_channels":"5.1","seeds":20,"peers":2,"size":"3.86 GB","size_bytes":4144643441,"date_uploaded":"2025-03-17 18:09:27","date_uploaded_unix":1742231367}]
/// date_uploaded : "2025-03-07 09:31:04"
/// date_uploaded_unix : 1741336264

class Movies {
  Movies({
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
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,});

  Movies.fromJson(dynamic json) {
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
    summary = json['summary'];
    descriptionFull = json['description_full'];
    synopsis = json['synopsis'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    state = json['state'];
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
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
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
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['synopsis'] = synopsis;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}