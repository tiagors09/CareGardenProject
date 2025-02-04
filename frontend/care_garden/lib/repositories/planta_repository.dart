import 'package:care_garden/models/planta.dart';
import 'package:care_garden/services/api_client_planta.dart';

class PlantaRepository {
  final String _caminho = '/plantas';
  final ApiClientPlanta apiClient;

  PlantaRepository({
    required this.apiClient,
  });

  Future<Planta> adicionarPlanta(Planta p) async {
    try {
      final resposta = await apiClient.adicionarPlanta(_caminho, p);

      return resposta;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletarPlanta(String id) async {
    try {
      await apiClient.deletarPlanta(_caminho, id);
    } catch (e) {
      rethrow;
    }
  }
}
