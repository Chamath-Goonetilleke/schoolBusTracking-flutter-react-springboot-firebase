package com.backend.hopeOn.service;

import com.backend.hopeOn.domain.Driver;
import com.backend.hopeOn.generic.HOResponse;

import java.util.List;

public interface DriverService {
    HOResponse<List<Driver>> findAll();
    HOResponse<Driver> findById(Long id);
    HOResponse<List<Driver>> search(Driver driverSearch);
    HOResponse<Driver> assignVehicle( Long id, Long vehicleId);
    HOResponse<Driver> save(Driver driver);
    HOResponse<Driver> update(Driver driver);
    HOResponse<String> delete(Long id);
}
