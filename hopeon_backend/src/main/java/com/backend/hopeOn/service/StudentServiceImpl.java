package com.backend.hopeOn.service;

import com.backend.hopeOn.domain.Student;
import com.backend.hopeOn.generic.HOException;
import com.backend.hopeOn.generic.HOResponse;
import com.backend.hopeOn.repository.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StudentServiceImpl implements StudentService{
    private final StudentRepository studentRepository;
    @Override
    public HOResponse<List<Student>> findAll() {

        List<Student> studentList = studentRepository.findAllByActiveIsTrue().stream().map(this::EntityToDomainMapper).toList();

        HOResponse<List<Student>> response = new HOResponse<>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Student List get successfully");
        response.setObject(studentList);

        return response;
    }

    @Override
    public HOResponse<Student> findById(Long id) {
        return null;
    }

    @Override
    public HOResponse<List<Student>> search(Student studentSearch) {
        return null;
    }

    @Override
    public HOResponse<Student> save(Student student) {
        if(!StringUtils.hasText(student.getRegNo())){
            throw new HOException("Student registration number cannot be empty");
        }
        if(!StringUtils.hasText(student.getFullName())){
            throw new HOException("Student name cannot be empty");
        }
        if(!StringUtils.hasText(student.getGrade())){
            throw new HOException("Student grade cannot be empty");
        }
        if(!StringUtils.hasText(student.getStudentClass())){
            throw new HOException("Student class cannot be empty");
        }
        if(!StringUtils.hasText(student.getParentName())){
            throw new HOException("Student parent name be empty");
        }
        if(!StringUtils.hasText(student.getContactNo())){
            throw new HOException("Student contact no cannot be empty");
        }

        com.backend.hopeOn.entity.Student newStudent = studentRepository.save(DomainToEntityMapper(student));

        HOResponse<Student> response =  new HOResponse<>();
        response.setStatus(HttpStatus.OK.value());
        response.setObject(EntityToDomainMapper(newStudent));
        response.setMessage("Student saved successfully");

        return response;
    }

    @Override
    public HOResponse<Student> update(Student student) {
        return null;
    }

    @Override
    public HOResponse<String> delete(Long id) {
        return null;
    }

    private Student EntityToDomainMapper(com.backend.hopeOn.entity.Student studentEntity) {
        if (studentEntity == null) {
            return null;
        }

        Student studentDomain = new Student();
        studentDomain.setId(studentEntity.getId());
        studentDomain.setRegNo(studentEntity.getRegNo());
        studentDomain.setFullName(studentEntity.getFullName());
        studentDomain.setGrade(studentEntity.getGrade());
        studentDomain.setStudentClass(studentEntity.getStudentClass());
        studentDomain.setParentName(studentEntity.getParentName());
        studentDomain.setContactNo(studentEntity.getContactNo());
        studentDomain.setGender(studentEntity.getGender());
        studentDomain.setAge(studentEntity.getAge());
        studentDomain.setLocation(studentEntity.getLocation());
        studentDomain.setImageUrl(studentEntity.getImageUrl());
        studentDomain.setActive(studentEntity.getActive());

        if (studentEntity.getVehicle() != null) {
            studentDomain.setVehicleId(studentEntity.getVehicle().getId());
            studentDomain.setVehicleNo(studentEntity.getVehicle().getVehicleNo());
        }

        return studentDomain;
    }
    private com.backend.hopeOn.entity.Student DomainToEntityMapper(Student studentDomain) {
        if (studentDomain == null) {
            return null;
        }

        com.backend.hopeOn.entity.Student studentEntity = new com.backend.hopeOn.entity.Student();

        studentEntity.setRegNo(studentDomain.getRegNo());
        studentEntity.setFullName(studentDomain.getFullName());
        studentEntity.setGrade(studentDomain.getGrade());
        studentEntity.setStudentClass(studentDomain.getStudentClass());
        studentEntity.setParentName(studentDomain.getParentName());
        studentEntity.setContactNo(studentDomain.getContactNo());
        studentEntity.setGender(studentDomain.getGender());
        studentEntity.setAge(studentDomain.getAge());
        studentEntity.setLocation(studentDomain.getLocation());
        studentEntity.setImageUrl(studentDomain.getImageUrl());
        if(studentDomain.getActive() != null){
            studentEntity.setActive(studentDomain.getActive());
        }else{
            studentEntity.setActive(false);
        }

        return studentEntity;
    }


}
