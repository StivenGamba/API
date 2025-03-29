package com.example.abogados_api.model;

import com.fasterxml.jackson.annotation.JsonValue;

public enum Estado {
    ABIERTO("Abierto"),
    EN_PROCESO("En Proceso"),
    CERRADO("Cerrado");

    private String estado;

    Estado(String estado) {
        this.estado = estado;
    }

    @JsonValue 
    @Override
    public String toString() {
        return this.estado;
    }

    public static Estado fromString(String estado) {
        for (Estado e : Estado.values()) {
            if (e.estado.equalsIgnoreCase(estado)) {
                return e;
            }
        }
        throw new IllegalArgumentException("Estado no válido: " + estado);
    }
}
