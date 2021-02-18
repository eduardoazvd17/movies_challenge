class MovieModel {
  String posterPath;
  int id;
  List<int> genreIds;
  String title;

  MovieModel({
    this.posterPath,
    this.id,
    this.genreIds,
    this.title,
  });

  MovieModel.fromJSON(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    id = json['id'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
  }
}
