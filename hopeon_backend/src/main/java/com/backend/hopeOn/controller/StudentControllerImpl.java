package com.backend.hopeOn.controller;

import com.backend.hopeOn.service.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/student")
@RequiredArgsConstructor
public class StudentControllerImpl implements StudentController{
    private final StudentService studentService;
}
