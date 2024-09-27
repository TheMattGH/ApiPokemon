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
@Table (name = "TLogin")
@Getter
@Setter
public class Login {
    
    @Id
    @Column(name = "LOG_Id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "LOG_User", length = 20, nullable = false)
    private String user;

    @Column(name = "LOG_Pass", length = 40, nullable = false)
    private String pass;

    @Column(name = "LOG_FechaCreacion", nullable = false)
    private LocalDateTime fechaCreacion;

    @Column(name = "LOG_Cliente", nullable = false)
    private int cliente;

    @Column(name = "LOG_Estado", nullable = false)
    private int estado;

    @Column(name = "LOG_FechaUltimaActivacion", nullable = false)
    private LocalDateTime fechaUltimaActivacion;

    @Column(name = "LOG_Pokemon", nullable = false)
    private int pokemon;
    
}
