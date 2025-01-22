package com.backend.hopeOn.controller;

import com.backend.hopeOn.service.GradeClassService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/grade-class")
@RequiredArgsConstructor
public class GradeClassControllerImpl implements GradeClassController {
    private final GradeClassService gradeClassService;
}
