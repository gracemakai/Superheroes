import '../models/superhero_model.dart';
import 'superhero_service.dart';

class SuperHeroRepository {
  final SuperHeroService service;

  const SuperHeroRepository({required this.service});

  Future<SuperHeroModel> getSuperHero(String id) => service.getSuperhero(id);

  Future<List<SuperHeroModel>> searchSuperHero(String name) async {
    return await service.searchSuperhero(name);
  }
}
