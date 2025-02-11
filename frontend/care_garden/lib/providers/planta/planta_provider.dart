import 'dart:convert';

import 'package:care_garden/models/planta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlantaProvider with ChangeNotifier {
  final String _baseUrl = 'https://localhosta:8080/plantas';
  List<Planta> _plantas = [];

  List<Planta> get plantas => _plantas;

  Future<void> requisitarPlantas() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _plantas = data.map((json) => Planta.fromJson(json)).toList();
      notifyListeners();
    }
  }

  Future<void> adicionarPlanta(Planta plant) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(plant.toJson()),
    );
    if (response.statusCode == 201) {
      _plantas.add(Planta.fromJson(json.decode(response.body)));
      notifyListeners();
    }
  }

  Future<void> atualizarPlanta(Planta plant) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/${plant.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(plant.toJson()),
    );
    if (response.statusCode == 200) {
      final index = _plantas.indexWhere((p) => p.id == plant.id);
      if (index != -1) {
        _plantas[index] = plant;
        notifyListeners();
      }
    }
  }

  Future<void> deletarPlanta(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode == 200) {
      _plantas.removeWhere((plant) => plant.id == id);
      notifyListeners();
    }
  }
}
