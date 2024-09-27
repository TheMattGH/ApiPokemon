/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.Controller;

import com.ExamenFinal.API_ExamenFinal.Model.AsignacionRespuesta;
import com.ExamenFinal.API_ExamenFinal.Model.Pokemon;
import com.ExamenFinal.API_ExamenFinal.Service.PokemonService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author usuario
 */
@RestController
@RequestMapping ("/Pokemon")
public class PokemonController {
    
    @Autowired
    public PokemonService pokemonService;
    
    @GetMapping ("/Listar")
    public List<Pokemon> listarPokemon() {
       return pokemonService.listarPokemonActivo();
    }
    
    @GetMapping ("/Asignar")
    public AsignacionRespuesta asignarPokemon() {
        return pokemonService.asignarPokemon();
    }
    
    @DeleteMapping ("/Eliminar")
    public String eliminarPokemon() {
        return pokemonService.limpiarBasePokemon();
    }
    
}
