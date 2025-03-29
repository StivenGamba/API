package com.example.abogados_api.repository;

import com.example.abogados_api.model.Abogado;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AbogadoRepository extends JpaRepository<Abogado, Long> {
}
