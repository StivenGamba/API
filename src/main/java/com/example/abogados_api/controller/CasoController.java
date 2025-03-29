package com.example.abogados_api.controller;

import com.example.abogados_api.model.Caso;
import com.example.abogados_api.service.CasoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/casos")
public class CasoController {

    @Autowired
    private CasoService casoService;

     @GetMapping
    public List<Caso> obtenerTodosLosCasos() {
        return casoService.obtenerTodosLosCasos();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Caso> obtenerCasoPorId(@PathVariable Long id) {
        return casoService.obtenerCasoPorId(id)
                .map(caso -> ResponseEntity.ok().body(caso))
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<Caso> crearCaso(@RequestBody Caso nuevoCaso) {
        Caso casoGuardado = casoService.guardarCaso(nuevoCaso);
        return ResponseEntity.status(HttpStatus.CREATED).body(casoGuardado);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Caso> actualizarCaso(@PathVariable Long id, @RequestBody Caso detallesCaso) {
        try {
            Caso casoActualizado = casoService.actualizarCaso(id, detallesCaso);
            return ResponseEntity.ok(casoActualizado);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminarCaso(@PathVariable Long id) {
        casoService.eliminarCaso(id);
        return ResponseEntity.noContent().build();
    }
}
