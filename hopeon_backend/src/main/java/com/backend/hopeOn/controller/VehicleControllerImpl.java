package com.backend.hopeOn.controller;

import com.backend.hopeOn.service.VehicleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/vehicle")
@RequiredArgsConstructor
public class VehicleControllerImpl implements VehicleController{
    //private VehicleService vehicleService;
}
