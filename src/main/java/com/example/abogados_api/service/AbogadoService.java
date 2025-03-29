package com.example.abogados_api.service;

import com.example.abogados_api.model.Abogado;
import com.example.abogados_api.repository.AbogadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AbogadoService {

    @Autowired
    private AbogadoRepository abogadoRepository;

    public List<Abogado> obtenerTodosLosAbogados() {
        return abogadoRepository.findAll();
    }

    public Optional<Abogado> obtenerAbogadoPorId(Long id) {
        return abogadoRepository.findById(id);
    }

    public Abogado guardarAbogado(Abogado abogado) {
        return abogadoRepository.save(abogado);
    }

    public Abogado actualizarAbogado(Long id, Abogado detallesAbogado) {
        Abogado abogado = abogadoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Abogado no encontrado"));
        abogado.setNombre(detallesAbogado.getNombre());
        abogado.setEspecialidad(detallesAbogado.getEspecialidad());
        abogado.setExperiencia(detallesAbogado.getExperiencia());
        return abogadoRepository.save(abogado);
    }

    public void eliminarAbogado(Long id) {
        abogadoRepository.deleteById(id);
    }
}
