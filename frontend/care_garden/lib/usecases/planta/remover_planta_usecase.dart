import 'package:care_garden/repositories/planta_repository.dart';

class RemoverPlantaUseCase {
  final PlantaRepository plantaRepository;

  RemoverPlantaUseCase({
    required this.plantaRepository,
  });

  Future<void> execute(int id) async {
    try {
      await plantaRepository.deletarPlanta(id.toString());
    } catch (e) {
      rethrow;
    }
  }
}
