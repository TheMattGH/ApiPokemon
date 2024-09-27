/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.DAO;

import com.ExamenFinal.API_ExamenFinal.Model.Cliente;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author usuario
 */
public interface ClienteDAO extends JpaRepository<Cliente, Integer>{
    
    @Query (value = "select est. * from TCliente est where est.CLI_Estado = ?1", nativeQuery = true)
    List <Cliente> ConsultaClienteActivo (@Param ("Id") Integer pId);
    
    @Procedure(procedureName = "SP_EliminarCliente")
    void EliminarCliente(@Param("CLI_Id") Integer idCliente);
    
}
