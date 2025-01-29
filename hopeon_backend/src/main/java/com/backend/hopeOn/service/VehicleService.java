package com.backend.hopeOn.service;

import com.backend.hopeOn.domain.Vehicle;
import com.backend.hopeOn.generic.HOResponse;

import java.util.List;

public interface VehicleService {
    HOResponse<List<Vehicle>> findAll();
    HOResponse<List<Vehicle>> findAllAssignable();
    HOResponse<Vehicle> findById(Long id);
    HOResponse<Vehicle> save(Vehicle vehicle);
    HOResponse<Vehicle> update(Vehicle vehicle);
    HOResponse<String> delete(Long id);
}
