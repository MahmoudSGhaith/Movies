import 'package:movies/movie_details/data/models/Cast.dart';

class MovieDetailsEntity {
  final String largeCoverImage;
  final String title;
  final int year;
  final String url;
  final int likeCount;
  final int runtime;
  final double rating;
  final String mediumScreenshotImage1;
  final String mediumScreenshotImage2;
  final String mediumScreenshotImage3;
  final List<String> genres;
  final String descriptionFull;
  final List<Cast> cast;

  const MovieDetailsEntity({
    required this.largeCoverImage,
    required this.year,
    required this.url,
    required this.likeCount,
    required this.runtime,
    required this.rating,
    required this.mediumScreenshotImage1,
    required this.mediumScreenshotImage2,
    required this.mediumScreenshotImage3,
    required this.title,
    required this.genres,
    required this.descriptionFull,
    required this.cast
});
}
