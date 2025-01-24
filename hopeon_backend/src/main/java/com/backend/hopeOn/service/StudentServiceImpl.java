package com.backend.hopeOn.service;

import com.backend.hopeOn.domain.Student;
import com.backend.hopeOn.entity.Vehicle;
import com.backend.hopeOn.enums.UserType;
import com.backend.hopeOn.generic.HOException;
import com.backend.hopeOn.generic.HOResponse;
import com.backend.hopeOn.repository.StudentRepository;
import com.backend.hopeOn.repository.UserRepository;
import com.backend.hopeOn.repository.VehicleRepository;
import com.backend.hopeOn.util.PasswordHashingUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class StudentServiceImpl implements StudentService{
    private final UserRepository userRepository;
    private final StudentRepository studentRepository;
    private final VehicleRepository vehicleRepository;

    @Override
    public HOResponse<List<Student>> findAll() {

        List<Student> studentList = studentRepository.findAllByActiveIsTrue().stream().map(this::StudentEntityToDomainMapper).toList();

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

        com.backend.hopeOn.entity.Student newStudent = userRepository.save(DomainToEntityMapper(student));

        HOResponse<Student> response =  new HOResponse<>();
        response.setStatus(HttpStatus.OK.value());
        response.setObject(StudentEntityToDomainMapper(newStudent));
        response.setMessage("Student saved successfully");

        return response;
    }

    @Override
    public HOResponse<Student> assignVehicle(Long id, Long vehicleId) {

        Optional<com.backend.hopeOn.entity.Student> optionalStudent = studentRepository.findByIdAndActiveIsTrue(id);
        if(optionalStudent.isEmpty()){
            throw new HOException("Student not found");
        }

        Optional<Vehicle> optionalVehicle = vehicleRepository.findByIdAndActiveIsTrue(vehicleId);
        if(optionalVehicle.isEmpty()){
            throw new HOException("Vehicle not found");
        }

        com.backend.hopeOn.entity.Student existingStudent = optionalStudent.get();
        Vehicle vehicle = optionalVehicle.get();

        existingStudent.setVehicle(vehicle);

        com.backend.hopeOn.entity.Student updatedStudent = studentRepository.save(existingStudent);

        HOResponse<Student> response = new HOResponse<>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Vehicle assigned successfully");
        response.setObject(StudentEntityToDomainMapper(updatedStudent));

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

    public Student StudentEntityToDomainMapper(com.backend.hopeOn.entity.Student studentEntity) {
        if (studentEntity == null) {
            return null;
        }

        Student studentDomain = new Student();
        studentDomain.setId(studentEntity.getId());
        studentDomain.setEmail(studentEntity.getEmail());
        studentDomain.setType(studentEntity.getType());
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

        PasswordHashingUtil passwordHashingUtil = new PasswordHashingUtil();

        studentEntity.setRegNo(studentDomain.getRegNo());
        studentEntity.setEmail(studentDomain.getEmail());
        studentEntity.setPassword(passwordHashingUtil.hashPassword(studentDomain.getPassword()));
        studentEntity.setType(UserType.STUDENT);
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
