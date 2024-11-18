import 'package:mvvm_statemanagements/repository/movies_repo.dart';
import 'package:mvvm_statemanagements/service/init_getit.dart';

import '../model/genres_model.dart';

class GenreUtils {
  static List<GenreModel> moviesGenresNames(List<int> genreIds) {
    final moviesRepository = getIt<MoviesRepository>();

    final cachedGeners = moviesRepository.cachedGenres;
    List<GenreModel> genresNames = [];

    for (var genreId in genreIds) {
      var genre = cachedGeners.firstWhere(
        (g) => g.id == genreId,
        orElse: () => GenreModel(id: 5448484, name: "Unknown"),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}