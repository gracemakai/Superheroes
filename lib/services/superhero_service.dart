import 'dart:convert';

import 'package:superheroes/models/superhero_model.dart';

import '../utils/config.dart';
import 'base_service.dart';

class SuperHeroService {
  BaseService baseService = BaseService();
  String baseUrl = "https://superheroapi.com";
  String accessToken = superheroApiAccessToken;


  getSuperhero(String id) async {
    var sups = await baseService.databaseRequest(
        "$baseUrl/api/$accessToken/$id", baseService.getRequestType);

    return SuperHeroModel.fromJson(jsonDecode(sups)["results"]);
  }

  searchSuperhero(String name) async {
    var sups = await baseService.databaseRequest(
        "$baseUrl/api/$accessToken/search/$name", baseService.getRequestType);

    return List<SuperHeroModel>.from(
      json.decode(sups)['results'].map(
            (data) => SuperHeroModel.fromJson(data),
      ),
    );
  }

}