class Agendamento {
  final int? id;
  final int plantaId;
  final String plantaNome;
  final DateTime data;

  Agendamento({
    required this.id,
    required this.plantaId,
    required this.plantaNome,
    required this.data,
  });

  Agendamento.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        plantaId = json['plantaId'],
        plantaNome = json['plantaNome'],
        data = DateTime.parse(json['data']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'plantaId': plantaId,
      'plantaNome': plantaNome,
      'data': data.toIso8601String(),
    };
  }
}
