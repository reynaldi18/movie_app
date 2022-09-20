import 'package:json_annotation/json_annotation.dart';

import 'dates.dart';
import 'movie.dart';

part 'movies.g.dart';

@JsonSerializable()
class Movies {
  @JsonKey(name: 'dates')
  Dates? dates;
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<Movie>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  Movies({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory Movies.fromJson(Map<String, dynamic> json) =>
      _$MoviesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
