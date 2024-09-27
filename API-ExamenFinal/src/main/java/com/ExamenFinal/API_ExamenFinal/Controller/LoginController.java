/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ExamenFinal.API_ExamenFinal.Controller;
import com.ExamenFinal.API_ExamenFinal.DTO.CambioLoginDTO;
import com.ExamenFinal.API_ExamenFinal.DTO.LoginDTO;
import com.ExamenFinal.API_ExamenFinal.Model.Login;
import com.ExamenFinal.API_ExamenFinal.Service.LoginService;
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
@RequestMapping ("/Login")
public class LoginController {
    
    @Autowired
    public LoginService loginService;
    
    @GetMapping ("/Listar")
    public List<Login> listarLogin() {
        return loginService.listarActivos();
    }
    
    @PostMapping ("/CrearLogin")
    public Login crearLogin (@RequestBody LoginDTO login) {
        return loginService.crearLogin(login);
    }
    
    @PutMapping ("/Activar")
    public String habilitarLogin (@RequestBody CambioLoginDTO login) {
        try {
            return loginService.habilitarLogin(login);
        } catch (Exception e) {
            return "Error al activar login " + e.getMessage();
        }
    }
    
    @PutMapping ("/Desactivar")
    public String deshabilitarLogin (@RequestBody CambioLoginDTO login) {
        try {
            return loginService.deshabilitarLogin(login);
        } catch (Exception e) {
            return "Error al desactivar login " + e.getMessage();
        }
    }
}
