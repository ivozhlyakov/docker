package ru.ivozhlyakov.docker.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Main {

    @GetMapping("/index")
    public String hello() {
        return "Docker completed!!!";
    }
}
