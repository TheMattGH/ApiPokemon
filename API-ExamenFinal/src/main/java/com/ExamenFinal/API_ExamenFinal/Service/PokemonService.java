/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.Service;

import com.ExamenFinal.API_ExamenFinal.DAO.ApiPokemon;
import com.ExamenFinal.API_ExamenFinal.DAO.PokemonDAO;
import com.ExamenFinal.API_ExamenFinal.Model.AsignacionRespuesta;
import com.ExamenFinal.API_ExamenFinal.Model.Pokemon;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author usuario
 */
@Service
public class PokemonService {

    @Autowired
    public PokemonDAO pokemonDAO;

    @Autowired
    RestTemplate restTemplate;

    @Value("${api.pokemon.url}")
    private String URL_POKEMON;

    public List<Pokemon> listarPokemonActivo() {
        return pokemonDAO.ConsultaPokemonActivo();
    }

    public AsignacionRespuesta asignarPokemon() {
        try {
            List<Pokemon> pokemonActivo = pokemonDAO.ConsultaPokemonActivo();
            if (pokemonActivo.isEmpty()) {
                ResponseEntity<HashMap<String, Object>> respuestaAPI = restTemplate.exchange(
                        URL_POKEMON,
                        HttpMethod.GET,
                        null,
                        new ParameterizedTypeReference<HashMap<String, Object>>() {
                }
                );

                ArrayList<HashMap<String, String>> Apokemon = (ArrayList<HashMap<String, String>>) respuestaAPI.getBody().get("results");

                for (HashMap<String, String> inPKM : Apokemon) {
                    Pokemon pokemon = new Pokemon();
                    pokemon.setNombrePokemon(inPKM.get("name"));
                    pokemon.setFechaRegistro(LocalDateTime.now());
                    pokemon.setEstado(1);
                    pokemonDAO.save(pokemon);
                }
                return new AsignacionRespuesta(pokemonDAO.ConsultaPokemonActivo());
            } else {
                return new AsignacionRespuesta("Pokemones ya asignados");
            }
        } catch (Exception e) {
            System.out.println("Error al asignar pokemones " + e.getMessage());
            return new AsignacionRespuesta("Error al asignar pokemones " + e.getMessage());
        }
    }

    public String limpiarBasePokemon() {
        try {
            List<Pokemon> pokemon = pokemonDAO.ConsultaPokemonActivo();
            if (pokemon.isEmpty()) {
                return "No existen pokemones que limpiar";
            } else {
                for (Pokemon Apokemon : pokemon) {
                    Apokemon.setEstado(3);
                    pokemonDAO.save(Apokemon);
                }
                return "Los pokemones se limpiaron correctamente";
            } 
        } catch (Exception e) {
            return "Error al tratar de limpiar los pokemones " + e.getMessage();
        }
    }
}
