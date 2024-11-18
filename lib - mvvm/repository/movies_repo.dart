import 'package:mvvm_statemanagements/service/api_service.dart';

import '../model/genres_model.dart';
import '../model/movies_model.dart';

class MoviesRepository {
  final ApiService _apiService;
  MoviesRepository(this._apiService);

  List<GenreModel> cachedGenres = [];

  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    return await _apiService.fetchMovies();
  }

  Future<List<GenreModel>> fetchGenres() async {
    return cachedGenres = await _apiService.fetchGenres();
  }
}