package br.com.tiagors09.caregarden.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import br.com.tiagors09.caregarden.repositories.PlantaRepository;
import br.com.tiagors09.caregarden.models.Planta;

@RestController
@RequestMapping("/plantas")
public class PlantasController {
  @Autowired
  private PlantaRepository repository;

  // 1. Listar todas as plantas (GET /plantas)
  @GetMapping
  public List<Planta> listarPlantas() {
    return repository.findAll();
  }

  // 2. Buscar uma planta por ID (GET /plantas/{id})
  @GetMapping("/{id}")
  public ResponseEntity<Planta> buscarPlanta(@PathVariable Long id) {
    return repository.findById(id)
        .map(ResponseEntity::ok)
        .orElse(ResponseEntity.notFound().build());
  }

  // 3. Adicionar uma nova planta (POST /plantas)
  @PostMapping
  public ResponseEntity<Planta> adicionarPlanta(@RequestParam("nome") String nome,
      @RequestParam("dataDeAquisicao") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dataDeAquisicao) {

    Planta planta = new Planta();
    planta.setNome(nome);
    planta.setDataDeAquisicao(dataDeAquisicao);

    Planta plantaSalva = repository.save(planta);
    return ResponseEntity.ok(plantaSalva);
  }

  // 4. Atualizar uma planta (PUT /plantas/{id})
  @PutMapping("/{id}")
  public ResponseEntity<Planta> atualizarPlanta(@PathVariable Long id,
      @RequestParam(required = false) String nome,
      @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date dataDeAquisicao) {

    return repository.findById(id)
        .map(planta -> {
          if (nome != null) {
            planta.setNome(nome);
          }
          if (dataDeAquisicao != null) {
            planta.setDataDeAquisicao(dataDeAquisicao);
          }
          Planta plantaAtualizada = repository.save(planta);
          return ResponseEntity.ok(plantaAtualizada);
        })
        .orElse(ResponseEntity.notFound().build());
  }

  // 5. Deletar uma planta (DELETE /plantas/{id})
  @DeleteMapping("/{id}")
  public ResponseEntity<?> deletarPlanta(@PathVariable Long id) {
    return repository.findById(id)
        .map(planta -> {
          repository.delete(planta);
          return ResponseEntity.noContent().build();
        })
        .orElse(ResponseEntity.notFound().build());
  }
}
