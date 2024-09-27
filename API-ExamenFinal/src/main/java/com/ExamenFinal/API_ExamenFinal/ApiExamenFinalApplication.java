package com.ExamenFinal.API_ExamenFinal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class ApiExamenFinalApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiExamenFinalApplication.class, args);
	}

        @Bean
        RestTemplate restTemplate() {
            return new RestTemplate();
        }
}
