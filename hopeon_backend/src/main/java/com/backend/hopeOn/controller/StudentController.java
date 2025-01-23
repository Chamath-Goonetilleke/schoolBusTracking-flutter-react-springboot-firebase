package com.backend.hopeOn.controller;

import com.backend.hopeOn.domain.Student;
import com.backend.hopeOn.generic.HOResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

public interface StudentController {

    @GetMapping("/findAll")
    @ResponseBody
    HOResponse<List<Student>> findAll();

    @PostMapping()
    @ResponseBody
    HOResponse<Student> save(@RequestBody Student student);

}
