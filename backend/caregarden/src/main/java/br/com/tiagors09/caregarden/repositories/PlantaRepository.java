package br.com.tiagors09.caregarden.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.tiagors09.caregarden.models.Planta;

@Repository
public interface PlantaRepository extends JpaRepository<Planta, Long> {
}
