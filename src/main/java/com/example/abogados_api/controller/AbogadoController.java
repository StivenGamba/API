package com.example.abogados_api.controller;

import com.example.abogados_api.model.Abogado;
import com.example.abogados_api.service.AbogadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/abogados")
public class AbogadoController {

    @Autowired
    private AbogadoService abogadoService;

    @GetMapping
    public List<Abogado> obtenerTodosLosAbogados() {
        return abogadoService.obtenerTodosLosAbogados();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Abogado> obtenerAbogadoPorId(@PathVariable Long id) {
        return abogadoService.obtenerAbogadoPorId(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Abogado crearAbogado(@RequestBody Abogado abogado) {
        return abogadoService.guardarAbogado(abogado);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Abogado> actualizarAbogado(@PathVariable Long id, @RequestBody Abogado detallesAbogado) {
        return ResponseEntity.ok(abogadoService.actualizarAbogado(id, detallesAbogado));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarAbogado(@PathVariable Long id) {
        abogadoService.eliminarAbogado(id);
        return ResponseEntity.noContent().build();
    }
}
