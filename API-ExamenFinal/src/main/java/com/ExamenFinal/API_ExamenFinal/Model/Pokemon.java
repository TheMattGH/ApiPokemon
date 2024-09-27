/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.Model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author usuario
 */
@Entity
@Table (name = "TPokemon")
@Getter
@Setter
public class Pokemon {
    
    @Id
    @Column(name = "PKM_Id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "PKM_NombrePokemon", length = 50, nullable = false)
    private String nombrePokemon;

    @Column(name = "PKM_FechaRegistro", nullable = false)
    private LocalDateTime fechaRegistro;

    @Column(name = "PKM_Estado", nullable = false)
    private int estado;
    
}
