class Movie {
  final String title;
  final String description;
  final double rating;
  final String quality;
  final String genre;
  final int year;
  final String? imageUrl;

  const Movie({
    required this.title,
    required this.description,
    required this.rating,
    required this.quality,
    required this.genre,
    required this.year,
    this.imageUrl,
  });
}
