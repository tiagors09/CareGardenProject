import 'package:care_garden/models/planta.dart';
import 'package:care_garden/repositories/planta_repository.dart';

class AdicionarPlantaUsecase {
  final PlantaRepository plantaRepository;

  AdicionarPlantaUsecase({
    required this.plantaRepository,
  });

  Future<void> execute(Planta planta) async {
    try {
      await plantaRepository.adicionarPlanta(planta);
    } catch (e) {
      rethrow;
    }
  }
}
