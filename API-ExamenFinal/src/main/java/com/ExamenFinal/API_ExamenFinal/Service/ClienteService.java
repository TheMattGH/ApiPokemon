/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.Service;

import com.ExamenFinal.API_ExamenFinal.Model.Cliente;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ExamenFinal.API_ExamenFinal.DAO.ClienteDAO;
import com.ExamenFinal.API_ExamenFinal.DAO.LoginDAO;
import com.ExamenFinal.API_ExamenFinal.DAO.PokemonDAO;
import com.ExamenFinal.API_ExamenFinal.DTO.ClienteDTO;
import com.ExamenFinal.API_ExamenFinal.DTO.ClienteSinLoginDTO;
import com.ExamenFinal.API_ExamenFinal.Model.Login;
import com.ExamenFinal.API_ExamenFinal.Model.Pokemon;
import java.time.LocalDateTime;
import java.util.Random;

/**
 *
 * @author usuario
 */
@Service
public class ClienteService {

    @Autowired
    private ClienteDAO clienteDAO;
    
    @Autowired
    private LoginDAO loginDAO;
    
    @Autowired
    private PokemonDAO pokemonDAO;

    public List<Cliente> listarActivos() {
        return clienteDAO.ConsultaClienteActivo(1);
    }

    public Cliente registrarCliente(ClienteDTO cliente) {
        
        List<Pokemon> pokemon = pokemonDAO.ConsultaPokemonActivo();
        
        if(pokemonDAO.ConsultaPokemonActivo().isEmpty()) {
            return null;
        }
        
        Cliente nuevoCliente = new Cliente();
        nuevoCliente.setEstado(1);
        nuevoCliente.setIdentificacion(cliente.getIdentificacion());

        switch (cliente.getIdentificacion().length()) {
            case 10 -> nuevoCliente.setTipoIndenticacion(1); //Cedula
            case 13 -> nuevoCliente.setTipoIndenticacion(2); //RUC
            default -> nuevoCliente.setTipoIndenticacion(3); //Pasaporte
        }
        
        String [] nombres = cliente.getNombreCompleto().split(" ");
        
        switch (nombres.length) {
            case 4 -> {
                nuevoCliente.setNombre1(nombres[0]);
                nuevoCliente.setNombre2(nombres[1]);
                nuevoCliente.setApellidoPaterno(nombres[2]);
                nuevoCliente.setApellidoMaterno(nombres[3]);
            }
            case 3 -> {
                nuevoCliente.setNombre1(nombres[0]);
                nuevoCliente.setNombre2(nombres[1]);
                nuevoCliente.setApellidoPaterno(nombres[2]);
            }
            case 2 -> {
                nuevoCliente.setNombre1(nombres[0]);
                nuevoCliente.setApellidoPaterno(nombres[1]);
            }
            default -> {
                return null;
            }
        }
        
        nuevoCliente.setTelefono(cliente.getTelefono());
        nuevoCliente.setCorreo(cliente.getCorreo());
        nuevoCliente.setFechaNacimiento(cliente.getFechaNacimiento());
        
        Cliente guardarCliente = clienteDAO.save(nuevoCliente);
        
        Login nuevoLogin = new Login();
        nuevoLogin.setUser(cliente.getUsuario());
        nuevoLogin.setPass(cliente.getPass());
        nuevoLogin.setFechaCreacion(LocalDateTime.now());
        nuevoLogin.setCliente(guardarCliente.getId());
        nuevoLogin.setEstado(2);
        nuevoLogin.setFechaUltimaActivacion(LocalDateTime.now());
        
        Random r = new Random();
        int numPokemones = pokemon.size();
        int numAsignarPokemon = r.nextInt(numPokemones);
        Pokemon asignarPokemon = pokemon.get(numAsignarPokemon);
        nuevoLogin.setPokemon(asignarPokemon.getId());
        loginDAO.save(nuevoLogin);
        return guardarCliente;
    }
    
    public Cliente clienteSinLogin(ClienteSinLoginDTO clienteSl) {
        
        try {
            Cliente nuevoCliente = new Cliente();
            nuevoCliente.setTipoIndenticacion(clienteSl.getTipoIdentificacion());
            nuevoCliente.setIdentificacion(clienteSl.getIdentificacion());
            nuevoCliente.setNombre1(clienteSl.getNombre1());
            nuevoCliente.setNombre2(clienteSl.getNombre2());
            nuevoCliente.setApellidoPaterno(clienteSl.getApellidoPaterno());
            nuevoCliente.setApellidoMaterno(clienteSl.getApellidoMaterno());
            nuevoCliente.setTelefono(clienteSl.getTelefono());
            nuevoCliente.setCorreo(clienteSl.getCorreo());
            nuevoCliente.setFechaNacimiento(clienteSl.getFechaNacimiento());

            nuevoCliente.setEstado(4);

            Cliente guardarCliente = clienteDAO.save(nuevoCliente);
            return guardarCliente;
        } catch (Exception ex) {
            System.out.println("Error al crear cliente sin login " + ex.getMessage());
            return null;
        }
        
    }
   
    public String eliminarCliente(int idCliente) throws Exception {
        Cliente cliente = clienteDAO.findById(idCliente).orElseThrow(() -> new Exception("Cliente no encontrado"));
        if (cliente.getEstado() == 3) {
            return "El cliente con id " + cliente.getId() + " ya esta eliminado.";
        }
        cliente.setEstado(3);
        clienteDAO.save(cliente);
        return "Cliente con id " + cliente.getId() + " eliminado exitosamente.";
    }
    
}
