/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.Model;

import java.util.List;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author usuario
 */
@Getter
@Setter
public class AsignacionRespuesta {
    
    private String respuesta;
    private List<Pokemon> pokemon;

    public AsignacionRespuesta(String respuesta) {
        this.respuesta = respuesta;
        this.pokemon = null;
    }

    public AsignacionRespuesta(List<Pokemon> pokemon) {
        this.respuesta = "Pokemones asignados correctamente";
        this.pokemon = pokemon;
    }
    
}
