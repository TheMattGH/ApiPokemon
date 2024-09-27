/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.DAO;

import com.ExamenFinal.API_ExamenFinal.Model.Pokemon;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author usuario
 */
public interface PokemonDAO extends JpaRepository<Pokemon, Integer>{
    
    @Query(value = "select est.* from TPokemon est where est.PKM_Estado = 1", nativeQuery = true)
    List<Pokemon> ConsultaPokemonActivo();
    
}
