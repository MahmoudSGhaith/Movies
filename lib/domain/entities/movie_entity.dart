class MovieEntity{
  final int id;
  final String? mediumImage;
  final String? largeImage;
  final double rating;

  MovieEntity({required this.id, this.largeImage,this.mediumImage, required this.rating});
}