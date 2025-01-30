package br.com.tiagors09.caregarden.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
  @PostMapping(consumes = "multipart/form-data")
  public ResponseEntity<Planta> adicionarPlanta(@RequestParam("nome") String nome,
      @RequestParam("dataDeAquisicao") @DateTimeFormat(pattern = "yyyy-MM-dd") Date dataDeAquisicao,
      @RequestParam("file") MultipartFile file) {
    try {
      // Definir o diretório de upload
      String diretorio = "uploads/";
      Files.createDirectories(Paths.get(diretorio));

      // Criar o caminho do arquivo
      String caminhoFoto = diretorio + file.getOriginalFilename();
      Path caminho = Paths.get(caminhoFoto);
      Files.write(caminho, file.getBytes());

      // Criar nova planta e salvar no banco
      Planta planta = new Planta();
      planta.setNome(nome);
      planta.setDataDeAquisicao(dataDeAquisicao);
      planta.setCaminhoFoto(caminhoFoto);

      Planta plantaSalva = repository.save(planta);

      return ResponseEntity.ok(plantaSalva);
    } catch (IOException e) {
      return ResponseEntity.status(500).body(null);
    }
  }

  // 4. Atualizar uma planta (PUT /plantas/{id})
  @PutMapping("/{id}")
  public ResponseEntity<?> atualizarPlantaComImagem(@PathVariable(required = true) Long id,
      @RequestParam(required = false) String nome,
      @RequestParam(required = false) Date dataDeAquisicao,
      @RequestParam(required = false) MultipartFile imagem) {
    return repository.findById(id)
        .map(planta -> {
          // Atualizar o nome, se fornecido
          if (nome != null && !nome.equals(planta.getNome())) {
            planta.setNome(nome);
          }

          // Atualizar a data de aquisição, se fornecida
          if (dataDeAquisicao != null && !dataDeAquisicao.equals(planta.getDataDeAquisicao())) {
            planta.setDataDeAquisicao(dataDeAquisicao);
          }

          // Verificar se a imagem foi enviada
          if (imagem != null && !imagem.isEmpty()) {
            try {
              // Defina o caminho onde a imagem será salva
              String caminhoImagem = "uploads/" + imagem.getOriginalFilename();

              // Salvar a imagem no diretório
              Path caminho = Paths.get(caminhoImagem);
              Files.copy(imagem.getInputStream(), caminho, StandardCopyOption.REPLACE_EXISTING);

              // Atualizar a planta com o caminho da imagem
              planta.setCaminhoFoto(caminhoImagem);
            } catch (IOException e) {
              return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                  .body("Erro ao salvar a imagem: " + e.getMessage());
            }
          }

          // Salvar a planta com as atualizações
          Planta plantaAtualizada = repository.save(planta);
          return ResponseEntity.ok(plantaAtualizada); // Retorna a planta atualizada com o tipo correto
        })
        .orElse(ResponseEntity.notFound().build()); // Se a planta não for encontrada, retorna 404
  }

  // 5. Deletar uma planta (DELETE /plantas/{id})
  @DeleteMapping("/{id}")
  public ResponseEntity<?> deletarPlanta(@PathVariable Long id) {
    return repository.findById(id)
        .map(planta -> {
          // Verificar se existe caminho de foto e excluir o arquivo
          if (planta.getCaminhoFoto() != null && !planta.getCaminhoFoto().isEmpty()) {
            try {
              // Criar um objeto Path para o arquivo de imagem
              Path caminhoImagem = Paths.get(planta.getCaminhoFoto());

              // Excluir o arquivo de imagem
              Files.deleteIfExists(caminhoImagem);
            } catch (IOException e) {
              return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                  .body("Erro ao excluir o arquivo de imagem: " + e.getMessage());
            }
          }

          // Agora, excluir a planta do banco de dados
          repository.delete(planta);
          return ResponseEntity.noContent().build();
        })
        .orElse(ResponseEntity.notFound().build());
  }
}
