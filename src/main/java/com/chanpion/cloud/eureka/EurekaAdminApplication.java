package com.chanpion.cloud.eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class EurekaAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(EurekaAdminApplication.class, args);
    }

}
