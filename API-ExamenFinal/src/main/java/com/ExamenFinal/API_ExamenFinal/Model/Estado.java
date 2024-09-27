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
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author usuario
 */
@Entity
@Table (name = "TEstado")
@Getter
@Setter
public class Estado {
    
    @Id
    @Column(name = "EST_Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "EST_Nombre", length = 50, nullable = false)
    private String nombre;

    @Column(name = "EST_Activo", nullable = false)
    private int activo;

    @Column(name = "EST_Descripcion", length = 50, nullable = true)
    private String descripcion;
    
}
