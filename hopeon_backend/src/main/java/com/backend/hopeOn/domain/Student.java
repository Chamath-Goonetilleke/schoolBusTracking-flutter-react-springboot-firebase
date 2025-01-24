package com.backend.hopeOn.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Student extends User{
    private String regNo;
    private String fullName;
    private String grade;
    private String studentClass;
    private String parentName;
    private String contactNo;
    private String gender;
    private Integer age;
    private String location;
    private String imageUrl;
    private Boolean active;
    private Long vehicleId;
    private String vehicleNo;
}
