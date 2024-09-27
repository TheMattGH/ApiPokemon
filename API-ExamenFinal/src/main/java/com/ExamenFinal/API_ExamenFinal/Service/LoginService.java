/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.Service;

import com.ExamenFinal.API_ExamenFinal.DAO.ClienteDAO;
import com.ExamenFinal.API_ExamenFinal.DAO.LoginDAO;
import com.ExamenFinal.API_ExamenFinal.DAO.PokemonDAO;
import com.ExamenFinal.API_ExamenFinal.DTO.CambioLoginDTO;
import com.ExamenFinal.API_ExamenFinal.DTO.LoginDTO;
import com.ExamenFinal.API_ExamenFinal.Model.Cliente;
import com.ExamenFinal.API_ExamenFinal.Model.Login;
import com.ExamenFinal.API_ExamenFinal.Model.Pokemon;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author usuario
 */
@Service
public class LoginService {
  
    @Autowired
    public LoginDAO loginDao;
    
    @Autowired
    public ClienteDAO clienteDAO;
    
    @Autowired
    public PokemonDAO pokemonDAO;
    
    public List<Login> listarActivos(){
        return loginDao.ConsultaLoginActivo(1);
    }
    
    public Login crearLogin(LoginDTO login) {
        
        try {
            List<Pokemon> pokemon = pokemonDAO.ConsultaPokemonActivo();
            if(pokemon.isEmpty()) {
                return null;
            }
            Cliente cliente = clienteDAO.findById(login.getCliente()).get();
            if(cliente.getEstado() == 1) {
                Login nuevoLogin = new Login();
                nuevoLogin.setUser(login.getUser());
                nuevoLogin.setPass(login.getPass());
                nuevoLogin.setCliente(login.getCliente());
                nuevoLogin.setFechaCreacion(LocalDateTime.now());
                nuevoLogin.setEstado(2);
                nuevoLogin.setFechaUltimaActivacion(LocalDateTime.now());
                Random r = new Random();
                int numPokemones = pokemon.size();
                int numAsignarPokemon = r.nextInt(numPokemones);
                Pokemon asignarPokemon = pokemon.get(numAsignarPokemon);
                nuevoLogin.setPokemon(asignarPokemon.getId());
                return loginDao.save(nuevoLogin);
            }else {
                return null;
            }
        } catch (Exception e) {
            System.out.println("Error al crer el login " + e.getMessage());
            return null;
        }
    } 
    
    public String habilitarLogin(CambioLoginDTO login) {
            try {
                Login activarLogin = loginDao.findById(login.getIdLogin()).get();
                if(activarLogin.getEstado() != 1) {
                    loginDao.actualizarEstadoLogin(login.getIdLogin(), 1);
                    return "El login con id " + login.getIdLogin()+ " se activo correctamente";
                }else{
                    return "El login con id " + login.getIdLogin()+ " se encuentra activo";
                }
            } catch (Exception e) {
                System.out.println("Error al activar login " + e.getMessage());
                return null;
            }
        }
    
    public String deshabilitarLogin(CambioLoginDTO login) {
            try {
                Login desactivarLogin = loginDao.findById(login.getIdLogin()).get();
                if(desactivarLogin.getEstado() != 2) {
                    loginDao.actualizarEstadoLogin(login.getIdLogin(), 2);
                    return "El login con id " + login.getIdLogin()+ " se se desactivo correctamente";
                }else{
                    return "El login con id " + login.getIdLogin()+ " se encuentra desactivo";
                }
            } catch (Exception e) {
                System.out.println("Error al desactivar login " + e.getMessage());
                return null;
            }
        }
    
}
