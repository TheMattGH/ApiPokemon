/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.Controller;

import com.ExamenFinal.API_ExamenFinal.DAO.ClienteDAO;
import com.ExamenFinal.API_ExamenFinal.DTO.ClienteDTO;
import com.ExamenFinal.API_ExamenFinal.DTO.ClienteSinLoginDTO;
import com.ExamenFinal.API_ExamenFinal.DTO.EliminarClienteDTO;
import com.ExamenFinal.API_ExamenFinal.Model.Cliente;
import com.ExamenFinal.API_ExamenFinal.Service.ClienteService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author usuario
 */
@RestController
@RequestMapping ("/Cliente")
public class ClienteController {
    
    @Autowired
    private ClienteService clienteService;
    
    @GetMapping ("/Listar")
    public List<Cliente> listarCliente() {
        return clienteService.listarActivos();
    }
   
    @PostMapping ("/Registrar")
    public Cliente registrarCliente (@RequestBody ClienteDTO cliente) {
        return clienteService.registrarCliente(cliente);
    }
        
    @PostMapping ("/RegistrarSinLogin")
    public Cliente registrarCliente (@RequestBody ClienteSinLoginDTO clienteSl) {
        return clienteService.clienteSinLogin(clienteSl);
    }
    
    @PutMapping("/Eliminar")
    public String eliminarCliente(@RequestBody EliminarClienteDTO cliente) {
        try {
            return clienteService.eliminarCliente(cliente.getIdCliente());
        } catch (Exception e) {
            return "Error al eliminar el cliente " + e.getMessage();
        }
    }
}
    

