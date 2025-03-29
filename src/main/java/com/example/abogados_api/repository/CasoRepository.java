package com.example.abogados_api.repository;

import com.example.abogados_api.model.Caso;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CasoRepository extends JpaRepository<Caso, Long> {
}
