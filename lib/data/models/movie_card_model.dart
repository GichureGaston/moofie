import 'dart:core';

class Movie {
  final String ?title;
  final String ?rating;
  final String ?description;
  final String ?quality;
  final String ?genre;
  final int ?year;
  final String? imageUrl;
  final String ? Released;
  final String? ;

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
