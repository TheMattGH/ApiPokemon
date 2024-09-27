/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.DTO;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.time.LocalDate;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author usuario
 */
@Getter
@Setter
public class ClienteDTO {
    
    private String identificacion;
    
    private String nombreCompleto;
    
    private String telefono;
    
    private String correo;
    
    @JsonFormat (pattern = "dd-MM-yyyy")
    private LocalDate fechaNacimiento;
    
    private String usuario;
    
    private String pass;
    
}
