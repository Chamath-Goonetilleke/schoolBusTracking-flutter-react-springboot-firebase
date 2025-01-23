package com.backend.hopeOn.controller;

import com.backend.hopeOn.service.DriverService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/driver")
@RequiredArgsConstructor
public class DriverControllerImpl implements DriverController{
    //private final DriverService driverService;
}
