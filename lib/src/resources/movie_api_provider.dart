import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';
import '../models/trailer_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'c412c4ac9b1f384bb31d9e684b02850e';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    Uri uri = Uri(
        scheme: "https",
        host: "api.themoviedb.org",
        path: "3/movie/popular",
        queryParameters: {"api_key": _apiKey});
    final response = await client.get(uri);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    Uri uri = Uri(
        scheme: "https",
        host: "api.themoviedb.org",
        path: "3/movie/popular",
        queryParameters: {"api_key": _apiKey});
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
