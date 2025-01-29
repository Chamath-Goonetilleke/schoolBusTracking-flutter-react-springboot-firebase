package com.backend.hopeOn.controller;

import com.backend.hopeOn.domain.Vehicle;
import com.backend.hopeOn.generic.HOResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;

public interface VehicleController {

    @GetMapping("/findAll")
    @ResponseBody
    HOResponse<List<Vehicle>> findAll();

    @GetMapping("/findAllAssignable")
    @ResponseBody
    HOResponse<List<Vehicle>> findAllAssignable();

    @GetMapping("/{id}")
    @ResponseBody
    HOResponse<Vehicle> findById(@PathVariable Long id);

    @PostMapping()
    @ResponseBody
    HOResponse<Vehicle> save(@RequestBody Vehicle vehicle);

    @PutMapping()
    @ResponseBody
    HOResponse<Vehicle> update(@RequestBody Vehicle vehicle);

    @DeleteMapping("/{id}")
    @ResponseBody
    HOResponse<String> delete(@PathVariable Long id);
}
