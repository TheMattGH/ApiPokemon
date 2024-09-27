/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.DAO;

import com.ExamenFinal.API_ExamenFinal.Model.Login;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author usuario
 */
public interface LoginDAO extends JpaRepository<Login, Integer>{
    
    @Query (value = "select est. * from TLogin est where est.LOG_Estado = ?1", nativeQuery = true)
    List <Login> ConsultaLoginActivo (@Param ("Id") Integer pId);
    
    @Procedure(procedureName = "SP_CambioEstadoLogin")
    void actualizarEstadoLogin(@Param("LOG_Id") Integer idLogin, @Param("LOG_Estado") Integer estado);
    
}
