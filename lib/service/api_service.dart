import 'dart:convert';
import 'package:mvvm_statemanagements/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_statemanagements/model/movies_model.dart';

import '../model/genres_model.dart';

class ApiService {
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    final url = Uri.parse(
        "${ApiConstants.baseUrl}/movie/popular?language=en-US&page=1");
    final response = await http.get(url, headers: ApiConstants.header);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return List.from(
          data['results'].map((element) => MovieModel.fromJson(element)));
    } else {
      throw Exception("Failed to load movies : ${response.statusCode}");
    }
  }

  Future<List<GenreModel>> fetchGenres() async {
    final url =
        Uri.parse("${ApiConstants.baseUrl}/genre/movie/list?language=en");
    final response = await http.get(url, headers: ApiConstants.header);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return List.from(
          data['genres'].map((element) => GenreModel.fromJson(element)));
    } else {
      throw Exception("Failed to load movies : ${response.statusCode}");
    }
  }
}