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
import java.time.LocalDate;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author usuario
 */
@Entity
@Table (name = "TCliente")
@Getter
@Setter
public class Cliente {
    
    @Id
    @Column (name = "CLI_Id", nullable = false)
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @Column (name = "CLI_TipoIdentificacion", nullable = false)
    private int tipoIndenticacion;
    
    @Column (name = "CLI_Identificacion", length = 20, nullable = false)
    private String identificacion;
    
    @Column (name = "CLI_ApellidoPaterno",length = 20, nullable = false)
    private String apellidoPaterno;
    
    @Column (name = "CLI_ApellidoMaterno", length = 20, nullable = true)
    private String apellidoMaterno;
    
    @Column (name = "CLI_Nombre1", length = 20, nullable = false)
    private String nombre1;
    
    @Column (name = "CLI_Nombre2", length = 20, nullable = true)
    private String nombre2;
    
    @Column (name = "CLI_Telefono", length = 10, nullable = false)
    private String telefono;
    
    @Column (name = "CLI_Correo", length = 20, nullable = false)
    private String correo;
    
    @Column (name = "CLI_FechaNacimiento", nullable = false)
    private LocalDate fechaNacimiento;
    
    @Column (name = "CLI_Estado", nullable = false)
    private int estado;
    
}
