class Movie {
  String? description;
  int? favoriteCount;
  int? id;
  int? itemCount;
  String? iso6391;
  String? listType;
  String? name;
  String? posterPath;

  Movie(
      {this.description,
      this.favoriteCount,
      this.id,
      this.itemCount,
      this.iso6391,
      this.listType,
      this.name,
      this.posterPath});

  Movie.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    favoriteCount = json['favorite_count'];
    id = json['id'];
    itemCount = json['item_count'];
    iso6391 = json['iso_639_1'];
    listType = json['list_type'];
    name = json['name'];
    posterPath = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['favorite_count'] = favoriteCount;
    data['id'] = id;
    data['item_count'] = itemCount;
    data['iso_639_1'] = iso6391;
    data['list_type'] = listType;
    data['name'] = name;
    data['poster_path'] = posterPath;
    return data;
  }
}
