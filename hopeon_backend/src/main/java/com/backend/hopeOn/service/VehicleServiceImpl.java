package com.backend.hopeOn.service;

import com.backend.hopeOn.domain.Student;
import com.backend.hopeOn.domain.Vehicle;
import com.backend.hopeOn.entity.Driver;
import com.backend.hopeOn.generic.HOException;
import com.backend.hopeOn.generic.HOResponse;
import com.backend.hopeOn.repository.VehicleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class VehicleServiceImpl implements VehicleService {

    private final VehicleRepository vehicleRepository;
    private final StudentServiceImpl studentService;

    @Override
    public HOResponse<List<Vehicle>> findAll() {
        List<Vehicle> vehicleList = vehicleRepository.findAllByActiveIsTrue().stream().map(this::EntityToDomainMapper).toList();

        HOResponse<List<Vehicle>> response = new HOResponse<>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Vehicle list fetched successfully");
        response.setObject(vehicleList);

        return response;
    }

    @Override
    public HOResponse<Vehicle> findById(Long id) {
        com.backend.hopeOn.entity.Vehicle vehicleEntity = vehicleRepository.findByIdAndActiveIsTrue(id)
                .orElseThrow(() -> new HOException("Vehicle not found"));

        HOResponse<Vehicle> response = new HOResponse<>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Vehicle fetched successfully");
        response.setObject(EntityToDomainMapper(vehicleEntity));

        return response;
    }

    @Override
    public HOResponse<Vehicle> save(Vehicle vehicle) {
        com.backend.hopeOn.entity.Vehicle newVehicle = vehicleRepository.save(DomainToEntityMapper(vehicle));

        HOResponse<Vehicle> response = new HOResponse<>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Vehicle saved successfully");
        response.setObject(EntityToDomainMapper(newVehicle));

        return response;
    }

    @Override
    public HOResponse<Vehicle> update(Vehicle vehicle) {
        com.backend.hopeOn.entity.Vehicle existingVehicle = vehicleRepository.findById(vehicle.getId())
                .orElseThrow(() -> new HOException("Vehicle not found"));

        com.backend.hopeOn.entity.Vehicle updatedVehicle = vehicleRepository.save(DomainToEntityMapper(vehicle));

        HOResponse<Vehicle> response = new HOResponse<>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Vehicle updated successfully");
        response.setObject(EntityToDomainMapper(updatedVehicle));

        return response;
    }

    @Override
    public HOResponse<String> delete(Long id) {
        com.backend.hopeOn.entity.Vehicle vehicleEntity = vehicleRepository.findById(id)
                .orElseThrow(() -> new HOException("Vehicle not found"));

        vehicleEntity.setActive(false);
        vehicleRepository.save(vehicleEntity);

        HOResponse<String> response = new HOResponse<>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Vehicle deleted successfully");
        response.setObject("Vehicle ID " + id + " deleted");

        return response;
    }

    private Vehicle EntityToDomainMapper(com.backend.hopeOn.entity.Vehicle vehicleEntity) {
        if (vehicleEntity == null) {
            return null;
        }

        Vehicle vehicleDomain = new Vehicle();
        vehicleDomain.setId(vehicleEntity.getId());
        vehicleDomain.setVehicleNo(vehicleEntity.getVehicleNo());
        vehicleDomain.setType(vehicleEntity.getType());
        vehicleDomain.setColor(vehicleEntity.getColor());
        vehicleDomain.setBrand(vehicleEntity.getBrand());
        vehicleDomain.setModel(vehicleEntity.getModel());
        vehicleDomain.setSeatCount(vehicleEntity.getSeatCount());
        vehicleDomain.setAvailableSeatCount(vehicleEntity.getAvailableSeatCount());
        vehicleDomain.setRoute(vehicleEntity.getRoute());
        vehicleDomain.setImageUrl(vehicleEntity.getImageUrl());
        vehicleDomain.setLocations(vehicleEntity.getLocations());
        vehicleDomain.setActive(vehicleEntity.getActive());

        if (vehicleEntity.getDriver() != null) {
            vehicleDomain.setDriverId(vehicleEntity.getDriver().getId());
            vehicleDomain.setDriverName(vehicleEntity.getDriver().getNicNo());
        }

        List<Student> studentList = new ArrayList<>();
        vehicleEntity.getStudentList().forEach(student -> studentList.add(studentService.StudentEntityToDomainMapper(student)));

        vehicleDomain.setStudentList(studentList);

        return vehicleDomain;
    }

    private com.backend.hopeOn.entity.Vehicle DomainToEntityMapper(Vehicle vehicleDomain) {
        if (vehicleDomain == null) {
            return null;
        }

        com.backend.hopeOn.entity.Vehicle vehicleEntity = new com.backend.hopeOn.entity.Vehicle();

        if(vehicleDomain.getId() != null){
            vehicleEntity.setId(vehicleDomain.getId());
        }
        vehicleEntity.setVehicleNo(vehicleDomain.getVehicleNo());
        vehicleEntity.setType(vehicleDomain.getType());
        vehicleEntity.setColor(vehicleDomain.getColor());
        vehicleEntity.setBrand(vehicleDomain.getBrand());
        vehicleEntity.setModel(vehicleDomain.getModel());
        vehicleEntity.setSeatCount(vehicleDomain.getSeatCount());
        vehicleEntity.setAvailableSeatCount(vehicleDomain.getAvailableSeatCount());
        vehicleEntity.setRoute(vehicleDomain.getRoute());
        vehicleEntity.setImageUrl(vehicleDomain.getImageUrl());
        vehicleEntity.setLocations(vehicleDomain.getLocations());
        vehicleEntity.setActive(vehicleDomain.getActive());

        if (vehicleDomain.getDriverId() != null) {
            Driver driver = new Driver();
            driver.setId(vehicleDomain.getDriverId());
            vehicleEntity.setDriver(driver);
        }

        return vehicleEntity;
    }
}
