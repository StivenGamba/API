package com.example.abogados_api.service;

import com.example.abogados_api.model.Caso;
import com.example.abogados_api.repository.CasoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CasoService {

    @Autowired
    private CasoRepository casoRepository;


    public List<Caso> obtenerTodosLosCasos() {
        return casoRepository.findAll();
    }

    public Optional<Caso> obtenerCasoPorId(Long id) {
        return casoRepository.findById(id);
    }
    public Caso guardarCaso(Caso caso) {
        return casoRepository.save(caso);
    }


    public Caso actualizarCaso(Long id, Caso detallesCaso) {
        Caso caso = casoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Caso no encontrado"));

        caso.setNombreCaso(detallesCaso.getNombreCaso());
        caso.setDescripcion(detallesCaso.getDescripcion());
        caso.setFechaInicio(detallesCaso.getFechaInicio());
        caso.setFechaFin(detallesCaso.getFechaFin());
        caso.setEstado(detallesCaso.getEstado());
        caso.setIdAbogado(detallesCaso.getIdAbogado());

        return casoRepository.save(caso);
    }

    public void eliminarCaso(Long id) {
        casoRepository.deleteById(id);
    }
}

//spring-boot:run